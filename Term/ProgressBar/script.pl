#
#   http://stackoverflow.com/a/21300424/180275
#
use warnings;
use strict;

use Term::ProgressBar;

my $total = 50;
my $progress_bar = Term::ProgressBar->new($total);


for my $i (1 .. $total) {

  sleep (1);

  $progress_bar->update($i);

}
