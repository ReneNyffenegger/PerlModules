use warnings;
use strict;

use feature 'say';

use Math::BigInt;
use Math::BigInt::Named;

my $num = Math::BigInt::Named->new(42);

say $num -> name();
say $num -> name(language => 'de');
