#!/usr/bin/perl
use warnings;
use strict;

use File::Find;
use File::Spec;

my $root_dir = shift;


find({ no_chdir => 1,
       wanted   => \&file_find_callback, },
       $root_dir);



sub file_find_callback { # {{{

    print "\$File::Find::dir   $File::Find::dir \n";
    print "\$File::Find::name  $File::Find::name\n";
    print "\$_                 $_\n";
    print "relative path      ". File::Spec -> abs2rel($File::Find::name, $root_dir), "\n";

    print "\n";

} # }}}
