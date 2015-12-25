use warnings;
use strict;

use Win32::Screenshot qw(:default);

my $img = CaptureScreen();
$img -> Write('screen.png');

# Following line writes
#   Use of uninitialized value in subroutine entry at C:/strawberry/perl/site/lib/Win32/Screenshot.pm line 177.
$img = CaptureWindow('C:\Windows\system32\cmd.exe - script.pl');
$img -> Write('cmd_exe.png');
