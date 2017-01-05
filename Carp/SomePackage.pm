package SomePackage;

use warnings;
use strict;

use Carp; # Needed for croak()

sub FuncOne() {

  warn  "Warning in FuncOne"; # Warning in FuncOne at SomePackage.pm line 10.
  carp  "carp in FuncOne" ;   # carp in FuncOne at ./script.pl line 7.
  croak "croak in FuncOne";   # croak in FuncOne at ./script.pl line 7.

  print "Not reached!\n";

}


1;
