#!/usr/bin/perl
use warnings;
use strict;

use DBI;

unlink 'the.db' if -e 'the.db';
my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

$dbh -> do('create table tab (
  id    integer,
  col1  text,
  col2  text
)');

my $sth = $dbh -> prepare('insert into tab values (?, ?, ?)');
$sth -> execute(1, 'foo', 'one'  );
$sth -> execute(2, 'bar', 'two'  );
$sth -> execute(3, 'baz', 'three');

$sth = $dbh->prepare('select col1, col2 from tab where id > ?');
$sth -> execute(1);


#
#   fetchall_arrayref returns a reference to an array:
#   
    my $res = $sth->fetchall_arrayref;
    print '$res = ', ref $res, "\n";

#
#   Iterating over the returned reference's items (the records).
#
for my $rec (@{$res}) {
#
#   The recordes are stored in array references as well:
#
    print '$rec = ', ref $rec, "\n";

#
#   Print the selected values:
#
    printf "    %s %s\n", @{$rec};
}
