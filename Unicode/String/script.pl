use warnings;
use strict;
use feature 'say';

use Unicode::String qw(utf8 latin1 utf16le);
use Data::Translate;

my $d = Data::Translate->new;

my $x = "René";

say length($x); # 5

say $d -> a2h($x); # 152656ec3a9

my $l1 = latin1($x);

say $d -> a2h($l1);
