use warnings;
use strict;

use Net::ProxyMod;

my $local_host  = "localhost";
my $local_port  =       9090 ;
my $remote_host = "localhost";
my $remote_port =         80 ;
my $debug       =          1 ;

my $proxy = Net::ProxyMod->new($local_host, $local_port, $remote_host, $remote_port, $debug);

# Go!
$proxy->get_conn(\&server_to_client, \&client_to_server);

sub server_to_client {

    my $data = shift;

   (my $printable = $data) =~ s/\W/./g;

    print "\n\nIn:\n$data";

    return $data;
}

sub client_to_server {
    my $data = shift;

   (my $printable = $data) =~ s/\W/./g;

    print "\n\nOut:\n$data";

    return $data;
}
