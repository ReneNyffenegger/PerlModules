#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='one'                      >Hello</abc>
  <abc id='two'   superflous='extra' >World</abc>
  <abc id='three'                    >World</abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);
my ($node) = $xp->findnodes('/root/abc[@id="two"]');

print $node->removeAttribute('superflous');

print $xp->findnodes_as_string('/');
