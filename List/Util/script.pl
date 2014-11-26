use warnings;
use strict;

use List::Util qw(any min max reduce sum shuffle);

print "min: ", min (68, 38, 22, 42, 71, 57)  , "\n";
print "max: ", max (68, 38, 22, 42, 71, 57)  , "\n";
print "sum: ", sum (1, 1, 2, 3, 5, 8, 13, 21), "\n";

# ---- 

my @words = qw (zero one two three four five six seven eight nine ten);
my @shuffled = shuffle @words;
print join " - ", @shuffled;
print "\n";

# ----

print reduce {"$a - $b"} @words;
# zero - one - two - three - four - five - six - seven - eight - nine - ten
print "\n";

# ---

print "foo exists in list\n"   if any {$_ eq 'foo'  } @words;
print "seven exists in list\n" if any {$_ eq 'seven'} @words;
# seven exists in list

