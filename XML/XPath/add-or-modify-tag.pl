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

add_or_modify_tag('bar', 'none');
add_or_modify_tag('baz', 'all' );

sub add_or_modify_tag {

  my $abc_id     = shift;
  my $access_new = shift;

  my ($node) = $xp->findnodes(sprintf '/root/abc[@id="%s"]', $abc_id);

  if ($node) {
    $node->setAttribute('access', $access_new);
  }
  else {
    my $new_node    = XML::XPath::Node::Element->new('abc');
    my $new_attr    = XML::XPath::Node::Attribute->new('id'    , $abc_id    );

    $new_node->setAttribute('access', $access_new);
    $new_node->appendAttribute($new_attr);

    my ($root) = $xp->findnodes('/root');
    $root->appendChild($new_node);

  }
}

print $xp->findnodes_as_string('/');
