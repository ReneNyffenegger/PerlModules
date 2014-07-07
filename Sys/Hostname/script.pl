use warnings;
use strict;

use Sys::Hostname;

printf "Name of host: %s\n", hostname; # Compare with  "use Config; print $Config{aphostname}"
