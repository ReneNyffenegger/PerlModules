use warnings;
use strict;

use DBI;

my $dbh = DBI->connect('dbi:SQLite:dbname=the.db') or die "Could not create the.db";

$dbh -> do ('create table foo (col_1 number, col_2 varchar)');

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
