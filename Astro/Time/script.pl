#!/usr/bin/perl
use warnings;
use strict;

use Astro::Time;

# Dates are specified in the proleptic Gregorian calendar.
printf "July      20,  2016: %7d\n", mjd2jd(cal2mjd( 20,  6, 2016));

printf "October   15,  1582: %7d\n", mjd2jd(cal2mjd( 15, 10, 1582));
printf "October   14,  1582: %7d\n", mjd2jd(cal2mjd( 14, 10, 1582)); # Note, October 14th 1582 does not exist in the Gregorian calendar.
printf "October    4,  1582: %7d\n", mjd2jd(cal2mjd(  4, 10, 1582));

printf "January    1, -4712: %7d\n", mjd2jd(cal2mjd(  1,  1,-4712));
printf "November  25, -4713: %7d\n", mjd2jd(cal2mjd( 25, 11,-4713));
printf "November  24, -4713: %7d\n", mjd2jd(cal2mjd( 24, 11,-4713));
printf "November  23, -4713: %7d\n", mjd2jd(cal2mjd( 23, 11,-4713));

printf "January    1,     1: %7d\n", mjd2jd(cal2mjd(  1,  1,    1));
printf "December  31,     0: %7d\n", mjd2jd(cal2mjd( 31, 12,    0));

printf "January    1,     0: %7d\n", mjd2jd(cal2mjd(  1,  1,    0));
