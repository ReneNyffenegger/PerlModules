#!/usr/bin/perl
use warnings;
use strict;

use GD::Graph::histogram;

my $data = [1,5,7,8,5,9,14,22,10,15,11,17,4,6,8,9,2,20,7,12,8,12,8,13,18,3,5,3,4,5,13,5,3,10,7,5,2,2,6];

my $graph = GD::Graph::histogram->new(400,400);

 $graph->set(
         x_label           => 'X Label',
         y_label           => 'Count',
         title             => 'A Simple Count Histogram Chart',
         x_labels_vertical =>  1,
         bar_spacing       => 10,
         histogram_bins    => 10,
#        histogram_type    =>'count',
         transparent       =>  0,
        )
        or warn $graph->error;

my $gd = $graph->plot($data) or die $graph->error;

open my $png, '>', 'plot.png';
binmode $png;
print $png $graph->gd->png;
close $png;
