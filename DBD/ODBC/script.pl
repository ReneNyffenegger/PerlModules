use warnings;
use strict;

use DBI;

my $username = shift;
my $password = shift;
my $database = shift;

my %attr=();
my $dbh = DBI->connect("dbi:ODBC:$database", $username, $password, \%attr) or die;

for my $r (@{$dbh->selectall_arrayref (
     "select table_name
        from information_schema.tables
       order by table_name")}) {

  print $r->[0], "\n";

}
