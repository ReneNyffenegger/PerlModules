#!/usr/bin/perl
use warnings;
use strict;

use Text::Lorem;

my $lorem = Text::Lorem->new;

P ('Nine words'     , $lorem->words     (9));
P ('Three sentences', $lorem->sentences (3));
P ('Two paragraphs' , $lorem->paragraphs(2));

sub P {
  my $title = shift;
  my $text = shift;

  print "\n$title\n  ";

  $text =~ s/\n/\n  /g;
  $text =~ s/(.{50,}?) /$1\n  /g;

  print $text;

  print "\n";

}
