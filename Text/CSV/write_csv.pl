use warnings;
use strict;
use utf8;

use Text::CSV;

open my $csv_fh, ">:encoding(utf8)", "written.csv" or die;

my $csv = Text::CSV->new( {binary=>1, eol=>"\n"}) or die;

$csv -> print($csv_fh, ['foo', 'bar', 'baz']);
$csv -> print($csv_fh, ['The foo, the bar and the baz', 'This is a quote:", is it not', 'Smiley: ☺']);
