#
#   http://stackoverflow.com/a/24774853/180275
#
use warnings;
use strict;

use Perl6::Form;

my $cols = 3;

my @list = qw(abc def ghi jklmnop q rst uv wxy z);

print form   q/ {:[{*}[:} / x $cols, ( \@list ) x $cols ;;;

__END__

the programm prints

abc                      jklmnop                  uv
def                      q                        wxy
ghi                      rst                      z
