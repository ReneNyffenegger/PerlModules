use warnings;
use strict;

use Data::Dumper;

my $foo = 'Foo';
my %bar = (1 => 'one', 'two' => 2, three => ['a', 'b', 'c']);

print Dumper ($foo);
#     $VAR1 = 'Foo';

print "\n\n";
print Dumper (\%bar);
#     $VAR1 = {
#               'three' => [
#                            'a',
#                            'b',
#                            'c'
#                          ],
#               '1' => 'one',
#               'two' => 2
#             };

print "\n\n";
print Dumper (%bar);
#     $VAR1 = 'three';
#     $VAR2 = [
#               'a',
#               'b',
#               'c'
#             ];
#     $VAR3 = '1';
#     $VAR4 = 'one';
#     $VAR5 = 'two';
#     $VAR6 = 2;
