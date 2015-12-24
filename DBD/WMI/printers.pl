use warnings;
use strict;
use DBI;

my $dbh = DBI->connect('dbi:WMI:');

my $sth = $dbh->prepare('SELECT * FROM Win32_Printer');
$sth->execute();

while (my $r = $sth->fetchrow) {
  printf("%s %s %s %-45s %-35s\n",
      $r->{Default} ? 'd' : ' ',
      $r->{Local}   ? 'l' : ' ',
      $r->{Hidden}  ? 'h' : ' ',
      $r->{Caption},
      $r->{DriverName});
}
