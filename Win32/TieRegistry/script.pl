use warnings;
use strict;

use Win32::TieRegistry (Delimiter => '/');

my $reg_vars = $Registry->{'HKEY_CURRENT_USER/Environment'};

for my $var (keys %{ $reg_vars } ) {
  print "$var = " . $reg_vars->{$var} . "\n";
}
