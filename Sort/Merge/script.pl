#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';
use Sort::Merge;

open (my $fh1, '<', 'input_1') or die;
open (my $fh2, '<', 'input_2') or die;


Sort::Merge::sort_coderefs(
    [  sub { read_line($fh1) },
       sub { read_line($fh2) }
    ], sub { 
        my $x   = shift;
        my $key = $x->[1];
        my $val = $x->[2];
        say "$key $val";
    }
);

sub read_line {
  my $fh = shift;
  my $line = <$fh>;
  return () unless $line;

  return split ' ', $line;
}
