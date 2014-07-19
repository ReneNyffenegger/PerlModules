use warnings;
use strict;

use File::Path qw(rmtree make_path);

if (-d 'TestRmTreeDir') {
  print "removing TestRmTreeDir\n";
  removeDirectory();
}
else {
  print "creating TestRmTreeDir\n";
  createDirectory();
}

if (-d 'recursive/directory') {
   print "removing recursive/directory\n";
   rmtree 'recursive/directory'; 
}
else {
   print "creating recursive/directory\n";
   make_path 'recursive/directory'; # Emulate mkdir -p with make_path
}


sub removeDirectory {
  rmtree 'TestRmTreeDir';
}

sub createDirectory {

  mkdir 'TestRmTreeDir';
  
  open (my $fh, '>', 'TestRmTreeDir/File.txt') or die;
  
  print $fh 'Some text goes into the file';
  
  close $fh;

}
