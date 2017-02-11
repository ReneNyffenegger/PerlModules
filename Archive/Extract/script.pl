#
#   Use this script to unzip a zip file.
#   See also ../Zip/script.pl
#
use warnings;
use strict;

use Archive::Extract;
use File::Spec::Functions 'tmpdir';

die "Specify zip file" unless (@ARGV);

my $zip_file = shift;

my $temp_dir = tmpdir . '/unzipped-by-Archive-Extract';

my $unzip = Archive::Extract->new(archive => $zip_file);

my $ok = $unzip->extract(to => $temp_dir);

print "\nZipfile extracted to $temp_dir\n";
