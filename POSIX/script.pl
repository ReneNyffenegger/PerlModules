use warnings;
use strict;

use POSIX;

printf "acos(     0) = %7.6f\n",     acos(     0);
printf "asin(     1) = %7.6f\n",     asin(     1);
printf "atan(100000) = %7.6f\n",     atan(100000);

print "\n";

print  "start of epoch: ", strftime ('%H:%M:%S %d.%m.%Y', gmtime   (0)), "\n";
print  "now:          : ", strftime ('%H:%M:%S %d.%m.%Y', localtime( )), "\n";
