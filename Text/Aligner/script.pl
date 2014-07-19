use warnings;
use strict;

use Text::Aligner 'align';

use File::Slurp;

my @program_lines = read_file(__FILE__);

my @aligned_program = align('right', @program_lines);

print for @aligned_program;
