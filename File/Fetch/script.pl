use warnings;
use strict;

use File::Fetch;

my $fetcher = new File::Fetch (uri => 'http://www.adp-gmbh.ch/index.html');

$fetcher->fetch;
