#!/usr/bin/perl
use warnings;
use strict;
use DBI;

my $db_file = '/tmp/write-while-reading.db';

unlink $db_file if -e $db_file;

my $dbh_writer = DBI->connect("dbi:SQLite:dbname=$db_file") or die "Could not create $db_file";
my $dbh_reader = DBI->connect("dbi:SQLite:dbname=$db_file") or die "Could not create $db_file";

#
#     Entering WAL mode so that readers don't block writers and
#     writers don't block readers.
#
enter_wal_mode($dbh_writer);
enter_wal_mode($dbh_reader);

#
#     Apparently, AutoCommit needs to be turned off
#     after entering WAL mode.
#
$dbh_writer->{AutoCommit} = 0;
#
# A reader does not really start a transaction.
# $dbh_reader->{AutoCommit} = 0;

#
# Uncomment the following two lines and get a dead lock.
#

$dbh_writer->do('begin transaction');
$dbh_writer->do('create table a (b, c)');

my $sth_insert = $dbh_writer->prepare('insert into a values(?, ?)');
$sth_insert->execute(1, 'one'  );
$sth_insert->execute(3, 'three');
$sth_insert->execute(5, 'five' );
$dbh_writer->do('commit');

my $sth_select = $dbh_reader->prepare('select * from a');

print "\n1st iteration\n";
$sth_select->execute;
while (my $r = $sth_select->fetchrow_hashref) {
  printf "  %2d %s\n", $r->{b}, $r->{c};

  $sth_insert->execute(2, 'two' ) if $r->{b} == 1;
  $sth_insert->execute(4, 'four') if $r->{b} == 3;
  $sth_insert->execute(6, 'six' ) if $r->{b} == 5;

  $dbh_writer->do('commit');
}

print "\n\n2nd iteration\n";
$sth_select = $dbh_reader->prepare('select * from a');
$sth_select->execute;
while (my $r = $sth_select->fetchrow_hashref) {
  printf "  %2d %s\n", $r->{b}, $r->{c};
}

# $dbh->do('commit');
$dbh_writer->disconnect;
$dbh_reader->disconnect;

sub enter_wal_mode {
  my $dbh = shift;

  my $sth = $dbh->prepare('pragma journal_mode = WAL');
  $sth->execute;
  my @r=$sth->fetchrow;

# pragma returns 'wal' if successful.
# die if pragma was not changed.
  die unless $r[0] eq 'wal';
}
