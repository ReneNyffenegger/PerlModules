#!/usr/bin/perl
use warnings;
use strict;
use 5.10.0;

use DBI;

my     $db = 'call_counter.db';
unlink $db if -f $db;

my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die "Could not create $db";

$dbh->do('
 create table tab (
   abc text
 )
') or die;

my $sth_ins = $dbh->prepare('insert into tab values (?)') or die;
$sth_ins -> execute('foo');
$sth_ins -> execute('foo');
$sth_ins -> execute('bar');
$sth_ins -> execute('baz');
$sth_ins -> execute('baz');

$dbh -> sqlite_create_function ('call_counter', 0, sub {
  state $cnt = 0;

  $cnt++;

  return $cnt;

}) or die;

  my $sth_sel = $dbh->prepare('
select
  abc,
      call_counter()      counter,
  sum(call_counter()) sum_counter
from
  tab
group by
  abc') or die;

  $sth_sel -> execute;

while (my $rec = $sth_sel->fetchrow_hashref) {
  printf "%s  %2d  %2d\n", $rec->{abc}, $rec->{counter}, $rec->{sum_counter};
}
