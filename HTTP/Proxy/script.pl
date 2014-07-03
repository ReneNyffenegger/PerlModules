use warnings;
use strict;

use HTTP::Proxy;

my $proxy = HTTP::Proxy->new(port => 8888);
   $proxy->start
