#!/usr/bin/perl
use warnings;
use strict;

use Data::Dumper;

use Geo::Coder::OSM;

my $geocoder = Geo::Coder::OSM -> new;

my $details = $geocoder -> geocode(location=>'Zurlindenstr. 215');
 
print Dumper($details);
#
#$VAR1 = {
#          'place_id' => '73788333',
#          'type' => 'company',
#          'boundingbox' => [
#                             '47.3746064',
#                             '47.3747684',
#                             '8.5139472',
#                             '8.5141898'
#                           ],
#          'lat' => '47.37469045',
#          'address' => {
#                         'house_number' => '215',
#                         'postcode' => '8003',
#                         'city' => 'Zurich',
#                         'country' => 'Switzerland',
#                         'county' => "Bezirk Z\x{fc}rich",
#                         'suburb' => 'Wiedikon',
#                         'road' => 'Zurlindenstrasse',
#                         'address29' => 'Sertis engineering GmbH',
#                         'state' => 'Zurich',
#                         'country_code' => 'ch'
#                       },
#          'lon' => '8.51406796717677',
#          'licence' => "Data \x{a9} OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright",
#          'class' => 'office',
#          'display_name' => "Sertis engineering GmbH, 215, Zurlindenstrasse, Sihlfeld, Wiedikon, Zurich, Bezirk Z\x{fc}rich, Zurich, 8003, Switzerland",
#          'importance' => '0.101',
#          'osm_id' => '39523637',
#          'osm_type' => 'way'
#        };
