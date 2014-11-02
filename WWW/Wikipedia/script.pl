#
#   http://stackoverflow.com/a/5645166/180275
#
use strict;
use warnings;

use WWW::Wikipedia;
use File::Slurp;

my $wiki  = WWW::Wikipedia->new();
my $entry = $wiki->search('New York');

binmode STDOUT, ':utf8';
print $entry->text();


# my $html = wikiformat($fulltext);

# write_file('new_york.html', {binmode => ':utf8'}, $html);
