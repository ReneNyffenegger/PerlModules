use warnings; use strict;

use IO::Socket::INET;
use threads;

my $port_listen = 2808;

$| = 1; # Autoflush

my $socket = IO::Socket::INET->new(

  LocalHost   => '0.0.0.0',
  LocalPort   =>  $port_listen,
  Proto       => 'tcp',
  Listen      =>  5,
  Reuse       =>  1

) or die "Cannot create socket";

print "Waiting for tcp connect to connet on port $port_listen (see echo-client.pl)\n";

while (1) {


    my $client_socket = $socket->accept();

    my $client_address = $client_socket->peerhost;
    my $client_port    = $client_socket->peerport;

    print "$client_address $client_port has connected\n";

    threads -> create(\&connection, $client_socket);

}

$socket -> close;

sub connection {

  my $client_socket = shift;

  while (1) {

    my $data = <$client_socket>;

    return if $data eq "";

    print $client_socket "Ok $data";
  }
}
