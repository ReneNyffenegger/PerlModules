use warnings;
use strict;

use File::DirList;

my $noLinks      = 1;
my $hideDotFiles = 1;

#  list returns an array ref
my $entries = File::DirList::list('c:/temp', 
  'n',# sort by name
  $noLinks,
  $hideDotFiles
); 


# the name is at position 13
print join ("\n", map {$_->[13]} @{$entries});
