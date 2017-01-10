#!/usr/bin/perl
use warnings;
use strict;

use File::LibMagic;

use File::Spec;
use Cwd;

my $lm = new File::LibMagic;

print $lm -> describe_filename ($0         ), "\n"; # a /usr/bin/perl script, ASCII text executable
print $lm -> describe_filename ('README.md'), "\n"; # ASCII text
