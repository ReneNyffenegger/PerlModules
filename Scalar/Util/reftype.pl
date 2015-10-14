use warnings;
use strict;
use feature 'say';

use Scalar::Util qw(reftype);

my $h = bless {}, 'Some::Foo';
my $s = 'scalar';

say ref($h);
# Some::FOO

say reftype($h);
# HASH

if (defined reftype($s)) {
  say reftype($s);
}
else {
  say 'reftype($s) is not defined';
}
# reftype($s) is not defined
