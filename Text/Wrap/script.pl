#!/usr/bin/perl
use warnings;
use strict;

use Text::Wrap;
use Text::Lorem;

my $lorem = Text::Lorem->new();
my @five_paragraphs = split "\n", $lorem->paragraphs(5);

$Text::Wrap::columns  = 60;
$Text::Wrap::unexpand =  0;
# $Text::Wrap::separator= "\n";

print wrap("      ", "  ", "$_"), "\n" for @five_paragraphs;
