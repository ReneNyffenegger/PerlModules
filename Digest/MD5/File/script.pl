use warnings;
use strict;

use Digest::MD5::File qw(file_md5_hex);

print "\n\n  Hash of $0 is " . file_md5_hex($0) . "\n\n";
