use warnings;
use strict;

use Sub::Identify ':all';

my $code_ref = \&func;

printf "subname: %s\n" , sub_name($code_ref);


sub func {
  print "func";
}
