# http://cpansearch.perl.org/src/KARASIK/Win32-GuiTest-1.60/eg/spy--.pl
# 
# MS has a very nice tool (Spy++).
# This is Spy--
use warnings;
use strict;

use Win32::GuiTest qw(FindWindowLike GetWindowText GetClassName GetChildDepth GetDesktopWindow);

for (FindWindowLike()) {
  my $s = sprintf("0x%08X", $_ );
  $s .= ", '" .  GetWindowText($_) . "', " . GetClassName($_);
  print "+" x GetChildDepth(GetDesktopWindow(), $_), $s, "\n";
}
