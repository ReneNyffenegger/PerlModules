#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml  = qq{
<root>
  <abc id='foo' access='read'      >Hello</abc>
  <abc id='bar' access='read/write'>World</abc>
</root>
};

my $xp = XML::XPath->new(xml => $xml);

my $new_node    = XML::XPath::Node::Element->new('abc');
my $node_text   = XML::XPath::Node::Text->new('foo');
my $attr_id     = XML::XPath::Node::Attribute->new('id');
my $attr_access = XML::XPath::Node::Attribute->new('access');

$attr_id     -> setNodeValue('baz');
$attr_access -> setNodeValue('all');

$new_node->appendChild($node_text);
$new_node->appendAttribute($attr_id);
$new_node->appendAttribute($attr_access);


#
# findnodes returns a XML::XPath::NodeSet, but for the appendChild
# below, we're instersted in an XML::XPath::Node:Element.
# Therefore, the $root is enclosed in paranthesis:
#
my ($root) = $xp->findnodes('/root');

$root->appendChild($new_node);

print $xp->findnodes_as_string('/');
