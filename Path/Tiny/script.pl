use warnings;
use strict;

use Path::Tiny;


my $file_myself = path($0);


print "\ncanonpath()\n";
  print "  parent: ", $file_myself -> parent -> canonpath    , "\n";
  print "  ../..:  ", path($0 . '/../..')    -> canonpath    , "\n";

print "\ndigest()\n";
  print "  ", $file_myself -> digest       , "\n";
# print "  ", $file_myself -> digest('MD%'), "\n";


print "\nslurp()\n";

# print $file_myself -> slurp;
