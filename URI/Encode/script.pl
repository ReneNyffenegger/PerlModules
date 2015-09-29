use warnings;
use strict;

use URI::Encode qw(uri_encode uri_decode);

my $encoded = uri_encode('http://foo.bar/x+y 2~%.html');
print "Encoded = $encoded\n";
print "Decoded = " . uri_decode($encoded) . "\n";

# Encoded = http://foo.bar/x+y%202~%25.html
# Decoded = http://foo.bar/x+y 2~%.html
