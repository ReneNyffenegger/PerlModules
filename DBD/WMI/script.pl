use warnings;
use strict;
use DBI;

my $dbh = DBI->connect('dbi:WMI:');

my $sth = $dbh->prepare('SELECT * FROM Win32_Process');
$sth->execute();

while (my $r = $sth->fetchrow) {
  printf("%6d %-35s %-60s\n", $r->{ProcessId}, $r->{Caption}, $r->{ExecutablePath} || "<system>");

  for my $method ($r->{Methods_} -> in) {
     print "  Can call $method->{Name} on the object\n"
  };
}
