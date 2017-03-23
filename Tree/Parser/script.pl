#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Tree::Parser;
my $text = join "", <DATA>;

my $tree_parser = Tree::Parser->new($text);

# Each level has an indentation of two spaces:
my $space_indent = 2;
$tree_parser->useSpaceIndentedFilters($space_indent);

my $tree = $tree_parser->parse();
say ref($tree);
# Tree::Simple

$tree->traverse(sub {
  my $node = shift;
  say ('. ' x $node->getDepth() . $node->getNodeValue()); 
});



__DATA__
AAA
  A1
    a11
    a12
      a_1_2_1
  A2
    a21
BBB
  B1
  B2
  B3
    b31
    b32
      b_3_2_1
      b_3_2_2
    b33
CCC
DDD
  D1
    d01
EEE
  E1
  E2
    e21
    e22
      e_2_2_1
      e_2_2_2
      e_2_2_3
    e23
  E3
  E4
