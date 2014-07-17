use warnings;
use strict;
use feature 'say';

use DBI;



my $db_dir = ".";

my $dbh = DBI->connect ("dbi:CSV:", "", "", { f_dir => $db_dir });

#
#   For valid datatypes see SQL::Dialects::CSV->get_config().
#

$dbh -> do ("create table csv_table (id integer, txt varchar(10), num real, blb blob)");

$dbh -> do ("insert into csv_table (id) values (1)");
$dbh -> do ("insert into csv_table values (2, 'two', 22.2, 'twenty-two')");
$dbh -> do ("update csv_table set txt = 'hello;world' num=42.2, blb='foo\nbar\nbaz' where id = 1");

say "check $db_dir/csv_table and press a key";

my $dummy = <STDIN>;

$dbh -> do ("drop table csv_table");
