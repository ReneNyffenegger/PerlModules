#!/usr/bin/perl
use warnings;
use strict;

use SVG;

my $svg= SVG->new(
   width =>1000,
   height=> 600
);

my $line_1 = $svg->line (
    id => 'line_1',
    x1 =>  30, y1 =>  30,
    x2 => 970, y2 => 570,
    style=>{
       'stroke'      =>'rgb(255, 127, 0)',
       'stroke-width'=>  15
    }
);
die unless $line_1->isa('SVG::Element');

my $line_2 = $svg->line (
    id => 'line_2',
    x1 => 970, y1 =>  30,
    x2 =>  30, y2 => 570,
);

$line_2->STYLE(
 'stroke'      =>'rgb( 63, 127, 255)',
 'stroke-width'=> 15);

my $svg_text = $svg -> xmlify;


open (my $svg_h, '>', 'script-out.svg') or die;
print $svg_h $svg_text;
close $svg_h;
