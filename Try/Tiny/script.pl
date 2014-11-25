use warnings;
use strict;

use Try::Tiny;

try {
  die "Something has happened";
}
catch {
  print "caught: $_\n";
}; # Note the final ";"


try {
  my $foo = 42/0;
}
catch {
  print "caught: $_\n";
};
