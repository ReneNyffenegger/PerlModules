#!/usr/bin/perl
use warnings;
use strict;

use DBI;

unlink 'the.db' if -e 'the.db';
my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

$dbh -> do('create table tab(col)');

my $sth = $dbh -> prepare('insert into tab values (?)');
$sth -> execute('foo');
$sth -> execute('bar');
$sth -> execute('baz');

my @res = $dbh -> selectrow_array('select count(*), min(col), max(col) from tab'); 
printf "%d %s %s\n", @res;
#
# 3 bar foo


# Using bind variables:
#
@res = $dbh -> selectrow_array('select count(*), min(col), max(col) from tab where col like ?', {}, 'b%'); 
printf "%d %s %s\n", @res;
#
# 2 bar baz
