use warnings;
use strict;

use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);

use File::Temp 'tempdir';

my $temp_dir = tempdir (CLEANUP => 0);

dircopy('../..', $temp_dir);

printf "copied to $temp_dir\n";


