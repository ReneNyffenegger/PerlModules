#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Win32::TieRegistry;

my $path_value = $Registry->{CUser}->{Environment}->{PATH};

say for (split ';', $path_value);
