#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Win32::TieRegistry;

my $software_key = $Registry -> {CUser} -> {Software};

say for (keys %$software_key);
