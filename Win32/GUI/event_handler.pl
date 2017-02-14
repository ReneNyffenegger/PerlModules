use warnings;
use strict;

use Win32::GUI();

my $wnd = Win32::GUI::Window->new(-name=>'myWindow', -text=> 'the Window', -width => 300, -height => 200);
$wnd -> AddLabel(-text => "Hello World");
$wnd -> Show();

Win32::GUI::Dialog();

#
#  A handler for the Terminate event.
#
sub myWindow_Terminate {
  print "The window was terminated";
  return -1; # returning 0 prevents the Window from being closed
}
