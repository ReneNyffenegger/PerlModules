use warnings;
use strict;


use PDF::API2;

use constant mm => 25.4 / 72;
use constant in => 1 / 72;
use constant pt => 1;

# use PDF::API2::Util;

my $pdf = PDF::API2->new;

my $courier_new = $pdf->corefont('Courier New');
my $page = $pdf->page;

# A4 with 3 mm border
my $w = 216/mm;
my $h = 303/mm;

$page->mediabox($w, $h);


for (my $x=0; $x<227; $x++) {
for (my $y=0; $y<187; $y++) {

  char($x, $y, int(rand(2)), int(rand(256)), int(rand(256)), int(rand(256)));

}}


$pdf->saveas( "$0.pdf" );
$pdf->end();

sub char {

  my $x     = shift;
  my $y     = shift;
  my $char  = shift;
  my $r     = shift;
  my $g     = shift;
  my $b     = shift;

  my $color = sprintf("#%02x%02x%02x", $r, $g, $b);

  my $txt_char = $page->text;

  $txt_char->font($courier_new, 4.5/pt );
  $txt_char->translate( $x * $w/227, $h - $y*$h/187);
  $txt_char->fillcolor($color);
  $txt_char->text($char);

}
