use warnings;
use strict;
use feature 'say';

use Data::Translate;

my $t = new Data::Translate;

my $ae = 'ä';

my ($status, @hex) = $t -> a2h($ae);

say @hex; # c3a4     (c3 a4 is utf-8 for ä, the encoding of this file is utf-8).
