#!/usr/bin/perl
use warnings; use strict;

use File::DirCompare;

# use File::Basename;  // for dirname and basename

if (@ARGV < 2) {
    print "$0 <dir 1> <dir 2>\n";
    exit;
}


File::DirCompare -> compare($ARGV[0], $ARGV[1], sub {

  my ($f1, $f2) = @_;

  if (! $f2) {

#     printf "> %s: %s\n", dirname($f1), basename($f1);
      printf "> $f1\n";

  } elsif (! $f1) {

#     printf "< %s: %s\n", dirname($f2), basename($f2);
      printf "< $f2\n";

  } else {

      print "! $f1 and $f2\n";

  }

});
