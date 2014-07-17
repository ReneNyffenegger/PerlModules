use warnings;
use strict;

use feature 'say';

use Math::BigInt;
use Math::BigInt::Named;

my $num = new Math::BigInt::Named (42);

say $num -> name();
say $num -> name(language => 'de');
