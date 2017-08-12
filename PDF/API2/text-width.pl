#!/usr/bin/perl
use warnings;
use strict;

use PDF::API2;

my $pdf = PDF::API2->new;
my $content = $pdf->page->text;

#  Corefonts: see install-dir/PDF/API2/Resource/Font/CoreFont/*.pm
#    my $courier_new = $pdf->corefont("Courier New");
#    my $helvetica   = $pdf->corefont("Helvetica"  );
#    my $georgia     = $pdf->corefont("Georgia"    );
#    $content->font($courier_new, 20);
#    $content->font($helvetica  , 20);
#    $content->font($georgia    , 20);

# TTF Fonts
my $garamond = $pdf->ttfont('/usr/share/fonts/TTF/LiberationSerif-Regular.ttf');
$content->font($garamond, 200);

print_text_width('i' );
print_text_width('ii');
print_text_width('M');
print_text_width('MM');
print_text_width('iM');
print_text_width('Hello World');

# sort_char_widths();

sub sort_char_widths { #_{
  my %char_widths;
  for my $char ('a' .. 'z', 'A' .. 'Z') {
    $char_widths{$char} = $content->text($char);
  }
  
  for my $char (sort { $char_widths{$a} <=> $char_widths{$b} } keys %char_widths) {
    printf "$char: %f\n", $char_widths{$char};
  }
} #_}

sub print_text_width { #_{
  my $text = shift;
  my $width = $content->text($text);

  printf "%-30s %7.2f\n", $text, $width;

} #_}
