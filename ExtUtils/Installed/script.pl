use warnings;
use strict;

use ExtUtils::Installed;

my $inst = ExtUtils::Installed->new;

print join "\n", $inst->modules();

