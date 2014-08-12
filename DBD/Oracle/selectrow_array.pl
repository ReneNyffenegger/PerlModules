use warnings;
use strict;
use DBI;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

print "\n-----\nSelect one row only....\n\n";
for my $col ($dbh->selectrow_array("select owner, table_name from all_tables")) {
  print $col, "\n";
}

print "\n-----\nSelect one row and column only....\n\n";
my $result = $dbh->selectrow_array("select owner, table_name from all_tables");

print $result, "\n";

