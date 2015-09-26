#
#   Compare http://stackoverflow.com/a/85640/180275
#
use warnings;
use strict;
use Net::DNS;

my $resolver = Net::DNS::Resolver->new;

my $ip = "83.140.106.62";

my $target_ip = join('.', reverse split(/\./, $ip)).".in-addr.arpa";

my $query = $resolver->query($target_ip, 'PTR');

if ($query) {

  foreach my $answer ($query->answer) {
    next unless $answer->type eq 'PTR';
    print $answer->rdatastr, "\n";
  }

}
else {
  print "query failed: ", $resolver->errorstring, "\n";
}
