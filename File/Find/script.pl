use warnings;
use strict;

use File::Find;
use File::Spec;

my $root_dir = shift;

print "\n";

find(\&file_find_callback, $root_dir);


sub file_find_callback { # {{{

    print "\$File::Find::dir   $File::Find::dir \n"; # Absolute path to directory containing file
    print "\$File::Find::name  $File::Find::name\n"; # Absolute path to file
    print "\$_                 $_\n";                # Name of the file (without path information)
    print "relative path      ". File::Spec -> abs2rel($File::Find::name, $root_dir), "\n";

    print "\n";
    
} # }}}
