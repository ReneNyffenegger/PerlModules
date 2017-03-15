#!/usr/bin/perl
use warnings;
use strict;

use LWP::UserAgent;

my $user_agent = LWP::UserAgent->new;
my $request    = HTTP::Request->new('GET' => 'https://stackoverflow.com');
$request -> header('Accept-encoding', 'gzip');
my $response   = $user_agent->request($request);

if ($response->headers->header('Content-Encoding') eq 'gzip') {
  print "---------------------------------------------\n";
  print "Server sent gzip encoded content, decoding...\n";
  print "---------------------------------------------\n";
  print substr($response->decoded_content, 0, 500);
}
else {
  print "---------------------------------------\n";
  print "Server didn't send gzip encoded content\n";
  print "---------------------------------------\n";
  print substr($response->content, 0, 500);
}
