use warnings;
use strict;

use LWP::Simple;

my $result = get('https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/LWP/Simple/get.pl');
print($result);
