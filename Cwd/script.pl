use warnings;
use strict;
use feature 'say';

use Cwd qw(abs_path cwd getcwd);

say "abs_path: ", abs_path($0); # Get the full path to a Perl script that is executing / Compare with File::Spec, File::Spec->rel2abs
say "cwd:      ", cwd;
say "getcwd:   ", getcwd;       # compare with cwd
