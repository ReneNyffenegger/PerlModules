#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='one'   desc='bla bla'  >Hello</abc>
  <abc id='two'   desc='yada yada'>World</abc>
  <abc id='three' desc='etc.'     >42   </abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);
my ($node) = $xp->findnodes('/root/abc[@id="two"]');

# Change 'yada yada' to 'changed'
print $node->setAttribute('desc', 'changed');

print $xp->findnodes_as_string('/');
