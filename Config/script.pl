use warnings;
use strict;

use Config;

printf "API Version:   %s\n", $Config{api_versionstring};
printf "Arch Lib:      %s\n", $Config{archlib};
printf "Byte Order:    %s\n", $Config{byteorder};
printf "cat:           %s\n", $Config{cat};
printf "ccname:        %s\n", $Config{ccname};
printf "Hostname:      %s\n", $Config{aphostname};           # compare with Sys::Hostname
printf "osname:        %s\n", $Config{osname};               # compare with Sys::Info::OS and $^O (https://github.com/ReneNyffenegger/about-perl/blob/master/variables/%5EO__platform.pl)
