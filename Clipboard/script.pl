#   if 
#      «can't find the 'xclip' script» 
#   then 
#       sudo yum -y install xclip
#

use warnings; use strict;

use Clipboard;

print "Currenty in Clipboard: " . Clipboard -> paste() . "\n";

Clipboard -> copy ("Putting something into the Clipboard");
