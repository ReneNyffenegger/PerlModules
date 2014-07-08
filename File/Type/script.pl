use warnings;
use strict;

use File::Type;

use File::Spec;
use Cwd;

my $ft = new File::Type;

# Hmmm... Why do these, especially the .txt, all return «application/octet-stream»?
print $ft -> mime_type ($0                                            ), "\n"; # application/octet-stream
print $ft -> mime_type (File::Spec->canonpath(cwd . '../../README.md')), "\n"; # application/octet-stream
print $ft -> mime_type (File::Spec->canonpath(cwd . '/file.txt'      )), "\n"; # application/octet-stream
