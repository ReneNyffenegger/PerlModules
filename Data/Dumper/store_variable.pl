#!/usr/bin/perl
use warnings;
use strict;

use Data::Dumper;

my %test = (
  one => 1,
  two => 2,
  42  =>'forty two',
);

my $some_hash_ref = {
   foo => 'bar',
   now => 'then',
};

my $some_other_hash_ref = {
  some_hash_ref => $some_hash_ref
};

$some_hash_ref -> {some_other_hash_ref} = $some_other_hash_ref;

$test{some_hash_ref} = $some_hash_ref;

open  my $out, '>', 'variables.store' or die;
print $out Dumper(\%test);
close $out;
