use warnings;
use strict;

use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new(
  create    => 1,   # Create new tab...
  activate  => 1,   # ... and activate it.
  autoclose => 0,   # Keep tab open after perl script end.
# --------------------------------------------------------
# Name of the program if unable to connect on first try:
  launch   =>'C:\Program Files\Mozilla Firefox\firefox.exe',
);


$mech->get('http://google.com');

print "Click ok in firefox\n";

$mech->eval_in_page('window.alert("Hello Firefox")');
# print $mech->eval_in_page('typeof(alert)');

my $png = $mech->content_as_png();

my $out_file='c:\temp\google.png';

open (my $f, '>', $out_file);

binmode $f;
print $f $png and print "google png written to $out_file\n";
close $f;
