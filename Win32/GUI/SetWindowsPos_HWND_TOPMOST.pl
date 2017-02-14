use warnings;
use strict;

use Win32::GUI;
use Win32::GUI::Constants;

my $HWND_TOPMOST = Win32::GUI::Constants::constant('HWND_TOPMOST');

my $wnd = Win32::GUI::Window->new(-text=> 'the Window');# , -width => 300, -height => 200);
$wnd -> AddLabel(-text => "Hello World");
$wnd -> SetWindowPos($HWND_TOPMOST, 300, 200, 100, 80, 0);
$wnd -> Show();

Win32::GUI::Dialog();
