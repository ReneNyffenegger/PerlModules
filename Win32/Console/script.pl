use strict;
use warnings;

use Win32::Console;

my $out = Win32::Console->new(STD_OUTPUT_HANDLE);

# my $in  = Win32::Console->new(STD_INPUT_HANDLE );
# $in->Mode(ENABLE_MOUSE_INPUT|ENABLE_WINDOW_INPUT);

$out -> Title('Win32::Console');

my ($x_, $y_, $width_, $height_) = $out->Window();


# $out->Size(10, 10);
my $absolute_ =  1;
my $x         = 10;
my $y         = 10;
my $w         = 50;
my $h         = 30;
$out -> Window($absolute_, $x, $y, $x+$w, $y+$y);
$out -> Cls();

# $out->Cursor(2, 2, 0, 0);
my $string = "Size: $width_ x $height_";
my $attrs = chr($BG_YELLOW | $FG_RED) x length($string);
$out->WriteAttr($attrs, 2, 2);
$out->WriteChar($string, 2, 2);

$out->FillAttr($BG_BLACK | $FG_BLUE, length($string), 2, 3);
$out->FillChar('=', length($string), 2, 3);

sleep 4;

# Resize to original size:
$out->Window($absolute_, $x_, $y_, $width_, $height_);
