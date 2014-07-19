use warnings;
use strict;

use Text::Table;

my $table = Text::Table->new( "Header 1", "Header 2\nints", "Header 3\nfloats");

$table->load(
    [ 'Detail 1',     1,   0.1   ],
    [ 'Detail 2',    22,   2.22  ],
    [ 'Detail 3',   333,  33.333 ],
    [ 'Detail 4',  4444, 444.4444]
);

print $table;

#  prints:
#
#  Header 1 Header 2 Header 3
#           ints     floats
#  Detail 1    1       0.1
#  Detail 2   22       2.22
#  Detail 3  333      33.333
#  Detail 4 4444     444.4444
