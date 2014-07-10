use warnings;
use strict;

use File::LibMagic;

use File::Spec;
use Cwd;

my $lm = new File::LibMagic;

print $lm -> describe_filename ($0         ), "\n"; # ASCII text
print $lm -> describe_filename ('README.md'), "\n"; # ASCII text
