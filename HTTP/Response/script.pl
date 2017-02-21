#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use LWP::UserAgent;

my $user_agent = LWP::UserAgent->new;

# LWP::UserAgent's get function returns a HTTP::Response object:
my $http_response = $user_agent->get('https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/HTTP/Response/script.pl');
say ref $http_response;
#
# HTTP::Response


printf "code, message: %d %s\n", $http_response->code, $http_response->message;
printf "status line:   %s\n"   , $http_response->status_line; # same as above
printf "filename:      %s\n"   , $http_response->filename;
printf "base:          %s\n"   , $http_response->base;
