use warnings;
use strict;

use Scalar::Util qw(blessed dualvar isdual readonly refaddr reftype tainted weaken isweak isvstring looks_like_number set_prototype);


my $dual  = dualvar 10, "foo";
print "is_dual: " . (isdual $dual) . "\n";
