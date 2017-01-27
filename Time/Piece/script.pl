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

my $t_1970 = Time::Piece -> strptime('1970-01-01 00:00:00', '%Y-%m-%d %H:%M:%S');
my $t_foo  = Time::Piece -> strptime('2017-01-24 15:48:25', '%Y-%m-%d %H:%M:%S');

my $secs_since_1970 = $t_foo - $t_1970;

say "Seconds between: ", $secs_since_1970;
#
# Seconds between: 1485272905

# ---------------------------------

my $t_bar = $t_1970 + $secs_since_1970;
print $t_bar -> ymd() . ' ' . $t_bar -> hms() . "\n";
#
# 2017-01-24 15:48:25
