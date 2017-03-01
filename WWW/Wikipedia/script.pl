#!/usr/bin/perl
#
#   http://stackoverflow.com/a/5645166/180275
#
use strict;
use warnings;

use WWW::Wikipedia;
use File::Slurp;

my $wiki  = WWW::Wikipedia->new(language => 'de');
my $entry = $wiki->search('Freienstein');


binmode STDOUT, ':utf8';
print $entry->text();

print "Related entries:\n";
for my $related ($entry->related) {
  print "  $related\n";
}
