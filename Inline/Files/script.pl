use warnings;
use strict;

use Inline::Files;

print while (<FOO>);
print while (<BAR>);
print while (<BAZ>);


__FOO__
one
two
three
__BAR__
abc
def
ghi
__BAZ__
little
more
most
