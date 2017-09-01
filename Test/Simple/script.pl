use warnings;
use strict;

use Test::Simple tests => 2;  # 2 is the number of tests

ok ( 4     == 1 + 3     , '4 == 1+3'  );
ok ( 'foo' eq 'f' . 'oo', 'foo == foo');
