#!/usr/bin/perl
use warnings;
use strict;

use feature 'say';

use Time::Piece;

my $t1 = Time::Piece -> strptime ('01:50', '%H:%M');
my $t2 = Time::Piece -> strptime ('03:05', '%H:%M');

my $t_ = $t2 - $t1;  # The result is a Time::Seconds object.

say "Hours between: ", $t_ -> hours;
#
# Hours between: 1.25

# ---------------------------------

$t1 = Time::Piece -> strptime('1970-01-01 00:00:00', '%Y-%m-%d %H:%M:%S');
$t2 = Time::Piece -> strptime('2017-01-24 15:48:25', '%Y-%m-%d %H:%M:%S');

$t_ = $t2 - $t1;

say "Seconds between: ", $t_;
#
# Seconds between: 1485272905
