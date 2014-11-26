use warnings;
use strict;

use List::MoreUtils;

my @array = (0,0,5,9,0,0,0,7,0,3,0,0);

# Get index of last non-null element in @array:
print List::MoreUtils::lastidx { $_ } @array;
print "\n";

# ----

my @a1 = qw(one   two      three four   );
my @a2 = qw(apple oranages pears bananas);

print join " - ", List::MoreUtils::mesh(@a1, @a2);
# one - apple - two - oranages - three - pears - four - bananas
