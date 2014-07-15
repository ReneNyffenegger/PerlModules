use warnings;
use strict;
use utf8;

use Math::Random;
use List::Util    'max';    # https://github.com/ReneNyffenegger/PerlModules/tree/master/List/Util

my $λ     =     41;
my $tests = 100000;
my %result;
my $screen_width = 200;


for (1 .. $tests) {
    my $x = Math::Random::random_poisson(undef, $λ); # When called in a scalar context, generates and returns only one such outcome as a scalar, regardless of the value of $n (first paramter

    $result{$x}++;
}

my $max_number = max map { $result{$_} } keys %result;

# Output the graph
print("\n");
for my $key (sort { $a <=> $b } (keys(%result))) {
    my $len = int($screen_width * $result{$key}/$max_number);
    print(':', '*' x $len, "\n");
}


