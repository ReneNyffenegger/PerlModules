use warnings; use strict;

use Term::ReadKey;


my $raw_mode = 4; # Turn off controls keys ?
my $restore_original_settings = 0;

my $normal_read_using_getc =  0;
my $non_blocked_read       = -1;
my $wait_2_secs            =  5;

ReadMode ($raw_mode); 

my $key;
my $cnt = 0;

while (not defined ($key = ReadKey($non_blocked_read))) {
  print "non blocked read returned nothing (" . ++$cnt . ")\n";
}

print "You pressed $key\n";

$key = ReadKey($normal_read_using_getc);

print "You pressed $key\n";


$key = ReadKey($wait_2_secs);
print "You pressed $key\n";
