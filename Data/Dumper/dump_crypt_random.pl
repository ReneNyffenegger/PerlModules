#!/usr/bin/perl
#
#  http://stackoverflow.com/a/5643298/180275

use warnings;
use strict;

use Data::Dumper;

use Crypt::Random qw(makerandom);

print Dumper(
#
#     So let's look at what makerandom actually returns.

      makerandom(Size => 256, Strength => 1)

#     Ah, a Math::Pari object
);

# Same thing, on command line
#   perl -MData::Dumper -MCrypt::Random=makerandom -e"print(Dumper(makerandom(Size => 256, Strength => 1)));"
