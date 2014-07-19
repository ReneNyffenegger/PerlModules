use warnings;
use strict;

use HTML::TableExtract;
use String::Util 'trim';
use File::Slurp;

my $html = read_file('tables.html');

my $te = new HTML::TableExtract;

$te -> parse($html);

foreach my $table ( $te->tables ) {

    print "\n\n\nTable (", join(',', $table->coords), "):\n-----------\n";   # (0,0)

    foreach my $row ($table->rows) {
      printf (("%-30s " x (@$row)) . "\n", map { $_ = trim $_; $_ //= '-'; substr($_, 0, 30); } @$row);
    }

}
