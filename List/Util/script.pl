use warnings;
use strict;

use List::Util qw(any min max pairmap reduce sum shuffle);
use List::MoreUtils;

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

# ---

my @a1 = qw(one   two     three four   );
my @a2 = qw(apple oranges pears bananas);

print join " - ", pairmap {"$a $b"} List::MoreUtils::mesh(@a1, @a2);
# one apple - two oranges - three pears - four bananas
