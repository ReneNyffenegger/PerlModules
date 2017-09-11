#!/usr/bin/perl
use warnings;
use strict;

use SVG;
use Math::Trig;

my $svg = SVG->new (
   width =>500,
   height=>500
);

my $nof_points = 19;
my $skip       =  5;

my $points = '';
for (my $i = 0; $i<=$nof_points; $i++) {

  my $x = 250 + sin(2*pi / $nof_points * $skip * $i) * 230;
  my $y = 250 + cos(2*pi / $nof_points * $skip * $i) * 230;

  $points .= ' ' if $points;
  $points .= "$x,$y";
}

$svg->polyline(
   points=>$points,
   style=>{
      'stroke'       => 'rgb(255, 127, 0)',
      'stroke-width' => '5px',
      'fill'         => 'none',
   }
);

my $svg_text = $svg->xmlify;
open (my $svg_h, '>', 'polyline.svg') or die;
print $svg_h $svg_text;
close $svg_h;
