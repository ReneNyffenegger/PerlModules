#!/usr/bin/perl
use warnings;
use strict;

use File::MergeSort;

my $sort = new File::MergeSort (
   [ 'input-1', 'input-2', 'input-3', 'input-4'],
   sub {
       my $line = shift;
       (my $num = $line) =~ s/ .*//;

     # sprintf because File::MergeSort compares characters, not numbers.
       return sprintf("%05d", $num);
   },
   {} # options
);

while (my $sorted_line = $sort->next_line()) {

  print "$sorted_line";

}

