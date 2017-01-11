#!/usr/bin/perl
use warnings;
use strict;

use HTTP::Daemon;
use HTTP::Status;

my $daemon = HTTP::Daemon->new or die;

printf ("\n\n   URL of webserver is %s, show this script with %smyself\n", $daemon->url, $daemon->url);

while (my $client_connection = $daemon->accept) { # {
    new_connection($client_connection);
} # }

sub new_connection { # {
    my $client_connection = shift;
    printf "new connection\n";
    while (my $request = $client_connection->get_request) {

      print "  request\n";
        if ($request->method eq 'GET' and $request->uri->path eq "/myself") {
            $client_connection->send_file_response($0);
        }
        else {
            $client_connection->send_error(RC_FORBIDDEN)
        }
    }
    $client_connection->close;
} # }
