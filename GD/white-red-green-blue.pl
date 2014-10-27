#
#   http://stackoverflow.com/questions/26586918/how-do-i-get-the-correct-rgb-value-for-a-pixel-with-gd
#
use warnings;
use strict;

use GD;

GD::Image -> trueColor(1);

my $image = new GD::Image('white-red-green-blue.png') or die;

for (my $x=0; $x<4; $x++) {
  my $index = $image->getPixel($x, 0);
  my ($r,$g,$b) = $image->rgb($index);

  printf "%8d: %3d %3d %3d\n", $index, $r, $g, $b;
}
