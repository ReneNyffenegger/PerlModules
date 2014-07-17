use warnings;
use strict;
use Lingua::EN::Numbers qw(num2en num2en_ordinal);
use DBI;
use feature 'say';



my $db_dir = ".";

my $dbh = DBI->connect ("dbi:CSV:", "", "", { f_dir => $db_dir });

#
#   For valid datatypes see SQL::Dialects::CSV->get_config().
#

$dbh -> do ("create table csv_table (id integer, txt varchar(10), num real, blb blob)");

$dbh -> do ("insert into csv_table (id) values (1)");
$dbh -> do ("insert into csv_table values (2, 'two', 22.2, 'twenty-two')");
$dbh -> do ("update csv_table set txt = 'hello;world' num=42.2, blb='foo\nbar\nbaz' where id = 1");

# -------

my $sth = $dbh -> prepare ('insert into csv_table (id, txt, num, blb) values (?,?,?,?)');

for (my $id=3; $id<100; $id++) {
  $sth -> execute ($id, num2en($id), $id**2, num2en_ordinal($id));
}

# -------

$sth = $dbh -> prepare ("select * from csv_table where id % 10 = ?");
$sth -> execute(4); # Print records whose id end in 4.
$sth -> bind_columns( \my ($id, $txt, $num, $blb) );

while ($sth->fetch) {
  printf "  %2i  %20s  %4i  %20s\n", $id, $txt, $num, $blb;
}


say "check $db_dir/csv_table and press a key";

my $dummy = <STDIN>;

$dbh -> do ("drop table csv_table");
