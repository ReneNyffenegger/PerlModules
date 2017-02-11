#!/usr/bin/perl
use warnings;
use strict;

use File::Type;

use File::Spec;
use Cwd;

my $ft = File::Type->new;

# Hmmm... Why does the .txt return «application/octet-stream»?
print $ft -> mime_type ($0                                            ), "\n"; # application/x-perl
print $ft -> mime_type (File::Spec->canonpath(cwd . '../../README.md')), "\n"; # application/octet-stream
print $ft -> mime_type (File::Spec->canonpath(cwd . '/file.txt'      )), "\n"; # application/octet-stream
