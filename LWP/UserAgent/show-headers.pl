#!/usr/bin/perl
use warnings;
use strict;

use LWP::UserAgent;

my $user_agent = LWP::UserAgent->new;
my $request    = HTTP::Request->new('GET' => 'http://renenyffenegger.ch/robots.txt');
my $response   = $user_agent->request($request);

print "Request Headers\n";
show_headers($response->request);

print "Response Headers\n";
show_headers($response);

print $response->content;

sub show_headers {
  my $request = shift;
  my $headers = $request->headers;

  for my $header_field_name($headers->header_field_names) {
    printf "    %-50s: %s\n", $header_field_name, $headers->header($header_field_name) // '?';
  }

}
