use warnings;
use strict;

use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new();

$mech->get('http://google.com');

print "Click ok in firefox\n";

$mech->eval_in_page('alert("Hello Firefox")');

my $png = $mech->content_as_png();

my $out_file='c:\temp\google.png';

open (my $f, '>', $out_file);

binmode $f;
print $f $png and print "google png written to $out_file\n";
close $f;
