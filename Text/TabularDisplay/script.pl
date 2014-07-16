use warnings;
use strict;

use Text::TabularDisplay;

my $table = new Text::TabularDisplay( ('Column one', 'Column two', 'Column three'));

$table -> add ( 'Foo'    , 'Bar'    , 'Baz'  );
$table -> add (  111     ,  222     ,  333   );
$table -> add (    1.1   ,    2.2   ,    3.3 );

print $table -> render;

# prints
#
# +------------+------------+--------------+
# | Column one | Column two | Column three |
# +------------+------------+--------------+
# | Foo        | Bar        | Baz          |
# | 111        | 222        | 333          |
# | 1.1        | 2.2        | 3.3          |
# +------------+------------+--------------+
