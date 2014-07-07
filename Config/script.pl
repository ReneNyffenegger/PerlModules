use warnings;
use strict;

use Config;

printf "API Version:   %s\n", $Config{api_versionstring};
printf "Arch Lib:      %s\n", $Config{archlib};
printf "Byte Order:    %s\n", $Config{byteorder};
printf "cat:           %s\n", $Config{cat};
printf "ccname:        %s\n", $Config{ccname};
printf "Hostname:      %s\n", $Config{aphostname};           # compare with Sys::Hostname
