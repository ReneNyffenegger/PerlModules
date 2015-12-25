use warnings;
use strict;
use Const::Fast;
use feature 'say';

const my $one => 1;
const my $two => 2;

say $one + $two;

# $one = 5; # Modification of a read-only value attempted
