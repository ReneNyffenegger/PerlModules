use warnings;
use strict;
use feature 'say';

use String::HexConvert ':all';

say ascii_to_hex('René'); # 52656ec3a9

say hex_to_ascii('52656ec3a9');
