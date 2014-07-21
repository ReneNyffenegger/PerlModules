use warnings;
use strict;

use File::Slurp;

use String::CRC32;

my $script_text = read_file(__FILE__);

print crc32($script_text);
