use warnings;
use strict;

use List::Compare;

my @l1 = qw(foo bar bar baz one     three      four);
my @l2 = qw(    bar     baz one two three four four);

my $c = new List::Compare ('--unsorted', \@l1, \@l2);

print "get_intersection\n  ";
print join "\n  ", $c->get_intersection;
#  bar
#  three
#  baz
#  one
#  four

print "\nget_union  ";
print join "\n  ", $c->get_union;
#  three
#  baz
#  one
#  foo
#  two
#  four
