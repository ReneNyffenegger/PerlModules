#!/usr/bin/perl
use warnings;
use strict;

use Getopt::Long;
use DBI;

my $db = 'autocommit.db';

Getopt::Long::GetOptions(
    "new-db"               => \my $new_db,
    "autocommit"           => \my $autocommit,
    "no-autocommit"        => \my $no_autocommit,
    "commit-when-finished" => \my $commit_when_finished,
) or die;

unless (-e $db) {
  $new_db = 1;
}

if ($new_db) {
  if (-e $db) {
    unlink $db or die;
  }
}

my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die "Could not create $db";

if ($new_db) {
  $dbh -> do('create table t (v)') or die;
}
else {

  print "Values found in table\n  ";
  my @v = @{$dbh->selectall_arrayref('select v from t')};

  print join "\n  ", map {$_->[0]} @v;

}

if ($autocommit) {
  $dbh->{AutoCommit} = 1;
}
if ($no_autocommit) {
  $dbh->{AutoCommit} = 0;
}


my $sth = $dbh -> prepare('insert into t values (?)');

for (@ARGV) {
  $sth -> execute($_)
}


if ($commit_when_finished) {
  $sth -> commit;
}
