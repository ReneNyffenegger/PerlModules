use warnings;
use strict;

use Encode;

print "From UTF-8 to Latin-1\n";
my $auml = "\x{c3}\x{89}";
printf("UTF-8  : %s\n", unpack('H*', $auml));
Encode::from_to($auml, 'utf8', 'latin-1');
printf("Latin-1: %s\n", unpack('H*', $auml));



print "\n\nSupported encodings:\n  ";
print join "\n  ", Encode->encodings(':all'); # supported encodings

