#!/usr/bin/perl
use warnings;
use strict;

use GeoIP2::WebService::Client;

my $user_id     = shift or die;
my $license_key = shift or die;
my $ip          = shift;

$ip = 'me' unless $ip;

my $client = GeoIP2::WebService::Client->new(
    user_id     => $user_id,
    license_key => $license_key
) or die;

# my $country  = $client -> country (ip => 'me'); # returns a GeoIP2::Model::Country object
# my $city     = $client -> city    (ip => 'me'); # returns a GeoIP2::Model::City object
  my $insights = $client -> insights(ip => 'me'); # returns a GeoIP2::Model::Insights object


# my $continent_rec            = $country->continent                 ();
# my $country_rec              = $country->country                   ();
# my $maxmind_rec              = $country->maxmind                   ();
# my $registered_country_rec   = $country->registered_country        ();
# my $represented_country_rec  = $country->represented_country       ();
# my $traits_rec               = $country->traits                    ();

my $location_rec             = $insights->location                   ();
my $postal_rec               = $insights->postal                     ();
my $city_rec                 = $insights->city                       ();
my $continent_rec            = $insights->continent                  ();
my $country_rec              = $insights->country                    ();
my $maxmind_rec              = $insights->maxmind                    ();
my $registered_country_rec   = $insights->registered_country         ();
my $represented_country_rec  = $insights->represented_country        ();
my $traits_rec               = $insights->traits                     ();
my $subdivision_rec         = $insights->most_specific_subdivision   ();
# my $subdivisions_rec         = $insights->subdivisions             ();


print  "Location\n";
print  "-------------------\n";
printf "  Accuracy Radius:   %d\n", $location_rec->accuracy_radius              ();
printf "  Average Income:    %d\n", $location_rec->average_income               ();
printf "  Latitude:          %d\n", $location_rec->latitude                     ();
printf "  Longigutde:        %d\n", $location_rec->longitude                    ();
printf "  Metro Code:        %s\n", $location_rec->metro_code                   ();
printf "  Popul. Density:    %s\n", $location_rec->population_density           ();
printf "  Time Zone:         %s\n", $location_rec->time_zone                    ();

print  "Postal\n";
print  "-------------------\n";
print  "  Code:              %s\n", $postal_rec->code                           ();
print  "  Confidence         %s\n", $postal_rec->confidence                     ();

print  "City\n";
print  "--------------------\n";
printf "  Name:               %s\n", $city_rec->name                            ();
printf "  Geoname ID:         %s\n", $city_rec->geoname_id                      ();
printf "  Confidence:         %s\n", $city_rec->confidence                      ();

print  "Country\n";
print  "--------------------\n";
printf "  Name:               %s\n", $country_rec->name                         ();
printf "  ISO Code:           %s\n", $country_rec->iso_code                     ();
printf "  Geoname ID:         %s\n", $country_rec->geoname_id                   ();
printf "  Confidence:         %s\n", $country_rec->confidence                   ();

print  "Country [registered]\n";
print  "--------------------\n";
printf "  Name:               %s\n", $registered_country_rec->name              ();
printf "  ISO Code:           %s\n", $registered_country_rec->iso_code          ();
printf "  Geoname ID:         %s\n", $registered_country_rec->geoname_id        ();
printf "  Confidence:         %s\n", $registered_country_rec->confidence        ();

print  "Country [represented]\n";
print  "--------------------\n";
printf "  Name:               %s\n", $represented_country_rec->name             ();
printf "  ISO Code:           %s\n", $represented_country_rec->iso_code         ();
printf "  Geoname ID:         %s\n", $represented_country_rec->geoname_id       ();
printf "  Confidence:         %s\n", $represented_country_rec->confidence       ();
printf "  Type:               %s\n", $represented_country_rec->type             ();

print  "Continent\n";
print  "--------------------\n";
printf "  Name:               %s\n", $continent_rec->name                       ();
printf "  Code:               %s\n", $continent_rec->code                       ();
printf "  Geoname ID:         %s\n", $continent_rec->geoname_id                 ();

print  "Subdivision\n";
print  "--------------------\n";
printf "  Name:               %s\n", $subdivision_rec->name                     ();
printf "  ISO Code:           %s\n", $subdivision_rec->iso_code                 ();
printf "  Geoname ID:         %s\n", $subdivision_rec->geoname_id               ();
printf "  Confidence:         %s\n", $subdivision_rec->confidence               ();

print  "Traits\n";
print  "--------------------\n";
printf "  Autonom. Syst. Nr:  %s\n", $traits_rec->autonomous_system_number      ();
printf "  Autonom. Syst. Org: %s\n", $traits_rec->autonomous_system_organization();
printf "  Connection Type:    %s\n", $traits_rec->connection_type               ();
printf "  Domain:             %s\n", $traits_rec->domain                        ();
printf "  IP Address:         %s\n", $traits_rec->ip_address                    ();
printf "  IS anonymous proxy  %s\n", $traits_rec->is_anonymous_proxy            ();
printf "  Is legitimate proxy %s\n", $traits_rec->is_legitimate_proxy           ();
printf "  Is satellite prov.  %s\n", $traits_rec->is_satellite_provider         ();
printf "  ISP:                %s\n", $traits_rec->isp                           ();
printf "  Organization:       %s\n", $traits_rec->organization                  ();
printf "  User type:          %s\n", $traits_rec->user_type                     ();

print  "Maxmind\n";
print  "--------------------\n";
printf "  Remaining Queries:  %d\n", $maxmind_rec->queries_remaining            ();
