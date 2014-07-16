use warnings;
use strict;

use Perl6::Take;


my @taken = gather {

  print "I am going to take 42\n";
  take 42;

  print "What do you give me?\n";
  my $next = <STDIN>;
  chomp $next;
  take $next;

  print "Finally, I take 1\n";
  take 1;

};

print "-----\n";
print join "\n", @taken;
