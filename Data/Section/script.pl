use warnings;
use strict;

use Data::Section -setup;

my $foo_ref = main->section_data('Foo');
my $bar_ref = main->section_data('Bar');
my $baz_ref = main->section_data('Baz');

print $$foo_ref;
print $$bar_ref;
print $$baz_ref;


__DATA__
__[ Foo ]__
one
two
three
__[ Bar ]__
abc
def
ghi
__[ Baz ]__
little
more
most
