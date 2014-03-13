use warnings; use strict;

use feature 'say';

use Time::Piece;

my $t1 = Time::Piece -> strptime ('01:50', '%H:%M');
my $t2 = Time::Piece -> strptime ('03:05', '%H:%M');


my $t_ = $t2 - $t1;

say "Hours between: ", $t_ -> hours;
