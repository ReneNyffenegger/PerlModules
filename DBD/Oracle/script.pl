use warnings;
use strict;

use DBI;
use DBD::Oracle;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

$dbh -> do ("create table tq84_dbi_oracle_table (id number primary key, tx varchar2(20))");

my $sth = $dbh -> prepare ("insert into tq84_dbi_oracle_table (id, tx) values (?,?)") or die;

for (my $i=0; $i<20; $i++) {
  $sth -> execute($i, '*' x $i);
}

# ---

$sth = $dbh -> prepare ("select * from tq84_dbi_oracle_table where mod(id, ?) = 0");
$sth -> execute(3); # print every 3rd record
$sth -> bind_columns( \my ($id, $tx) );

while ($sth -> fetch) {
  printf "%2i %20s\n", $id, $tx;
}

# ---

$dbh -> do ("drop table tq84_dbi_oracle_table");
