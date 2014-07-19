use warnings;
use strict;
use feature 'say';

use Lingua::EN::Numbers qw(num2en num2en_ordinal);

my $num = 42;

say num2en_ordinal($num);
say num2en        ($num);
