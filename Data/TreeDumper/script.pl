#!/usr/bin/perl
use warnings;
use strict;

use Data::TreeDumper;

my $hash = {x => 'eggs', y=>'why'};

my $var = {

  foo => ['one', 'two', {three=>333, four=>'444', five=>[1, 2, 3, 4, 5]}],
  bar => 42,
  baz => {banana=>'yellow', coffee => 'brown', snow=>'white'},
  f   => [sub {print 'hello'}, sub {print 'world'}, $hash],
  h   => $hash

};

print DumpTree($var);
# 
# |- bar = 42  [S1]
# |- baz  [H2]
# |  |- banana = yellow  [S3]
# |  |- coffee = brown  [S4]
# |  `- snow = white  [S5]
# |- f  [A6]
# |  |- 0 = CODE(0x1b12180)  [C7]
# |  |- 1 = CODE(0x1b12438)  [C8]
# |  `- 2  [H9]
# |     |- x = eggs  [S10]
# |     `- y = why  [S11]
# |- foo  [A12]
# |  |- 0 = one  [S13]
# |  |- 1 = two  [S14]
# |  `- 2  [H15]
# |     |- five  [A16]
# |     |  |- 0 = 1  [S17]
# |     |  |- 1 = 2  [S18]
# |     |  |- 2 = 3  [S19]
# |     |  |- 3 = 4  [S20]
# |     |  `- 4 = 5  [S21]
# |     |- four = 444  [S22]
# |     `- three = 333  [S23]
# `- h  [H24 -> H9]
