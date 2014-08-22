use warnings;
use strict;

use LWP::Simple;

# Just print a remote file
getprint('https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/LWP/Simple/script.pl');

# Get the remote file and store it
getstore('https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/LWP/Simple/script.pl', 'script-downloaded.pl');
