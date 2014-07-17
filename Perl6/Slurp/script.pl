use warnings;
use strict;

use Perl6::Slurp;

my $program_text = slurp (__FILE__);

print $program_text;
