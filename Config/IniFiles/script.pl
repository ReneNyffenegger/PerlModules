use warnings;
use strict;

use Config::IniFiles;

my $ini = Config::IniFiles->new( -file => 'configfile.ini' ) or die;

print $ini->val('foo', 'val1');
