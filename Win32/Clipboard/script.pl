use warnings;
use strict;

use Win32::Clipboard;

print "The current content of the clipboard is:\n" . Win32::Clipboard -> Get . "\n";

Win32::Clipboard -> Set ("This string was set in Perl by a script using Win32::Clipboard");
