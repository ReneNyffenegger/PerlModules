#  Note the difference that the option
#     {Slice => {}}
#  makes!
#
use warnings;
use strict;

use DBI;
# use DBD::Oracle;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

# Without Slice option!

my $result = $dbh->selectall_arrayref(
  'select * from all_objects where rownum <= 10'
);

for my $rec (@$result) {
  printf "%-30s %-30s %-10s\n", $rec->[0], $rec->[1], $rec->[6];
}

print "\n\n\n";

# With Slice option!
#
my $result = $dbh->selectall_arrayref(
  'select * from all_objects where rownum <= 10',
  {Slice => {}}

);

for my $rec (@$result) {
  printf "%-30s %-30s %-10s\n", $rec->{OWNER}, $rec->{OBJECT_NAME}, $rec->{CREATED};
}

