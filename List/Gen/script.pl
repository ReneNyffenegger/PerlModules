use warnings;
use strict;
use feature 'say';


use List::Gen '*';

# by # {{{

for my $x (every 3 => (1, 2, 3, 4, 5, 6, 7, 8, 9)) {
  say join " - ", @$x;
}
# 1 - 2 - 3
# 4 - 5 - 6
# 7 - 8 - 9

# }}}


# mapn # {{{
print "\n";
print mapn { "$_ : " . (join ' - ', @_[ 1 .. $#_ ]) . "\n" } 4 => qw(foo 1 2 3 bar 4 5 6 baz 7 8 9);
# foo : 1 - 2 - 3
# bar : 4 - 5 - 6
# baz : 7 - 8 - 9

print "\n";
# }}}

#range # {{{
my $rng = range 3, 30, 4;

say ref $rng;
# List::Gen::era::tor

print "\n";

say for @$rng;
# 3
# 7
# 11
# 15
# 19
# 23
# 27

print "\n";
$rng -> say;
# 3 7 11 15 19 23 27

print "\n";
say $rng -> str;
# 3 7 11 15 19 23 27

print "\n";

say while <$rng>;
# 3
# 7
# 11
# 15
# 19
# 23
# 27

# }}}
