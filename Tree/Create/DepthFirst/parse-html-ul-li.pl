#!/usr/bin/perl
use warnings;
use strict;

use Tree::Create::DepthFirst;
use HTML::Parser;

my $depth = -1;
my $tree_creator = Tree::Create::DepthFirst->new();

my $html_parser = HTML::Parser->new(
  start_h       => [\&start_tag  , 'tag'  ],
  end_h         => [\&end_tag    , 'tag'  ],
  text_h        => [\&text       , 'text' ],
);

$html_parser->parse_file('parse-html-ul-li.html') or die;

my $tree_simple = $tree_creator->getTree();


$tree_simple->traverse(sub {
  my $node = shift;
  print "  " x $node->getDepth() . $node->getNodeValue() . "\n";
});

sub start_tag {
  my $tag = shift;
  
  $depth++ if ($tag eq 'ul');
}
sub end_tag {
  my $tag = shift;
  $depth-- if ($tag eq '/ul');
}
sub text {
  my $text = shift;
  $text =~ s/\s//g;

  $tree_creator->addNode($depth, $text) if $depth >= 0 and $text =~ /\w/;
}
