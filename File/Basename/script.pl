use warnings; use strict;

use File::Basename;

printf "\n\nScript\n  %s is in directory\n  %s\n\n", $0, dirname($0);

my ($name, $path, $suffix);

print "\n  Without Suffixlist\n\n";
($name, $path, $suffix) = fileparse($0);
print "name:   $name\npath:   $path\nsuffix: $suffix\n";

print "\n  With Suffixlist,  excluding pl\n\n";
($name, $path, $suffix) = fileparse($0, ('.bat', '.exe'));
print "name:   $name\npath:   $path\nsuffix: $suffix\n";

print "\n  With Suffixlist, including pl\n\n";
($name, $path, $suffix) = fileparse($0, ('.bat', '.exe', '.pl'));
print "name:   $name\npath:   $path\nsuffix: $suffix\n";

print "\n  With Suffixlist and regular expression\n\n";
($name, $path, $suffix) = fileparse($0, qr/\.[^.]*$/);
print "name:   $name\npath:   $path\nsuffix: $suffix\n";
