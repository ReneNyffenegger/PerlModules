use warnings; use strict;

$| = 1; # Autoflush

use IO::Socket;
use IO::Select;

my $socket = new IO::Socket::INET (
                 PeerAddr    => 'localhost',
                 PeerPort    =>  2808,
                 Proto       => 'tcp',
                 Timeout     =>  1
             ) 
             or die "Could not connect";


my $select = IO::Select->new();

$select -> add (\*STDIN);  # Does not work on Windows! [ http://stackoverflow.com/a/1701458/180275 ]
$select -> add ($socket);

while (1) {
  while (my @ready = $select -> can_read) {
  
    foreach my $fh (@ready) {
  
       if ($fh == $socket) {
          my $buf = <$socket>;
          print $buf;
       }
       else {
  
         my $buf = <STDIN>;
         print $socket $buf
  
       }
    }
  }
  print "$!\n";
}
