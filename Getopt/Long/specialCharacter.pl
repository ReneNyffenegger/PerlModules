#
#   http://stackoverflow.com/questions/27645166/getoptlong-with-special-character-options-such-as
#
use warnings;
use strict;

use Getopt::Long;

my $percent = 100;

die unless GetOptions (
    'percent|%=f' => \$percent
);

print "\n  $percent%\n\n";
