#!/usr/bin/perl
use warnings;
use strict;

use IO::Socket;

my $host = shift or die; 
my $path = shift or die;

my $socket = IO::Socket::INET->new(
  PeerAddr    => $host,
  PeerPort    =>  80,
  Proto       => 'tcp',
  Timeout     =>  1
)
or die "Could not connect";

print $socket "GET $path HTTP/1.0\x0d\x0a";
print $socket "Host: $host\x0d\x0a";
print $socket "\x0d\x0a";

while (my $line = <$socket>) {
  print $line;
}
