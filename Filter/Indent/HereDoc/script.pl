use warnings;
use strict;

use Filter::Indent::HereDoc;

my $nine_nine = 99;

print << END;
    one
    two
    three
        1
        2
       $nine_nine;
    END
