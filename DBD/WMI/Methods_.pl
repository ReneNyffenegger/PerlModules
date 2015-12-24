use warnings;
use strict;
use DBI;

my $dbh = DBI->connect('dbi:WMI:');

my $sth = $dbh->prepare('select * from Win32_Process') or die $!;
$sth->execute();

my $r = $sth->fetchrow;

print "Methods that can be called\n";
for my $method ($r->{Methods_} -> in) {
   print "  $method->{Name}\n"
};
