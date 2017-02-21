#!/usr/bin/perl
use warnings;
use strict;
use utf8;

use Geo::OSM::Tiles ':all';
use LWP::Simple;

my $zoom = 15;

my $lat_zürich = 47 + 22/60;
my $lon_zürich =  8 + 33/60;

my $tile_x = lon2tilex($lon_zürich, $zoom);
my $tile_y = lat2tiley($lat_zürich, $zoom);
my $path   = tile2path($tile_x, $tile_y, $zoom);

my $url = "http://tile.openstreetmap.org/$path";

print "url $url\n";
getstore($url, "$zoom-$tile_x-$tile_y.png");
