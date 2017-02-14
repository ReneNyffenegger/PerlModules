use warnings;
use strict;

use Win32::GUI();

my $wnd = Win32::GUI::Window->new(-text=> 'the Window', -width => 300, -height => 200);
$wnd -> AddLabel(-text => "Hello World");
$wnd -> Show();

Win32::GUI::Dialog();
