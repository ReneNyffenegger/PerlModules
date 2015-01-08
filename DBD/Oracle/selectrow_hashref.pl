use warnings;
use strict;
use DBI;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

#  NOTE: selectrow_hashref returns one row only!
for my $col ($dbh->selectrow_hashref("select owner, table_name from all_tables")) {
  printf("%-30s  %-30s\n", $col -> {OWNER}, $col->{TABLE_NAME});
}

