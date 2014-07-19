use warnings;
use strict;

use Text::ASCIITable;

my $table = Text::ASCIITable->new({ headingText => 'Title (headingText)' });

$table->setCols('Col one', 'Col two', 'Col three');

$table->addRow('Foo', 'abc defgh ijk',  11.11 );
$table->addRow('Bar', 'pqrst'        ,  22.222);
$table->addRow('Baz', 'uvw xyz'      , 222.3  );

$table->addRowLine();

$table->addRow('FBB' ,'lomdi barra'  ,   22   );

print $table;

#  Prints
#
# .-------------------------------------.
# |         Title (headingText)         |
# +---------+---------------+-----------+
# | Col one | Col two       | Col three |
# +---------+---------------+-----------+
# | Foo     | abc defgh ijk |     11.11 |
# | Bar     | pqrst         |    22.222 |
# | Baz     | uvw xyz       |     222.3 |
# +---------+---------------+-----------+
# | FBB     | lomdi barra   |        22 |
# '---------+---------------+-----------'
#
