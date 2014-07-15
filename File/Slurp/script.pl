use warnings;
use strict;

use File::Slurp;

#
#  Read file into string (scalar context).
#
my $file_text=read_file(__FILE__); 
print $file_text;

#
#  Read file into array (list context).
#
my @file_lines=read_file(__FILE__); 
print join ". ", @file_lines;
