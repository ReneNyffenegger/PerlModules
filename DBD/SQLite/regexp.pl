#!/usr/bin/perl
use warnings;
use strict;

use DBI;

my $db = 'regexp.db';

unlink $db if -f $db;
my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die;

$dbh -> do ('create table tq84_regexp (col)');

my $sth_ins = $dbh->prepare('insert into tq84_regexp values(?)') or die;

$sth_ins -> execute('foo');
$sth_ins -> execute('forty-two: 42');

my $sth_sel = $dbh->prepare('select col from tq84_regexp where col regexp ?');

searchRegexp('\d');
searchRegexp('o');
searchRegexp('o+');

sub searchRegexp {
  my $regexp = shift;

  print "$regexp\n";
  $sth_sel->execute($regexp);

  while (my ($col_val) = $sth_sel->fetchrow_array) {
     print "  $col_val\n";
  }
  print "\n";
}
