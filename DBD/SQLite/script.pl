#!/usr/bin/perl
use warnings;
use strict;

use DBI;

my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

#
#   Check, if table already exists:
#
my ($table_exists) = $dbh->selectrow_array ("select 1 from sqlite_master where type='table' and name='foo'");
if ($table_exists) {
  print "Table foo already exists\n";
}
else {
  print "Creating table foo\n";
  $dbh -> do ('create table foo (col_1 number, col_2 varchar)');
}


$dbh -> begin_work;

# Inserting values
# ----------------

my $sth = $dbh -> prepare('insert into foo values (:v1, :v2)');

$sth -> execute(1, 'one');
$sth -> execute(2, 'two');
$sth -> execute(3, 'three');
$sth -> execute(4, 'four');
$sth -> execute(5, 'five');

# Selecting values
# ----------------

$sth = $dbh -> prepare('select * from foo where col_1 > :v1 and col_2 like :v2');
$sth -> execute(1, '%o%');

while (my @r = $sth -> fetchrow_array) {
  printf ("%2d %s\n", @r);
}

$dbh -> commit;

$dbh -> disconnect;
