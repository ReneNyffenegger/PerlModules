use warnings;
use strict;

use String::Similarity;

for my $word (qw(maintainance main maintainer maintain maintanance)) {

  printf "%-15s  %0.6f\n", $word, similarity('maintenance', $word);

}
__END__
maintainance     0.869565
main             0.533333
maintainer       0.761905
maintain         0.736842
maintanance      0.909091
