#
#   See also http://www.adp-gmbh.ch/perl/gd/index.html
#
use warnings;
use strict;

use GD;

#  Use forward slashes!
my $ttf_path='/todo/fonts/OpenSans/OpenSans-Regular.ttf';

my $image = GD::Image->new(400, 400);
my $grey  = $image->colorAllocate(100, 100, 100);

# Background:
$image->fill(0, 0, $grey);

my $red   = $image->colorAllocate(255,  0,  0);

$image->stringFT($red, $ttf_path, 20, 3.141/2, 200, 300, "Here's the text.");

open  my $o, '>', "c:/temp/gd_ttf.png";
binmode  $o;
print    $o $image->png;
close    $o;
