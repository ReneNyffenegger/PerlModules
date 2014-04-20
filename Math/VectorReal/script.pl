use warnings;
use strict;

use Math::VectorReal;
use Math::Trig;


#  Calculate angle between two vectors via the
#  dot product (aka matrix product)

my $s = vector(1,0 , 0);
my $t = vector(1,1 , 0);

my $dot =  $s . $t;

my $cos = $dot / $s->length / $t->length;

print "cos: $cos\n";

print "α = ", rad2deg(acos($cos)), "\n";
