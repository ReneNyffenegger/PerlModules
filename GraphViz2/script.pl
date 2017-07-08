#!/usr/bin/perl
use warnings;
use strict;

use GraphViz2;

my $graph = GraphViz2 -> new (
  edge   => {color => '#ff7700'},
  global => {directed => 1},
  graph  => {label => $0, rankdir => 'TB'},
# logger => $logger,
  node   => {shape => 'oval'},
);

my $nd_foo = $graph -> add_node(name=>'Foo', shape=>'circle', color=>'green');
my $nd_bar = $graph -> add_node(name=>'Bar'                 , color=>'blue' );

$graph -> add_edge(from => 'Foo', to => 'Bar');

my $format='pdf';
$graph -> run(format=>$format, output_file=>"script.$format");
