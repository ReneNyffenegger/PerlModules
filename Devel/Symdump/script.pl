#!/usr/bin/perl
use warnings;
use strict;

use Devel::Symdump;

my  $VAR_ONE = 'foo';
our $VAR_TWO = 'bar';

my  $dump_pain = new Devel::Symdump 'main';

print join "\n", sort $dump_pain -> scalars;
