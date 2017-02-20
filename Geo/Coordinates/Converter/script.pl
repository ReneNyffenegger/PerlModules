#!/usr/bin/perl
use warnings;
use strict;

use Geo::Coordinates::Converter;

my $converter = Geo::Coordinates::Converter->new( lat => '35.65580', lng => '139.65580', datum => 'wgs84' );

my $geo_point = $converter -> convert(dms => 'tokyo');

printf "Lat: %s\n", $geo_point->lat;
printf "Lon: %s\n", $geo_point->lng;
printf "Datum: %s\n", $geo_point->datum;
printf "Format: %s\n", $geo_point->format;

$geo_point -> format('degree');
