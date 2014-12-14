use warnings;
use strict;

use Config::IniFiles;

use File::Basename;

my $ini = Config::IniFiles->new( -file => dirname($0) . '/configfile.ini' ) or die;

print $ini->val('foo', 'val1');
