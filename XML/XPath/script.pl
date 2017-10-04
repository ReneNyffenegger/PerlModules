#!/usr/bin/perl
use warnings;
use strict;

use XML::XPath;

my $xml = qq{
<root attrib="hello world">
  <lvl_one id="id_a">foo</lvl_one>
  <lvl_one id="id_b">bar <lvl_two>two</lvl_two></lvl_one>
  <lvl_one id="id_b">baz <lvl_two>TWO<lvl_three>THREE</lvl_three></lvl_two></lvl_one>
  <xyz>Eggs, why and z</xyz>
</root>
};

my $xp = XML::XPath->new(xml => $xml);

printf "/root/\@attrib    : %s\n", $xp->findvalue  ('/root/@attrib'   ); # hello world
printf "/root//lvl_three : %s\n" , $xp->getNodeText('//lvl_three'     ); # THREE

my @lvl_one_nodes = $xp->findnodes('/root/lvl_one');
#  @lvl_one_nodes is an array of XML::Path::Node::Element

print "\nIterating over elements of /root/lvl_one\n";
for my $lvl_one_node (@lvl_one_nodes) {
  printf "  lvl_one_node: %s\n", $lvl_one_node->toString();
}

print "\nSame thing, but without recursing\n";
for my $lvl_one_node (@lvl_one_nodes) {
  printf "  lvl_one_node: %s\n", $lvl_one_node->toString(1);
}

print "\nExtracting ids\n";
for my $lvl_one_node (@lvl_one_nodes) {
  printf "  \@id %s\n", $lvl_one_node->findvalue('@id');
}
