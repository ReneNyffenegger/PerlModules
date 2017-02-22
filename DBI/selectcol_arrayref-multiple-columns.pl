#!/usr/bin/perl
use warnings;
use strict;

use DBI;

unlink 'the.db' if -e 'the.db';
my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

$dbh -> do('create table tab(col1, col2, col3)');

my $sth = $dbh -> prepare('insert into tab values (?, ?, ?)');
$sth -> execute('foo', 'one'  , 'abc');
$sth -> execute('bar', 'two'  , 'def');
$sth -> execute('baz', 'three', 'ghi');

my $colref =  $dbh -> selectcol_arrayref('select * from tab', {Columns=>[1, 2]});

for my $elem (@$colref) {
  print $elem, "\n";
}
# 
# foo
# one
# bar
# two
# baz
# three
