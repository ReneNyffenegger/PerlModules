use warnings;
use strict;
use DBI;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;



$dbh -> do ('create table tq84_fetchrow_hashref (id number primary key, abc number, def varchar2(20))');

$dbh -> do ("insert into tq84_fetchrow_hashref 
  select 1,  42, 'foo' from dual union all
  select 2,   8, 'bar' from dual union all
  select 3, 998, 'baz' from dual ");

my $sth = $dbh -> prepare (
  'select * from tq84_fetchrow_hashref 
    where abc > ? or
          def = ?
  '
);


$sth -> execute(10, 'bar');

while (my $r = $sth->fetchrow_hashref) {
  printf("%5d %5d %s\n", $r->{ID}, $r->{ABC}, $r->{DEF});
}

$dbh -> do ('drop table tq84_fetchrow_hashref');

