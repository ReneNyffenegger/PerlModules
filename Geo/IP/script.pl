#!/usr/bin/perl
use warnings;
use strict;

use Geo::IP;

my $ipnr = shift or die;

my $geo_ip = Geo::IP->new(                                         GEOIP_STANDARD) or die;
my $city   = Geo::IP->open('/usr/local/share/GeoIP/GeoIPCity.dat', GEOIP_STANDARD) or die;

printf "%s (%s %s)\n",
  $geo_ip->country_name_by_addr ($ipnr),  # full country name
  $geo_ip->country_code_by_addr ($ipnr),  # ISO 3166 country code
  $geo_ip->country_code3_by_addr($ipnr);  #


my $cr = $city->record_by_addr($ipnr);

# my $rec = $geo_ip->record_by_addr($ipnr);
#
# print join "\n", keys %{$rec};
printf "City:      %s %s\n"     , $cr->{city}, $cr->{postal_code};
printf "Region:    %s %s\n"     , $cr->{region}, $cr->{region_name};
printf "Country:   %s (%s %s)\n", $cr->{country_name}, $cr->{country_code}, $cr->{country_code3};
printf "Continent: %s\n"        , $cr->{continent_code};
printf "lon/lat:   %s / %s\n"   , $cr->{longitude}, $cr->{latitude};
printf "Metrocde:  %s\n"        , $cr->{metro_code};
