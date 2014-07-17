use warnings;
use strict;

use Math::BigInt;
use Math::BigInt::Named;

my $num = new Math::BigInt::Named (42);

print $num -> name();
