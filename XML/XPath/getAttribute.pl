#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='one' desc='bla bla'  >Hello</abc>
  <abc id='two' desc='yada yada'>World</abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);
my ($node) = $xp->findnodes('/root/abc[@id="two"]');

print $node->getAttribute('desc'), "\n"; # yada yada
