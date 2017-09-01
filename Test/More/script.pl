#!/usr/bin/perl
use warnings;
use strict;
use utf8;

use Test::More tests => 9;

use_ok('Test::More');

is  (42, 7*6, 'Text 42 = 7*6');
isnt(42, 7+6, 'Text 42 ≠ 7+6');

like('foo bar baz', qr/o+ b.. b\w/, 'foo bar baz is like o+ b.. b\w');

my @one = qw(foo bar baz);
my @two = qw(foo bar baz);

is_deeply(\@one, \@two, '@one == @two');

SKIP: {
# Skip two tests
  skip('Skipping two tests', 2) if 1;
  ok(1, 'Not skipped 1');
  ok(1, 'Not skipped 2');
}

package P;                 sub new { return bless {}, shift; }
package C; our @ISA=qw(P); sub new { return bless {}, shift; }

package main;

my $p = P->new();
my $c = C->new();

isa_ok($p, 'P', '$p isa P');
isa_ok($c, 'P', '$p isa P');
