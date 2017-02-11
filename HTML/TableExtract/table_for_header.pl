use warnings;
use strict;

use HTML::TableExtract;
use String::Util 'trim';
use File::Slurp;

my $html = read_file('table_for_header.html');

my $te = HTML::TableExtract->new(
   headers => ['Head 2', 'Head 3', 'Head 1'] # note: tr with «Head n» won't be displayed, col-2 will be printed after col-3.
);

$te -> parse($html);

foreach my $table ( $te->tables ) {

    print "\n\n\nTable (", join(',', $table->coords), "):\n-----------\n";   # (0,0)

    foreach my $row ($table->rows) {
      printf (("%-10s " x (@$row)) . "\n", map { $_ = trim $_; $_ ||= '-'; } @$row);
    }

}
