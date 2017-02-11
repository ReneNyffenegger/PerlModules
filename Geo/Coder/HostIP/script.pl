#!/usr/bin/perl
use warnings;
use strict;

use Geo::Coder::HostIP;

my $ipnr = shift or die;

# I can even call it menlo …
my $menlo     = Geo::Coder::HostIP->new; # default Server: www.hostip.info


#  Get the coordinates.
#  If successful, it also fills other values
#  into $menlo, such as CountryCode etc, see below
my @coordinates = $menlo->FetchIP($ipnr);

if (@coordinates) {
  printf "lat %s, lon %s\n", @coordinates;
  printf "Country code: %s\n", $menlo->CountryCode;
} else {
    print "Nothing found for $ipnr\n";
}
