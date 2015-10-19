use warnings;
use strict;

my $nl = "\x0d\x0a";

use IO::Socket;
my $local = IO::Socket::INET->new(
     LocalHost => 'localhost',
     LocalPort =>  2808,
     Proto     => 'tcp',
     Reuse     => 1,
     Listen    => 1
) or die $!;

$local->listen();       # listen
$local->autoflush(1);   # To send response immediately


print "Waiting for connections\n";
my $client;

while ($client = $local->accept() ) {     # receive a request

  my $connection_string = sprintf "Connection from %s:%d", $client->peerhost, $client->peerport;
  
  printf $client "%s - %s$nl", $connection_string, "Enter mathematical expressions such as 5*(2+4)/6, end with 'end'";
  print  "$connection_string\n";

  while (<$client>) {

    print;

    last if m/^end/gi;

    $_ =~ s![^()*+/\-0-9]!!g;

    my $result = eval;
    print $result, "\n";

    print $client "$result$nl";

  }
  chomp;

  if (m/^end/gi) {
     print $client "Good by$nl";
  }
  print "Closing client\n";
  close $client;
}
