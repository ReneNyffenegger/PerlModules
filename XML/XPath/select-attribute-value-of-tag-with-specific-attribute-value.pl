#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='foo' access='read'      >Hello</abc>
  <abc id='bar' access='read/write'>World</abc>
  <abc id='baz' access='none'      >42</abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);

my $access = $xp->getNodeText('/root/abc[@id="bar"]/@access');
print "access = $access\n"; # access = read/write
