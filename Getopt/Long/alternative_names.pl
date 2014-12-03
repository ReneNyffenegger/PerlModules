#
#   Call with
#
#      -a
#      -ab
#      -abc
#       ....
#      -abcdefgh
#
#    or
#
#      -x
# 
#    or 
#
#      without option at all
#
use warnings;
use strict;

use Getopt::Long;

GetOptions (
  'x|abcdefgh' => \my $abcdefgh
);

if ($abcdefgh) {
  print "You have used either -x or -abcdefgh\n";
}
else {
  print "You chose neither -x or -abcdefgh\n";
}
