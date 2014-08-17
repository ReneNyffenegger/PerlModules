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
print "Joined thread 0\n";
$t[1] -> join();
print "Joined thread 1\n";
$t[2] -> join();
print "Joined thread 2\n";

sub A {
  for my $i (1 .. 4) {
     sleep 2;
     print "A $i\n";
  }
}

sub B {
  for my $i (1 .. 3) {
     sleep 3;
     print "B $i\n";
  }
}

sub C {
  for my $i (1 .. 3) {
     sleep 4;
     print "C $i\n";
  }
}
__END__
A 1
B 1
A 2
C 1
A 3
B 2
A 4
Joined thread 0
C 2
B 3
Joined thread 1
C 3
Joined thread 2
