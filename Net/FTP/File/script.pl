#!/usr/bin/perl
use warnings;
use strict;
use File::Slurp;

use Net::FTP::File;

my $hostname      = shift or die;
my $username      = shift or die;
my $password      = shift or die;
my $test_root_dir = shift or die;

my $ftp = new Net::FTP($hostname, Passive => 1, Debug=>0) or die "Could not open connection to $hostname";

$ftp -> login($username, $password) or die "Could not login";

printf "logged in, currend working dir: %s\n", $ftp->pwd;

if ($ftp -> exists ($test_root_dir)) {
  print "$test_root_dir exists, not creating it\n";
}
else {
  print "$test_root_dir does not exist, creating it...\n";
  $ftp -> mkdir ($test_root_dir) or die "could not created $test_root_dir\n";
}

$ftp -> cwd($test_root_dir);

for my $i  (1 .. 9) {

  write_file("/tmp/$i.txt",
"This is
file number $i
");
  
  print "putting $i.txt\n";
  $ftp -> put("/tmp/$i.txt");

}

print "pretty_dir(0)\n------------\n";
$ftp -> pretty_dir(0);
my $files = $ftp -> dir_hashref;
for my $file (keys %$files) {
  printf "%-5s: %4d %5s %2d %3s %s %s\n", $file,  @{$files->{$file}}{'bytes', 'yr_tm', 'day', 'month', 'perms', 'owner'};
}

print "\npretty_dir(1)\n------------\n";
$ftp -> pretty_dir(1);
$files = $ftp -> dir_hashref;
for my $file (keys %$files) {
  printf "%-5s: %4d %5s %2d %3s %s %s\n", $file,  @{$files->{$file}}{'Bytes', 'Last Modified Year/Time', 'Last Modified Day', 'Last Modified Month', 'Permissions', 'Owner'};
}

$ftp -> rmdir($test_root_dir, 1);
