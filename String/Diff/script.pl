use warnings;
use strict;
use feature 'say';

use String::Diff;

my ($one, $two) = String::Diff::diff (
                    'Well, a bit here and a bit there',
                    'ok, a bit in San Francisco and a bit in New York',
                    remove_open  => '<strike>',
                    remove_close => '</strike>',
                    append_open  => '<b>',
                    append_close => '</b>');

say $one;
say $two;
__END__
<strike>Well</strike>, a bit <strike>he</strike>r<strike>e</strike> and a bit <strike>th</strike>er<strike>e</strike>
<b>ok</b>, a bit <b>in San F</b>r<b>ancisco</b> and a bit <b>in N</b>e<b>w Yo</b>r<b>k</b>
