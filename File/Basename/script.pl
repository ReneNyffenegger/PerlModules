#!/usr/bin/perl
#
#   Compare fileparse() with File::Spec->splitpath
#
use warnings;
use strict;

use File::Basename;

printf("%-20s : %-12s | %s\n", 'path', 'dirname', 'basename');
printf("%-20s : %-12s | %s\n", '----', '-------', '--------');
base_and_dirname('/'               );
base_and_dirname('/tmp'            );
base_and_dirname('/tmp/'           );
base_and_dirname('/tmp/abc'        );
base_and_dirname('/tmp/abc/'       );
base_and_dirname('/tmp/abc/def'    );
base_and_dirname('/tmp/abc/def.txt');
base_and_dirname('tmp/abc/def.txt' );
#
# path                 : dirname      | basename
# ----                 : -------      | --------
# /                    : /            | /
# /tmp                 : /            | tmp
# /tmp/                : /            | tmp
# /tmp/abc             : /tmp         | abc
# /tmp/abc/            : /tmp         | abc
# /tmp/abc/def         : /tmp/abc     | def
# /tmp/abc/def.txt     : /tmp/abc     | def.txt
# tmp/abc/def.txt      : tmp/abc      | def.txt


my $file = 'foo/bar/script.pl';

my ($name, $path, $suffix);

print "\n  Without Suffixlist\n\n";
($name, $path, $suffix) = fileparse($file);
print "name:   $name\npath:   $path\nsuffix: $suffix\n";
#
# name:   script.pl
# path:   foo/bar/
# suffix: 

print "\n  With Suffixlist,  excluding pl\n\n";
($name, $path, $suffix) = fileparse($file, ('.bat', '.exe'));
print "name:   $name\npath:   $path\nsuffix: $suffix\n";
#
# name:   script.pl
# path:   foo/bar/
# suffix: 

print "\n  With Suffixlist, including pl\n\n";
($name, $path, $suffix) = fileparse($file, ('.bat', '.exe', '.pl'));
print "name:   $name\npath:   $path\nsuffix: $suffix\n";
#
# name:   script
# path:   foo/bar/
# suffix: .pl

print "\n  With Suffixlist and regular expression\n\n";
($name, $path, $suffix) = fileparse($file, qr/\.[^.]*$/);
print "name:   $name\npath:   $path\nsuffix: $suffix\n";
# 
# name:   script
# path:   foo/bar/
# suffix: .pl

sub base_and_dirname {
  my $path = shift;
  printf ("%-20s : %-12s | %s\n", $path, dirname($path), basename($path));
}


