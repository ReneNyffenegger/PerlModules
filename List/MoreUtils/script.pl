use warnings;
use strict;

use List::MoreUtils;

my @array = (0,0,5,9,0,0,0,7,0,3,0,0);

# Get index of last non-null element in @array:
print List::MoreUtils::lastidx { $_ } @array
