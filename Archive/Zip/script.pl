use warnings;
use strict;

use Archive::Zip qw(:ERROR_CODES :CONSTANTS);
use File::Spec::Functions 'tmpdir';
use File::Basename;


my $dest_file = tmpdir() . 'io-compress.zip';

my $zip = Archive::Zip -> new;

print dirname($0), "\n";

$zip -> addTree (dirname($0), 'subdir');

$zip -> addString('twenty-two', '42.txt');

$zip -> writeToFileNamed ($dest_file) == AZ_OK or die "Could not write $dest_file";

print "$dest_file written";
