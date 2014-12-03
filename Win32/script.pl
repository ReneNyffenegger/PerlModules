use warnings;
use strict;

use Win32;

use File::Spec;
use Cwd;

my $path_of_script = File::Spec->canonpath(File::Spec->catdir(cwd, $0));

print "Working dir: " . Win32::GetCwd          ()                           . "\n";
print "OS Name:     " . Win32::GetOSName       ()                           . "\n"; # for exampele «Win7»
print "  Win 95?    " . Win32::IsWin95         ()                           . "\n";
print "  Win NT?    " . Win32::IsWinNT         ()                           . "\n";
print "Node Name    " . Win32::NodeName        ()                           . "\n"; 
print "Short Name:  " . Win32::GetShortPathName($path_of_script)            . "\n";
print "Login Name:  " . Win32::LoginName       ()                           . "\n";

my ($fs, $flags, $maxpath) = Win32::FsType;

print "Fs Type: $fs\n";
print "  flags:   $flags\n";
print "  maxpath: $maxpath\n";


my ($sp, $major, $minor, $build, $id) = Win32::GetOSVersion;

print "OS Version: $major.$minor\n";
print "  build: $build\n";
print "  id:    $id\n";
print "  sp:    $sp\n";
