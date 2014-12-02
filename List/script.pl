use warnings;
use strict;


use List::Gen '*';

# mapn
print mapn { "$_ : " . (join ' - ', @_[ 1 .. $#_ ]) . "\n" } 4 => qw(foo 1 2 3 bar 4 5 6 baz 7 8 9);
