#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use LWP::UserAgent;

my $user_agent = LWP::UserAgent->new;

# LWP::UserAgent's get function returns a HTTP::Response object:
my $http_response = $user_agent->get('https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/HTTP/Headers/script.pl');
say ref $http_response;
#
# HTTP::Response

#
# The HTTP::Response's headers method returns the HTTP::Headers object
my $http_headers = $http_response->headers;
say ref $http_headers;
#
# HTTP::Headers

for my $header_field_name ($http_headers->header_field_names) {
  printf "%-30s: %s\n", $header_field_name, $http_headers->header($header_field_name);
}
