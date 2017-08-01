#!/usr/bin/perl
use warnings;
use strict;

use Parse::RecDescent;

my $grammar = q {

  pkg: proc(s)
   { print "pkg\n" }

  proc: 'procedure' /w+/ stmt(s) "end $item[1]" ';'
   { print "procedure $item[1]\n"; }

  stmt: /w+/ ';'
   { print "  stmt: $item[1]\n"; $return="$item[1]$item[2]"; }

};

my $parser = Parse::RecDescent->new($grammar) or die;

$parser->pkg('
  proc foo
    abc;
  end foo;
');
