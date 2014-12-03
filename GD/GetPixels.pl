use warnings;
use strict;

use Image::Magick;

my $image = Image::Magick->new or die;
my $read = $image -> Read('white-red-green-blue.png');

for (my $x=0; $x<4; $x++) {

  my @pixels = $image->GetPixels(
      width     => 1,
      height    => 1,
      x         => $x,
      y         => 0,
      map       =>'RGB',
      #normalize => 1
  );
  
  printf "%3d %3d %3d\n", $pixels[0] / 256, $pixels[1] / 256, $pixels[2] / 256;

}
