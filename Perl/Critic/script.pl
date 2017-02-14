use warnings;
use strict;

use Perl::Critic;

my $critic = Perl::Critic->new;

my @violations = $critic -> critique($0);

print @violations;
