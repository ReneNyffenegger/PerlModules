#!/usr/bin/perl
use warnings;
use strict;

use Parse::RecDescent;

my $grammar_1 = q { #_{

  start    :  seq_1 seq_2

  seq_1    :   'A' 'B' 'C' 'D'         { print "seq_1: " . join (" ", @item[1..$#item]) . "\n" }
           |   'A' 'B' 'C' 'D' 'E' 'F' { print "seq_1: " . join (" ", @item[1..$#item]) . "\n" }

  seq_2    : character(s)

  character: /\w/                      { print "character: $item[1]\n" }

#_} };
my $grammar_2 = q { #_{

  start:  seq_1 seq_2

  seq_1    :  'A' 'B' 'C' 'D' 'E' 'F'
               { print "seq_1: " . join (" ", @item[1..$#item]) . "\n" }
            | 'A' 'B' 'C' 'D'
               { print "seq_1: " . join (" ", @item[1..$#item]) . "\n" }


  seq_2    : character(s)

  character: /\w/
               { print "character: $item[1]\n" }

#_} };

print "Parse with first grammar:\n";
parse($grammar_1);
print "\nParse with second grammar:\n";
parse($grammar_2);

sub parse { #_{
  my $grammar = shift;

  my $parser=Parse::RecDescent->new($grammar);
  
  $parser->start("A B C D E F G");

} #_}
