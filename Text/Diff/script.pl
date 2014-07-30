use warnings;
use strict;

use Text::Diff;

my $text_diff = diff('a.txt', 'b.txt', {STYLE=>'Context'});

print $text_diff;
# *** a.txt       Wed Jul 30 16:07:18 2014
# --- b.txt       Wed Jul 30 16:09:45 2014
# ***************
# *** 1,9 ****
#   one two
#   three four five
# ! six seven eight
#   nine ten
#   eleven
# ! twelve thirteen fourteen
# ! fivteen sixteen
#   seventeen eighteen
#   nineteen twenty
# --- 1,9 ----
#   one two
#   three four five
# ! six SEVEN eight
#   nine ten
#   eleven
# ! twelve thirteen
# ! fourteen fivteen sixteen
#   seventeen eighteen
#   nineteen twenty
