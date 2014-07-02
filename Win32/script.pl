use warnings;
use strict;

use Win32;

use File::Spec;
use Cwd;

my $path_of_script = File::Spec->canonpath(File::Spec->catdir(cwd, $0));

print "OS Name:    " . Win32::GetOSName       ()                           . "\n"; # for exampele «Win7»
print "Short Name: " . Win32::GetShortPathName($path_of_script)            . "\n";

