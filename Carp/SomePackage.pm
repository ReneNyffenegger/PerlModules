package SomePackage;

use warnings;
use strict;

use Carp; # Needed for croak()

sub FuncOne() {

  warn  "Warning in FuncOne"; # Warning in FuncOne at SomePackage.pm line 10.
  croak "Croak in FuncOne";   # Croak in FuncOne at ./script.pl line 7.

}


1;
