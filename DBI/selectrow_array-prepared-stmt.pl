#!/usr/bin/perl
use warnings;
use strict;

use DBI;

unlink 'the.db' if -e 'the.db';
my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

$dbh -> do('create table tab (col text)');

my $sth = $dbh -> prepare('insert into tab values (?)');
$sth -> execute('one'  );
$sth -> execute('two'  );
$sth -> execute('three');
$sth -> execute('four' );
$sth -> execute('five' );
$sth -> execute('six'  );
$sth -> execute('seven');
$sth -> execute('eight');
$sth -> execute('nine' );
$sth -> execute('ten'  );
# $dbh -> commit;

$sth = $dbh -> prepare('select count(*), min(col) from tab where col > ?');

my @res = $dbh -> selectrow_array($sth, {}, 'f%');
printf "%d %s\n", @res;
#
# 9 five


@res = $dbh -> selectrow_array($sth, {}, 'l%');
printf "%d %s\n", @res;
#
# 7 nine


@res = $dbh -> selectrow_array($sth, {}, 't%');
printf "%d %s\n", @res;
#
# 3 ten
