#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use DBI;

my $db = 'nulls.db';
unlink $db if -f $db;

my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die "Could not create $db";

$dbh -> do ("create table tq84_nulls (
  col_1     int,
  col_2     int not null
)");

my $sth = $dbh->prepare('insert into tq84_nulls values (?, ?)') or die;

  $sth -> execute (    1,     1);
  $sth -> execute (undef,     2);
# $sth -> execute (    2, undef); # NOT NULL constraint failed: tq84_not_null.col_2 
  $sth -> execute (    3,     3);
  $sth -> execute (undef,     4);
  $sth -> execute (    3,     7);



$sth = $dbh->prepare('select col_2 from tq84_nulls where col_1 = ? order by col_1, col_2');


say 'where col_1 = ?, execute (3)';
$sth -> execute(3);
while (my $r = $sth->fetchrow_hashref) {
  say $r->{col_2};
}
#
#  3
#  7

say 'where col_1 = ?, execute (undef)';
$sth -> execute(undef);
while (my $r = $sth->fetchrow_hashref) {
  say $r->{col_2};
}

say 'where col_1 is null';
$sth = $dbh->prepare('select col_2 from tq84_nulls where col_1 is null');
$sth -> execute;
while (my $r = $sth->fetchrow_hashref) {
  say $r->{col_2};
}
#
#  2
#  4


say 'col_1';
$sth = $dbh->prepare('select col_1 from tq84_nulls order by col_2');
$sth -> execute;
while (my $r = $sth->fetchrow_hashref) {
  say $r->{col_1} // 'null';
}
#
# 1
# null
# 3
# null
# 3
