#!/usr/bin/perl
use warnings;
use strict;

use Tree::Simple;
use Tree::Simple::View::HTML;

my $tree=Tree::Simple->new('root');

$tree->addChildren(
  Tree::Simple->new('0') -> addChildren (
    Tree::Simple->new('0.0'),
    Tree::Simple->new('0.1'),
    Tree::Simple->new('0.2')),
  Tree::Simple->new('1') -> addChildren(
    Tree::Simple->new('1.0')),
  Tree::Simple->new('2') -> addChildren(
    Tree::Simple->new('2.0') -> addChildren(
      Tree::Simple->new('2.0.0'),
      Tree::Simple->new('2.0.1'),
      Tree::Simple->new('2.0.2')
    ),
    Tree::Simple->new('2.1')
  )
);

my $tree_view_html = Tree::Simple::View::HTML->new($tree);

my $html = $tree_view_html->expandAll();

open (my $html_h, '>', 'expandAll.html') or die;
print $html_h $html;
close $html;
