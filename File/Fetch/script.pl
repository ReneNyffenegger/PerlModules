use warnings;
use strict;

use File::Fetch;

my $fetcher = File::Fetch->new(uri => 'http://www.adp-gmbh.ch/index.html');

$fetcher->fetch;
