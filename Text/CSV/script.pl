use warnings;
use strict;

use Text::CSV;

my $csv = new Text::CSV ( {binary   => 1, sep_char => ';'} ) or die Text::CSV -> error_diag();

open (my $file_handle, '<', 'data.csv') or die "could not open data.csv";

while (my $record = $csv->getline($file_handle)) {

  print "\n---------\n";
  print join "\n", @$record;

}

close $file_handle;
