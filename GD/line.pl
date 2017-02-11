use warnings;
use strict;

use GD;

my $img = GD::Image->new(110, 110);

my $grey  = $img -> colorAllocate(100, 100, 100);
my $red   = $img -> colorAllocate(255,   0,   0);
my $blue  = $img -> colorAllocate(  0,   0, 255);

$img -> fill(0, 0, $grey);
$img -> trueColor(1);

$img -> line (10, 10, 20, 30, $red);

$img -> line (50, 50, 50, 100, $blue);

open (my $png, '>', 'line.png');
binmode $png;
print $png $img -> png;
close $png;

