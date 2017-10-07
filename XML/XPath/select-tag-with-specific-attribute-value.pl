#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='foo'>Hello</abc>
  <abc id='bar'>World</abc>
  <abc id='baz'>42</abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);

my $val = $xp->getNodeText('/root/abc[@id="bar"]');
print "val = $val\n"; # val = World
