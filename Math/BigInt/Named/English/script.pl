use warnings;
use strict;
use feature 'say';

use Math::BigInt;
use Math::BigInt::Named::English;

my $num = Math::BigInt::Named::English->new(42);

say $num->name();
