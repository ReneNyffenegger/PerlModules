#!/usr/bin/perl
use warnings;
use strict;
use DBI;

my $db_file = '/tmp/write-while-reading.db';

unlink $db_file if -e $db_file;

my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file") or die "Could not create $db_file";
$dbh->{AutoCommit} = 1;

$dbh->do('create table a (b, c)');

my $sth_insert = $dbh->prepare('insert into a values(?, ?)');
$dbh->do('begin transaction');
$sth_insert->execute(1, 'one'  );
$sth_insert->execute(3, 'three');
$sth_insert->execute(5, 'five' );
$dbh->do('commit');

my $sth_select = $dbh->prepare('select * from a order by b');

print "\n1st iteration\n";
$sth_select->execute;
while (my $r = $sth_select->fetchrow_hashref) {
  printf "  %2d %s\n", $r->{b}, $r->{c};

  $sth_insert->execute(2, 'two' ) if $r->{b} == 1;
  $sth_insert->execute(4, 'four') if $r->{b} == 3;
  $sth_insert->execute(6, 'six' ) if $r->{b} == 5;
}

print "\n\n2nd iteration\n";
$sth_select->execute;
while (my $r = $sth_select->fetchrow_hashref) {
  printf "  %2d %s\n", $r->{b}, $r->{c};
}
