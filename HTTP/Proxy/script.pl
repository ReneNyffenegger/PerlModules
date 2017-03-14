#!/usr/bin/perl
use warnings;
use strict;

use HTTP::Proxy;
use HTTP::Proxy::HeaderFilter::simple;
use HTTP::Proxy::BodyFilter::simple;

my $filter_request_header = HTTP::Proxy::HeaderFilter::simple->new(sub { #_{
  my ($self, $headers, $request) = @_;
  printf "Request Header\n";


  printf "  %s %s\n", $request->method, substr($request->uri, 0, 100);

}); #_}
my $filter_response_header  = HTTP::Proxy::HeaderFilter::simple->new(sub { #_{

  printf "Response Header\n";
  my ($self, $headers, $response) = @_;


# printf "  %s\n", $headers;
  printf "  ref(headers ): %s\n", ref($headers ); # HTTP::Headers
  printf "  ref(response): %s\n", ref($response); # HTTP::Response
# printf "  headers: %s\n", $$headers;

  print $headers->as_string();

# print $response->as_string();

}); #_}
my $filter_response_body  = HTTP::Proxy::BodyFilter::simple->new(sub { #_{
  my ($self, $dataref, $response, $protocol, $buffer) = @_;
  printf "Response Body\n";

# print $response->as_string();

}); #_}

my $proxy = HTTP::Proxy->new(
    port => 8888       # default: 8080
# , engine=>'NoFork'   # Threaded (probably for Windows), NoFork (probably for Windows), ScoreBoard, Legacy
);

print ref($proxy->engine), "\n";

$proxy->push_filter(request =>$filter_request_header);
$proxy->push_filter(response=>$filter_response_header);
$proxy->push_filter(response=>$filter_response_body);


$proxy->start;
