#
#   callback.pl -x 5 -y 4  foo bar baz
#
use warnings;
use strict;

use Getopt::Long;

die unless GetOptions (
    'x=i' => \my $x,
    'y:i' => \my $y,
    '<>'  => \&callback
);

print "x = $x\n" if defined $x;
print "y = $y\n" if defined $y;

sub callback {
  print "callback\n  ";
  print join "\n  ", @_;
  print "\n";
}
