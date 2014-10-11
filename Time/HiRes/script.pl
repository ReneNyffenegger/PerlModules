use warnings;
use strict;

# Note, that time is also a perl function
use Time::HiRes qw(time);

my $start = time;
print "foo\n";
print "bar\n";
print "baz\n";
my $end   = time;

print $end-$start, "\n";
