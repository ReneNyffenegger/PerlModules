use warnings;
use strict;
use feature 'say';

use Config::IniFiles;

use File::Basename;

my $ini = Config::IniFiles->new( -file => dirname($0) . '/configfile.ini' ) or die;

say $ini->val('foo', 'val1');
say $ini->val('bar', 'val2');
