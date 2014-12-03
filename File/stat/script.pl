#
#   See also https://github.com/ReneNyffenegger/about-perl/blob/master/functions/stat.pl
#
use warnings;
use strict;

use File::stat;

use POSIX 'strftime';

my $s = stat($0);

print "Last modification time: ", strftime ('%H:%M:%S %d.%m.%Y', localtime ($s->mtime)), "\n";
print "Last access time:       ", strftime ('%H:%M:%S %d.%m.%Y', localtime ($s->atime)), "\n";
print "Last change time:       ", strftime ('%H:%M:%S %d.%m.%Y', localtime ($s->ctime)), "\n";
