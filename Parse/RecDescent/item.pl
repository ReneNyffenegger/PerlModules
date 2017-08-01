#!/usr/bin/perl
use warnings;
use strict;

use Parse::RecDescent;

my $grammar = q {

  seq         : one_char three_chars two_chars
              { main::print_item(\@item, \%item); }

  one_char    : character
              { main::print_item(\@item, \%item); }

  three_chars : character character character
              { main::print_item(\@item, \%item); }
  
  two_chars   : character
              { main::print_item(\@item, \%item); }

  character   : /\w/
              { main::print_item(\@item, \%item);}
};

my $parser=Parse::RecDescent->new($grammar) or die;

$parser->seq("A B C D E F");


sub print_item {
  no warnings 'once';
  my @item = @{ $_[0] };
  my %item = %{ $_[1] };
  print join " -- ", @item;
  print "\n";
  print map {$_ . "=" . $item{$_} . "; "} keys %item;
  print "\n\n";
  $Parse::RecDescent::return = join "", @item[1..$#item]; # $Parse::RecDescent::return 
}
