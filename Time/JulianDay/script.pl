#!/usr/bin/perl
use warnings;
use strict;

use Time::JulianDay;

# Dates are specified in the proleptic Gregorian calendar.
printf "July      20,  2016: %7d\n", julian_day( 2016,  6, 20);

printf "October   15,  1582: %7d\n", julian_day( 1582, 10, 15);
printf "October   14,  1582: %7d\n", julian_day( 1582, 10, 14); # Note, October 14th 1582 does not exist in the Gregorian calendar.
printf "October    4,  1582: %7d\n", julian_day( 1582, 10,  4);

printf "January    1, -4712: %7d\n", julian_day(-4712,  1,  1);
printf "November  25, -4713: %7d\n", julian_day(-4713, 11, 25);
printf "November  24, -4713: %7d\n", julian_day(-4713, 11, 24);
printf "November  23, -4713: %7d\n", julian_day(-4713, 11, 23);

printf "January    1,     1: %7d\n", julian_day(    1,  1,  1);
printf "December  31,     0: %7d\n", julian_day(    0, 12, 31);

printf "January    1,     0: %7d\n", julian_day(    0,  1,  1);
