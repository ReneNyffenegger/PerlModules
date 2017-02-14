#!/usr/bin/perl
use warnings;
use strict;
use Encode::Guess;

my $data_latin1 = "Ren\xc9";
my $data_utf8   = "Ren\x{c389}";

print guess_encoding($data_latin1, 'latin1'), "\n";
print guess_encoding($data_utf8  , 'latin1'), "\n";
