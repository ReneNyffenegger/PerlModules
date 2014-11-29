use warnings;
use strict;

# Note, that time is also a perl function
use Time::HiRes qw(time);

my $start = time;
print "foo\n";
print "bar\n";
print "baz\n";
my $end   = time;

print $end-$start, " seconds to print 3 times\n";

"burn cpu for a second" while $end > time - 1;

printf "%f second later\n", time - $end;
