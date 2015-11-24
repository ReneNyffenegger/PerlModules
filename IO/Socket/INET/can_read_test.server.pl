#
#   Used along with can_read_test.client.pl
#   See http://stackoverflow.com/questions/33199699/how-can-i-deteremine-if-id-read-something-from-a-socket/33206116#33206116
#
use warnings;
use strict;

use IO::Socket::INET;
use threads;
use threads::shared;

my $nl = "\x0d\x0a";


my $server = new IO::Socket::INET (
    LocalHost   => 'localhost',
    LocalPort   =>  2808,
    Proto       => 'tcp',
    Listen      =>  1,
    Reuse       =>  1
  ) or die "Cannot create socket";


# $server->listen();       # listen

while (my $client_socket = $server->accept()) {
  printf "Connection from %s:%d\n", $client_socket -> peerhost(), $client_socket -> peerport();
  threads->create(\&connection, $client_socket);
}

print "Ended\n";

sub connection {

  my $socket = shift;
  binmode $socket;

  my $sec = int(rand(10));
  $socket -> send("This is the first line, now, going to sleep for $sec seconds$nl");
  sleep $sec;

  $socket -> send("Sending 7 dots$nl");
  for my $i (1 .. 7) {
    $socket -> send('.');
    sleep 1;
  }
  $socket -> send($nl);

  $socket -> send("Last line$nl");
  sleep 1;
  $socket -> close;

}
