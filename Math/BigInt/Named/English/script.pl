use warnings;
use strict;
use feature 'say';

use Math::BigInt;
use Math::BigInt::Named::English;

my $num = new Math::BigInt::Named::English (42);

say $num->name();
