use warnings;
use strict;

use utf8;

use HTML::Entities;

print encode_entities ('René');   # prints «Ren&eacute;»
