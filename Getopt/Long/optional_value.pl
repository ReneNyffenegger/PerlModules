#
#   ./optional_value.pl
#   ./optional_value.pl --opt
#   ./optional_value.pl --opt some_value
#

use warnings;
use strict;

use Getopt::Long;

my $opt;

# The colon sign between opt and s indicates that an optional value
# can be passd after --opt. Compare with ./default_value.pl
GetOptions('opt:s' => \$opt); 
print "\n";

if (defined $opt) {

  if ($opt) {
    print "The --opt flag was used and the optional value $opt was given\n";
  }
  else {
    print "The --opt flag was used, yet without specifing a value\n";
  }
}
else {
  print "The --opt flag was not used\n";
}

