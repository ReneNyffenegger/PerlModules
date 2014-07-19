use warnings;
use strict;

use DBI;
use DBD::Oracle;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

$dbh -> do ("drop table tq84_select_where_nvl");
$dbh -> do ("create table tq84_select_where_nvl (id number primary key, tx varchar2(20))");

my $sth = $dbh -> prepare ("insert into tq84_select_where_nvl (id, tx) values (?,?)") or die;

$sth -> execute(1, ''     );  # inserts null (in Oracle, that is!)
$sth -> execute(2, 'two'  );
$sth -> execute(3,  undef );  # inserts null
$sth -> execute(4, 'four' );

# ---

$sth = $dbh -> prepare ("select * from tq84_select_where_nvl where id = nvl(?, id)") or die;


$sth -> bind_columns( \my ($id, $tx) );

print "Print record with id=3\n";

$sth -> execute(3); # print record with id 3
while ($sth -> fetch) {
  printf "%2i %20s\n", $id, $tx || '';  # «|| ''» to prevent Use of uninitialized value $tx in printf at...
}

print "\nPrint all records, variant 1\n";

$sth -> execute('');
while ($sth -> fetch) {
  printf "%2i %20s\n", $id, $tx || '';
}


print "\nPrint all records, variant 2\n";

$sth -> execute(undef);
while ($sth -> fetch) {
  printf "%2i %20s\n", $id, $tx || '';
}

