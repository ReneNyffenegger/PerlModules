#!/usr/bin/perl
use warnings;
use strict;

use Geo::Coordinates::Converter::LV03;

# Alte Sternwarte Bern
# https://tools.wmflabs.org/geohack/geohack.php?pagename=Sternwarten_Bern&language=de&params=46.951081_N_7.438637_E_dim:500_region:CH-BE_type:landmark&title=alte+Sternwarte+Bern
my ($lat, $lng) = Geo::Coordinates::Converter::LV03::y_x_2_lat_lng(600_000, 200_000);

printf "  %9.7f°  %9.7f°\n", $lat, $lng;
#
#  46.9510811°  7.4386372°

my ($y, $x) = Geo::Coordinates::Converter::LV03::lat_lng_2_y_x($lat, $lng);

printf "  %9.3f   %9.3f\n", $y, $x;
#
#  600000.346   199999.831
