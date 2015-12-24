use warnings;
use strict;

use Win32::Process;
use Win32;

my $p;
Win32::Process::Create($p, 'C:\windows\notepad.exe', 'script.pl', 0, NORMAL_PRIORITY_CLASS, ".") || die Win32::FormatMessage( Win32::GetLastError() );

sleep 1;
$p->Suspend();

print "press enter to resume again\n";
my $d = <STDIN>;

$p->Resume();
$p->Wait(INFINITE);
