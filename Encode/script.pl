use warnings;
use strict;

use Encode;

print "Supported encodings:\n  ";
print join "\n  ", Encode->encodings(':all'); # supported encodings

