use warnings;
use strict;
use DBI;

my $caption = shift;
die unless $caption;

my $dbh = DBI->connect('dbi:WMI:');

my $sth = $dbh->prepare("SELECT * FROM Win32_Process where Caption = '$caption'");
$sth->execute();

while (my $r = $sth->fetchrow) {
  printf("Terminating Process %6d \n", $r->{ProcessId});
  $r->Terminate();
}
