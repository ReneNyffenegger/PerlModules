#!/usr/bin/perl
use warnings;
use strict;

use File::Find;

my $level = 0;

find(
  {
     preprocess  => sub {$level ++; @_},
     postprocess => sub {$level --; @_},
     wanted      => sub {print '  ' x $level, $_, "\n"}
  },
  '..'
 );
