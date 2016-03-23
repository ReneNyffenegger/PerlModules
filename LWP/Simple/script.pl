use warnings;
use strict;
use LWP::Simple;

my $url;

# $url = 'https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/LWP/Simple/script.pl';
# This url prints
#   500 write failed: Bad file descriptor
# even if the PERL_LWP_SSL_VERIFY_HOSTNAME env variable
# is set to 0.

$url = 'http://www.google.com';

# Just print a remote file
getprint($url);

# Get the remote file and store it
getstore($url, 'google.html');
