#!/usr/bin/perl
use warnings;
use strict;

use PDF::API2;

use constant mm => 25.4 / 72;

my $pdf  = PDF::API2->new;
my $page = $pdf  -> page;
my $gfx  = $page -> gfx;

$gfx -> fillcolor('orange');
$gfx -> rect(70/mm, 150/mm, 60/mm, 60/mm);
$gfx -> fill;

$gfx -> fillcolor('darkblue');
$gfx -> circle( 70/mm, 150/mm, 20/mm);
$gfx -> circle(130/mm, 210/mm, 20/mm);
$gfx -> fill;

$pdf -> saveas('rectangles-and-circles.pdf');
$pdf -> end;
