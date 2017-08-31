#!/usr/bin/perl
use warnings;
use strict;
use utf8;

use DBI;

unlink 'utf8.db' if -e 'utf8.db';

my $dbh = connect_db();

$dbh -> do ('create table utf8_test(txt)');

$dbh -> do ('insert into utf8_test values ("ä")');

my $sth = $dbh->prepare('insert into utf8_test values (?)');
$sth -> execute('ö');

$dbh->disconnect;

system ("sqlite3 utf8.db 'insert into utf8_test values(\"ü\")'");
system ('sqlite3 utf8.db "select * from utf8_test order by txt" > utf8.out');

open (my $out, '<:utf8', 'utf8.out');
my $line;
$line = <$out>; chomp $line; die unless $line eq 'ä';
$line = <$out>; chomp $line; die unless $line eq 'ö';
$line = <$out>; chomp $line; die unless $line eq 'ü';

sub connect_db {
  my $dbh = DBI->connect('dbi:SQLite:dbname=utf8.db') or die "Could not create utf8.db";
  return $dbh;
}
