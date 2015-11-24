#
#   Used along with can_read_test.server.pl
#   See http://stackoverflow.com/questions/33199699/how-can-i-deteremine-if-id-read-something-from-a-socket/33206116#33206116
#
use warnings;
use strict;

use IO::Socket;
use IO::Select;


my $socket = IO::Socket::INET->new(
     Proto   => 'tcp',
     PeerAddr=> 'localhost',
     PeerPort=>  2808,
     Reuse   => 1,
   ) or die $!;

my $select = new IO::Select;
$select -> add($socket);

$| = 1;

my $select_time_out_secs = 0.1;

while (1) {
  while ($select -> can_read($select_time_out_secs)) {
  
    my $buf;
    my $rv = sysread($socket, $buf, 64*1024);
  
    if (! defined($rv)) {
  
       print "* Error: $!\n";
       exit;
    }
  
    if (!$rv) {
  
      print "* Connection ended\n";
      exit;
    }
  
    print $buf;
  
  }
}
