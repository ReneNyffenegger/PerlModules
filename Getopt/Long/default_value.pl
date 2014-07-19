#
#   default_value.pl
#   default_value.pl --override OVR
#
use strict;
use warnings;

use Getopt::Long;

my $default_value='DEF';
my $override = $default_value;

# The equal sign between override and s indicates that the option requires a value (if
# the option IS used). Compare with ./optional_value.pl
GetOptions('override=s' => \$override); 
print "\n";

if ($override eq $default_value) {
    print "Value was not overridden, use --override if needed\n";
}
else {
    print "Default value overridden with $override\n";
}
