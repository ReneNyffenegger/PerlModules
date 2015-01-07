use warnings;
use strict;

use Math::Cartesian::Product;

my @list_1 = qw(abc def ghi);
my @list_2 = qw(1   2   3  );

cartesian { print $_[0], " ", $_[1], "\n" } \@list_1, \@list_2;
# abc 1
# abc 2
# abc 3
# def 1
# def 2
# def 3
# ghi 1
# ghi 2
# ghi 3
