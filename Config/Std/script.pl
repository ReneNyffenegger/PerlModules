use warnings;
use strict;

use Config::Std;

use feature 'say';

read_config 'script_config.ini' => my %cfg;

say $cfg{'Section A'}{'key-1'     };
say $cfg{'Section A'}{'equal-sign'};

say $cfg{'Section B'}{'foo'       };
