use warnings;
use strict;

use File::Compare;


if (compare('a.txt', 'b.txt') == 0) {
  print "a.txt == b.txt\n";
}
else {
  print "a.txt != b.txt\n";
}

if (compare('a.txt', 'c.txt') == 0) {
  print "a.txt == c.txt\n";
}
else {
  print "a.txt != c.txt\n";
}
