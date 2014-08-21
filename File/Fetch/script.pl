use warnings;
use strict;

use File::Fetch;

my $fetcher = new File::Fetch (uri => 'https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/File/Fetch/script.pl');

$fetcher->fetch;
