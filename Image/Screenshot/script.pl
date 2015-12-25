use warnings;
use strict;
use Imager::Screenshot qw(screenshot);
use Win32::GuiTest qw(FindWindowLike GetWindowRect);

die "This script is written for win32" unless Imager::Screenshot->have_win32;
die 'png not supported' unless $Imager::formats{png};

my $img_all = screenshot(hwnd => 0, monitor => -1);
$img_all -> write(file=>'img_all.png', type=>'png') or die;

my $img_100x100 = screenshot(left=>300, top=>300, right => 400, bottom=>400);
$img_100x100 -> write(file=>'img_100x100.png', type=>'png') or die;

my @w = FindWindowLike(undef, 'cmd.exe - script.pl$');
die unless @w == 1;
my $hwnd_cmd_exe = $w[0];

my $img_cmd_exe_client_area = screenshot(hwnd => $hwnd_cmd_exe);
$img_cmd_exe_client_area -> write(file=>'img_cmd_exe_client_area.png', type=>'png') or die;

my ($left, $top, $right, $bottom) = GetWindowRect($hwnd_cmd_exe);
my $img_cmd_exe_non_client_area = screenshot(left=>$left, top=>$top, right => $right, bottom=>$bottom);
$img_cmd_exe_non_client_area -> write(file=>'img_cmd_exe_non_client_area.png', type=>'png') or die;
