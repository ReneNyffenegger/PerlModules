use warnings;
use strict;

use Scalar::Util qw(blessed dualvar isdual readonly refaddr reftype tainted weaken isweak isvstring looks_like_number set_prototype);


my $dual  = dualvar 10, "foo";
print "is_dual: " . (isdual $dual) . "\n";

print "\n---- looks_like_number:\n";

for my $uncertain (  
      10,               # yes
     'twenty',          # no
     " 30 ",            # yes (note the whitespaces)
      40.5,             # yes
     "000047",          # yes
     -55.49,            # yes
     "   -72.3 ",       # yes
     "  - 63.1 ",       # no
     "20e3",            # yes
     "  20e3  ",        # yes
     "  20 e3  ",       # no
     "1_111_111",       # no
     " -+-77"           # no
  ) {

  if (looks_like_number($uncertain)) {
    printf "  %-15s looks like a number\n", ">$uncertain<";
  }
  else {
    printf "  %-15s doesn't look like a number\n", ">$uncertain<";
  }
}
