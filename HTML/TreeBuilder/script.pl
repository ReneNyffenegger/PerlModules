use warnings;
use strict;

use HTML::TreeBuilder;

my $htmlTree = HTML::TreeBuilder->new;

# $htmlTree -> implicit_tags(1);

$htmlTree -> parse_file('../test_01.html');

$htmlTree -> dump;
# print $htmlTree -> as_HTML;
