use warnings;
use strict;

use Algorithm::Loops qw(Filter);


my @foo = qw(foo bar baz);

my @foo_ = Filter { s/a/X/g } @foo;

print join " - ", @foo_;
# foo - bXr - bXz
