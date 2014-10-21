use warnings;
use strict;

use IO::Compress::Gzip     qw(gzip  );
use IO::Uncompress::Gunzip qw(gunzip);

my $string = "Here's a String that's going
to be zipped and then unzipped.
--------------------------------
some more data etc";

my $zipped_string;
gzip \$string => \$zipped_string;

printf "Length of string: %d, length of zipped string: %d\n", length($string), length($zipped_string);

my $unzipped_string;
gunzip \$zipped_string => \$unzipped_string;

print $unzipped_string;
