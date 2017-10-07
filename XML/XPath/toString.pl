#!/usr/bin/perl
use warnings;
use strict;


use XML::XPath;

my $xml  = qq{
<root>
  <abc id='1'><foo attr='x'>One  </foo></abc>
  <abc id='2'><foo attr='y'>Two  </foo></abc>
  <abc id='3'><foo attr='z'>Trhee</foo></abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);

my ($node) = $xp->findnodes('/root/abc[@id=2]');
print $node->toString();
