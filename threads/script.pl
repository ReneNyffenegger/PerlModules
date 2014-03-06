#!/usr/bin/perl

use warnings;
use strict;
use threads;

my @t = (
  threads->create(\&A),
  threads->create(\&B),
  threads->create(\&C)
);

$t[0] -> join();
$t[1] -> join();
$t[2] -> join();

sub A {
  for my $i (1 .. 7) {
     print "A $i\n";
     sleep 2;
  }
}

sub B {
  for my $i (1 .. 4) {
     print "B $i\n";
     sleep 3;
  }
}

sub C {
  for my $i (1 .. 3) {
     print "C $i\n";
     sleep 5;
  }
}

