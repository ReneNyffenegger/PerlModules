use warnings;
use strict;

use LWP::UserAgent;

my $proxy_user     = 'foo';
my $proxy_password = 'bar';

# Setting agent to prevent «406 Not Acceptable» that some servers throw.
my $ua = LWP::UserAgent->new(agent => "The agent that never sleeps");

# $ua -> proxy('http' , "http://$proxy_user:$proxy_password\@proxy.server.foo:8080");
# $ua -> proxy('https', "http://$proxy_user:$proxy_password\@proxy.server.foo:8080");

# my $response = $ua -> request(HTTP::Request->new(GET=>'http://www.adp-gmbh.ch/index.html'));
my $response = $ua -> request(HTTP::Request->new(GET=>'https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/LWP/UserAgent/script.pl'));

print $response->content;
