#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use LWP::UserAgent;

my $user_agent = LWP::UserAgent->new;

# LWP::UserAgent->get returns a HTTP::Response object:
my $http_response = $user_agent->get('https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/HTTP/Request/script.pl');
say ref $http_response;

# Inspecting the HTTP::Request that »caused« the HTTP::Response object
my $http_request = $http_response->request;
say ref $http_request;

printf "URI:             %s\n", $http_request->uri;
printf "User-Agent:      %s\n", $http_request->header('User-Agent');
