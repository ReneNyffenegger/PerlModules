use warnings;
use strict;

use IO::Socket;
my $server = IO::Socket::INET->new(
  PeerAddr=> 'localhost',
  PeerPort=>  2808,
  Proto   => 'tcp',
  Reuse   => 1,
) or die $!;

my $s = <$server>;
print $s;

while (<>) {
  
  print $server $_; # send STDIN to server

  last if m/^end/gi;

  my $line = <$server>;
  print $line;

}

<$server>;
print;
close $server;
