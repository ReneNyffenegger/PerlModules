use warnings;
use strict;

use DBI;
use DBD::Oracle;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

$dbh -> do (q{create table tq84_dbi_test_tbl (
  col_1 number,
  col_2 varchar2(30),
  col_3 date
)});

$dbh -> do (q{
create or replace package tq84_dbi_test_pck as
  procedure proc(p1 number, p2 varchar2, p3 date := sysdate);
end tq84_dbi_test_pck;
});

$dbh -> do (q{
create or replace package body tq84_dbi_test_pck as
  procedure proc(p1 number, p2 varchar2, p3 date := sysdate) as
  begin
    insert into tq84_dbi_test_tbl values (p1, p2, p3);
  end proc;
end tq84_dbi_test_pck;
});

my $sth = $dbh->prepare(q{
begin
  tq84_dbi_test_pck.proc(:param_1, :param_2);
end;
});

$sth -> bind_param(':param_1', 42);
$sth -> bind_param(':param_2', 'fourty-two');
$sth -> execute;

$sth -> bind_param(':param_1', 0);
$sth -> bind_param(':param_2', 'zero');
$sth -> execute;

my $result = $dbh->selectall_arrayref(
  'select * from tq84_dbi_test_tbl',
  {Slice => {}}
);

print "\n";
for my $rec (@$result) {
  printf("  %2d %-30s %-10s\n", $rec->{COL_1}, $rec->{COL_2}, $rec->{COL_3});
}
print "\n";

$dbh->do('drop table tq84_dbi_test_tbl');
$dbh->do('drop package tq84_dbi_test_pck');
