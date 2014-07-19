use warnings;
use strict;

use Text::WagnerFischer qw(distance);


my @words     = qw(maintainance main maintainer maintain maintanance);

my @distances = distance('maintenance', @words);

for my $word (@words) {
  my $distance = shift @distances;
  printf ("%-15s  %2i\n", $word, $distance);
}

__END__
maintainance      2
main              7
maintainer        5
maintain          5
maintanance       1
