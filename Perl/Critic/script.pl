use warnings;
use strict;

use Perl::Critic;

my $critic = new Perl::Critic;

my @violations = $critic -> critique($0);

print @violations;
