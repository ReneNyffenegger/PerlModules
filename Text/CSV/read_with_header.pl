#
#   http://stackoverflow.com/a/20736683/180275
#
use warnings;
use strict;

use Text::CSV;

my $csv = new Text::CSV ( {binary   => 1} ) or die Text::CSV -> error_diag();

open (my $file_handle, '<', 'data_with_header.csv') or die "could not open data.csv";

my $header = $csv ->getline($file_handle);

$csv -> column_names($header);

# print join (' | ', @$header);


while (my $line = $csv -> getline_hr($file_handle)) {
  printf "%-10s | %-10s | %-10s\n", $line->{col_1}, $line->{col_2}, $line->{col_3};
}

close $file_handle;
