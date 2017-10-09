#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='one'   >Hello</abc>
  <abc id='two'   >World</abc>
  <abc id='three' >42   </abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);
my ($node) = $xp->findnodes('/root/abc[@id="two"]');


my $newAttribute = XML::XPath::Node::Attribute->new('new', 'value');
print $node->appendAttribute($newAttribute);

print $xp->findnodes_as_string('/');
