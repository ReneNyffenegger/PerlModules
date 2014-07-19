use warnings;
use strict;

use ExtUtils::Installed;

my $inst = new ExtUtils::Installed;

print join "\n", $inst->modules();

