use warnings;
use strict;
use feature 'say';

use String::Random;

my $rndstr = String::Random->new;

print "\nrandregex\n---------\n";
say $rndstr->randregex('[A-Z][a-z]{4,9} [A-Z][a-z]{4,9} \d\d') for (1..10);

print "\nrandpattern\n-----------\n";
say $rndstr->randpattern('CcccccnCcccccc!') for (1..10);
