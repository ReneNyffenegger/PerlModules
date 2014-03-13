use warnings; use strict;

use IO::Socket::INET;

use threads;

$| = 1; # Autoflush

my $socket = new IO::Socket::INET (

  LocalHost   => '0.0.0.0',
  LocalPort   => '2808',
  Proto       => 'tcp',
  Listen      =>  5,
  Reuse       =>  1

) or die "Cannot create socket";

print "Waiting for echo-client.pl to connect\n";

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
