use warnings;
use strict;

use YAML;

my $var = {
   
    l => [ 'one', 'two', 'three', {'four' => 444, 'five' => 555 } ],
    h => { 'key 1' => 'aaa', 'key 2' => 'bbb', 'key 3' => 'ccc'}
};

print Dump $var;

__END__
h:
  key 1: aaa
  key 2: bbb
  key 3: ccc
l:
  - one
  - two
  - three
  - five: 555
    four: 444
