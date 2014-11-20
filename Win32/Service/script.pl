use warnings;
use strict;

use Win32::Service;

my %services;
my $hostname = "";

Win32::Service::GetServices($hostname, \%services);

for my $service (keys %services) {
  printf "%-40s %s\n", $services{$service}, $service;
}
