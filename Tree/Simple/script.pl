#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Tree::Simple;

my $root = Tree::Simple->new("The root"); # , Tree::Simple->ROOT

# $root is a root tree, because it has no parents.
die unless $root->isRoot();

# The node value of a tree is the value passed in it's constructor:
die if $root->getNodeValue() ne 'The root';

my $child_1 = Tree::Simple->new("1");

# $child_1 is also, as of yet, a root tree
die unless $child_1->isRoot();

# Adding the child to the root tree:
$root->addChild($child_1);

# $child_1 is no root tree anymore:
die if $child_1->isRoot();

# $root has childrent, so it's not a leaf:
die if $root->isLeaf();

# $child_1 has no children, so it's a leaf:
die unless $child_1->isLeaf();

# getDepth(), not so intuitively, returns -1 for a root tree
die if $root->getDepth() != -1;

# A child's getDepth() is the parent's getDepth() + 1:
die if $child_1->getDepth() != 0;

# Checking the node value of the child
die if $child_1->getNodeValue() ne '1';

# Each tree has a UID
say $root->getUID();
# 0x22e8f30

say $child_1->getUID();
# 0x2308a18

# They should be equal:
die if $root->getChild(0)->getUID() ne $child_1->getUID();

# They should be equal, too:
die if $child_1->getParent()->getUID() ne $root->getUID();

# Adding another child to the tree …
my $child_2 = Tree::Simple->new("2");

# … but this time as a sibling:
$child_1->addSibling($child_2);

# The usual stuff applies for $child_2, too:
die if      $child_2->isRoot();
die unless  $child_2->getDepth() == 0;
die unless  $child_2->getNodeValue() eq "2";
die unless  $child_2->isLeaf();

die if $child_2->getParent()->getChild(0)->getUID() ne $child_1->getUID();
die if $child_1->getParent()->getChild(1)->getUID() ne $child_2->getUID();

# Adding a child to $child_2 (Note the 2nd parameter in new)
my $child_2_1 = Tree::Simple->new("2/1", $child_2);

# $child_2_1 is not a root
die if $child_2_1->isRoot();

# and $child_2 is not a leaf anymore:
die if $child_2->isLeaf();

# Depth of $child_2_1:
die unless $child_2_1->getDepth() == 1;

# Inserting a child at a specific index
$root->insertChild(1, Tree::Simple->new('inserted'));

# $root has now 3 children
die unless $root->getChildCount() == 3;

die unless $root->getChild(0)->getNodeValue() eq '1';
die unless $root->getChild(1)->getNodeValue() eq 'inserted';
die unless $root->getChild(2)->getNodeValue() eq '2';

die unless $root->getChild(0)->getIndex() == 0;
die unless $root->getChild(1)->getIndex() == 1;
die unless $root->getChild(2)->getIndex() == 2;

# Iterating over all (immediate) children
for my $child (@{$root->getAllChildren()}) {
  say $child->getNodeValue();
}
# 1
# inserted
# 2

# Adding a few children in one go
#
# First checking if $child_1 is still a leaf
die unless $child_1->isLeaf();
$child_1->addChildren (
  Tree::Simple->new('1/1'),
  Tree::Simple->new('1/2'),
  Tree::Simple->new('1/3'),
  Tree::Simple->new('1/4')
);

# $child_1 is no leaf anymore
die if $child_1->isLeaf();

# $child_1 has four children
die unless $child_1->getChildCount() == 4;

# getting a child from a (sub-)tree:
my $child_1_3 = $child_1->getChild(2);
die unless $child_1_3->getNodeValue() eq '1/3';

# More traversing the tree
die unless $child_1_3->getParent()->getParent()->getNodeValue() eq 'The root';
die unless $child_1_3->getParent()->getParent()->getChild(2)->getChild(0)->getNodeValue() eq '2/1';

# Inserting multiple children at a specific index
$child_1->insertChildren(2,
  Tree::Simple->new('1/inserted-1'),
  Tree::Simple->new('1/inserted-2')
);

# Adding a few children to $child_1_3 so that
# the overall depth of the tree grows a bit
my $child_1_3_1 = Tree::Simple->new('1/3/1');
my $child_1_3_2 = Tree::Simple->new('1/3/2');
my $child_1_3_3 = Tree::Simple->new('1/3/3');
$child_1_3->addChild($child_1_3_1);
$child_1_3->addChild($child_1_3_2);
$child_1_3->addChild($child_1_3_3);

$child_1_3_2->addChild(Tree::Simple->new('1/3/2/1'));

# traverse the tree
$root->traverse (
  sub {
    my $node = shift;
    say (('. ' x $node->getDepth()) . $node->getNodeValue());
  }
);
# 
# 1
# . 1/1
# . 1/2
# . 1/inserted-1
# . 1/inserted-2
# . 1/3
# . . 1/3/1
# . . 1/3/2
# . . . 1/3/2/1
# . . 1/3/3
# . 1/4
# inserted
# 2
# . 2/1
