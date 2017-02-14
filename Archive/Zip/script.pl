use warnings;
use strict;

use Archive::Zip qw(:ERROR_CODES :CONSTANTS);
use File::Spec::Functions 'tmpdir';
use File::Basename;



my $dest_file = tmpdir() . '\archive.zip';
my $zip = Archive::Zip->new;
# print dirname($0), "\n";

my $directory_to_zip = File::Spec->catdir($0, '../../..');

# print "directory_to_zip: $directory_to_zip\n";

$zip -> addTree (
  $directory_to_zip,
  '',
  sub { $_ !~ /\.git\b/ }   # exclude «.git» directory
);

# Create a file «42.txt» that does not exist in the
# directory $directory_to_zip.
$zip -> addString('twenty-two', '42.txt');  # Creat

$zip -> writeToFileNamed ($dest_file) == AZ_OK or die "Could not write $dest_file";

print "\n$dest_file written\n\n";
print "Now, use ../Extract/script (Archive::Extract) to unzip again.\n";
