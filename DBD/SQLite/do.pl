#!/usr/bin/perl
use warnings;
use strict;

use DBI;

unlink 'the.db' if -e 'the.db';

my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

$dbh -> do('create table table_one (a, b, c)');

my $sth = $dbh -> prepare('insert into table_one values (?, ?, ?)');
   $sth -> execute (   1 ,    2 ,    3 );
   $sth -> execute ('foo', 'bar', 'baz');


$dbh -> do ('create table table_two as select * from table_one');
