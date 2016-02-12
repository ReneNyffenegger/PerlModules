use warnings;
use strict;


use PDF::API2;

use constant mm => 25.4 / 72;
use constant in => 1 / 72;
use constant pt => 1;

# use PDF::API2::Util;

my $pdf = PDF::API2->new;

my $font = $pdf->corefont('Courier New');
my $page = $pdf->page;

$page->mediabox( 216/mm , 303/mm );  # A4 with 3 mm border

my $txt_bottom_left = $page->text;
$txt_bottom_left->font( $font, 18/pt );
$txt_bottom_left->translate( 3/mm, 3/mm );
$txt_bottom_left->fillcolor('#ff7700');
$txt_bottom_left->text("Bottom left");

my $txt_top_right = $page->text;
$txt_top_right->font( $font, 18/pt );
$txt_top_right->translate( 213/mm, 303/mm - 18/pt );
$txt_top_right->fillcolor('#0077ff');
$txt_top_right->text_right("Top right");

$pdf->saveas( "$0.pdf" );
$pdf->end();
