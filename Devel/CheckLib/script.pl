use warnings;
use strict;

use Devel::CheckLib;

check_lib_or_exit(lib => 'magic', header => 'magic.h'); # Might print «Can't link/include C library 'magic.h', 'magic', aborting.»
print "Reached?\n";
