use warnings;
use strict;
use Win32::GuiTest qw(SendKeys);

system("start notepad.exe");

sleep 1;

SendKeys("Sending some keystrokes\n\n");
SendKeys("closing with ALT{+}F4");

sleep 1;

# The % is ALT
Win32::GuiTest::SendKeys("%{F4}{TAB}{ENTER}");
