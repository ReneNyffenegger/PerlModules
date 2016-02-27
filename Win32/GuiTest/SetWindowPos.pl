use warnings;
use strict;

use Time::Hires qw(sleep);
use Win32::GuiTest qw(FindWindowLike SetWindowPos);

system("start notepad.exe $0");

Time::HiRes::sleep (0.5);

my @w = FindWindowLike(undef, ".*SetWindowPos.pl.*", 'Notepad');


die @w unless @w == 1;

my $w = $w[0];

for (my $i=0; $i<10; $i++) {

  my $x_ = int(rand(500));
  my $y_ = int(rand(500));
  my $w_ = int(rand(500));
  my $h_ = int(rand(500));

  SetWindowPos($w, 0, $x_, $y_, $x_+$w_, $y_+$h_, 0);

  Time::HiRes::sleep 0.2;

}
