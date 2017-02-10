#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Win32::TieRegistry(Delimiter=>'/');

my $path_value = $Registry->{'CUser/Environment//PATH'};

#   Does rule «prepend value with delimiter» always have to
#   be followed? It doesn't seem so:
die unless $path_value eq $Registry->{'CUser/Environment/PATH'};

#   Alternative way to get value:
die unless $path_value eq $Registry->{CUser}->{Environment}->{PATH};

say for (split ';', $path_value);
