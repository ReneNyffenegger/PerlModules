#!/usr/bin/perl
use warnings;
use strict;

use SVG;
use Math::Trig;

my $size_svg = 1000;

my $svg = SVG->new (
   width =>$size_svg,
   height=>$size_svg
);

for (1 .. 100) {

  my $angle = 2.0 * pi * rand;

  my $x = $size_svg / 2  + $size_svg * 0.30 * sin($angle) + 0.15 * $size_svg * rand;
  my $y = $size_svg / 2  + $size_svg * 0.30 * cos($angle) + 0.15 * $size_svg * rand;

  $svg->circle(
    cx => $x,
    cy => $y,
    r  => 8.0* rand() + 4,
    style=> {
       fill => sprintf('rgb(%d, %d, %d)', int(200*rand), int(200*rand), int(200*rand))
    }
  );

}
my $svg_text = $svg->xmlify;

open (my $svg_h, '>', 'circle.svg') or die;
print $svg_h $svg_text;
close $svg_h;
