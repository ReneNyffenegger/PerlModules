use warnings;
use strict;

use List::Compare;

my @l1 = qw(foo bar bar baz one     three      four);
my @l2 = qw(    bar     baz one two three four four);

my $c = List::Compare->new('--unsorted', \@l1, \@l2);

print "get_intersection\n  ";
print join "\n  ", $c->get_intersection;
#  bar
#  three
#  baz
#  one
#  four

print "\nget_union\n  ";
print join "\n  ", $c->get_union;
#  two
#  four
#  one
#  bar
#  foo
#  baz
#  three

print "\nget_unique\n  ";  # Elements only in first list
print join "\n  ", $c->get_unique;
#  foo

print "\nget_complement\n  ";  # Elements only in second list
print join "\n  ", $c->get_complement;
#  two
