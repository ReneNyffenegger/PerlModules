use warnings;
use strict;

use Tie::File;

use POSIX;

tie my @log, 'Tie::File', 'script.log';

push @log, "Script was started at ". strftime("%H:%M:%S %d.%m.%Y", localtime());

untie @log;
