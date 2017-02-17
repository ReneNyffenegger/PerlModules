#!/usr/bin/perl
use warnings;
use strict;

use Data::Inspect;

my $inspector = Data::Inspect->new;

my $text = 'ä é α せ';

print $inspector->p($text);
#
# "\303\244 \303\251 \316\261 \343\201\233"


   use utf8;
#  --------

my $other_text = 'ä é α せ';
print $inspector->p($other_text);

# "\x{e4} \x{e9} \x{3b1} \x{305b}"
