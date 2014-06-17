use warnings;
use strict;

use Win32::Console::ANSI;            # Seems to be necessary on Windows

use Term::ANSIColor qw(:constants);  # Inteface 1, use constants

print BOLD RED "\nThis is red";
print RESET;
print "\n";
