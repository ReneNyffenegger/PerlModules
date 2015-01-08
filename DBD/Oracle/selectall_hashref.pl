use warnings;
use strict;
use DBI;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

$dbh -> do ('create table tq84_selectall_hashref (id number primary key, abc number, def varchar2(20))');

$dbh -> do ("insert into tq84_selectall_hashref 
  select 1,  42, 'foo' from dual union all
  select 2,   8, 'bar' from dual union all
  select 3, 998, 'baz' from dual ");

my $result = $dbh->selectall_hashref(
  'select * from tq84_selectall_hashref where abc > ?',
   'ID',
    undef,
    10);

while (my ($id, $row) = each %$result ) {
  printf("%5d  %5d  %-20s\n", $id, $row->{ABC}, $row->{DEF});
}

$dbh -> do ('drop table tq84_selectall_hashref purge');
