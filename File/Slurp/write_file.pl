use warnings;
use strict;

use File::Slurp;

my $file_name = 'written_file.txt';

unlink $file_name if -f $file_name;

my @lines = (
  "foo bar baz\n",
  "one two three\n",
  "1 2 3 4 5 6 7 8 9\n"
);

write_file($file_name, @lines);
