use warnings;
use strict;

use Parse::CSV;

my $parser = new Parse::CSV (file => 'data.csv', csv_attr => {sep_char => ",", quote_char=>"'"}) or die;

while (my $row = $parser -> fetch) {
  printf "%-5s %-5s %-5s\n", @$row;
}
