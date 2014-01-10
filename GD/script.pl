use warnings;
use strict;
use GD;

my $img = new GD::Image(300, 300);

my $white = $img->colorAllocate( 255, 255, 255);
my $grey  = $img->colorAllocate( 100, 100, 100);       
my $red   = $img->colorAllocate( 255,   0,   0);      
my $blue  = $img->colorAllocate(   0,   0, 255);
my $green = $img->colorAllocate(   0, 255,   0);
my $trans = $img->colorAllocate(   1,   1,   1);

$img->transparent($trans);

$img->fill(0, 0, $grey);

$img->rectangle( 80, 120, 50, 70, $green);

$img->arc(50, 50, 95, 75, 0, 360, $blue);

$img->fill(50, 50, $red);

$img->line(200, 250, 180, 130, $blue);

open my $o, '>', 'c:/temp/gd.png';

binmode $o;
print $o $img->png;

close $o;
