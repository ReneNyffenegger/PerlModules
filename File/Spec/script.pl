use warnings; use strict;

use File::Spec;

use Cwd;


print "canonpath\n";
print "---------\n";

print "\n" .                       cwd ;
print "\n" . File::Spec->canonpath(cwd);
print "\n" . File::Spec->canonpath(cwd . '/../..');
print "\n\n"                           ;

print "catdir\n";
print "------\n";

print "\n" . File::Spec->catdir(     '..', '..');
print "\n" . File::Spec->catdir(cwd, '..', '..');
print "\n\n"                           ;

print "catfile\n";
print "------\n";

print "\n" . File::Spec->catfile('..', '..', 'file.txt');
print "\n\n"                           ;

print "curdir\n";
print "------\n";

print "\n" . File::Spec->curdir        ;
print "\n\n"                           ;

print "devnull\n";
print "-------\n";

print "\n" . File::Spec->devnull       ;
print "\n\n"                           ;

print "rootdir\n";
print "-------\n";

print "\n" . File::Spec->rootdir       ;
print "\n\n"                           ;

print "tmpdir\n";
print "------\n";

print "\n" . File::Spec->tmpdir        ;
print "\n\n"                           ;

print "updir\n";
print "-----\n";

print "\n" . File::Spec->updir         ;
print "\n\n"                           ;
