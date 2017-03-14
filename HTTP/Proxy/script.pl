#!/usr/bin/perl
use warnings;
use strict;

package RequestHeaderFilter; #_{

use base qw(HTTP::Proxy::HeaderFilter);

sub filter {
  my ($self, $headers, $request) = @_;


# printf "RequestHeaderFilter\n";
# printf "  ref(headers): %s\n", ref($headers);  # HTTP::Headers
# printf "  ref(request): %s\n", ref($request);  # HTTP::Request

  printf "%s %s\n", $request->method, substr($request->uri, 0, 100);

}
 #_}
package ResponseBodyFilter; #_{

use base qw(HTTP::Proxy::BodyFilter);

sub filter {

  my ($self, $dataref, $response, $protocol, $buffer) = @_;

# printf "  ref(response) : %s\n",  ref($response);   # HTTP::Response
# printf "  ref(protocol) : %s\n",  ref($protocol);   # LWP::Protocol::*

  print $response->as_string();

}
 #_}

package main;

use HTTP::Proxy;

my $proxy = HTTP::Proxy->new(port => 8888);

$proxy->push_filter(request =>RequestHeaderFilter->new());
$proxy->push_filter(response=>ResponseBodyFilter ->new());


$proxy->start;
