use warnings;
use strict;

use Win32::OLE::Const;

my $constants = Win32::OLE::Const->Load("Microsoft Office"); # or "Microsoft Office .* Object Library"

foreach my $Key (sort keys %$constants) {
    printf "%-34s: %s\n", $Key, $constants->{$Key};
}

# ----

use Win32::OLE::Const 'Microsoft.Excel';

print "xlXYScatterSmoothNoMarkers = " , xlXYScatterSmoothNoMarkers, "\n";
