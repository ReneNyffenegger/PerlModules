use warnings;
use strict;
use feature 'say';

use Config::Std;

use File::Basename;

read_config dirname($0) . '/script_config.ini' => my %cfg;

say $cfg{'Section A'}{'key-1'     };
say $cfg{'Section A'}{'equal-sign'};

say $cfg{'Section B'}{'foo'       };
