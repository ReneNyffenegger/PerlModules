use warnings;
use strict;

use String::Util 'trim';

my $string  = '   foo   bar   baz    ';
my $trimmed = trim $string;

print ">$string<\n";
print ">$trimmed<\n";
