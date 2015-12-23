use warnings;
use strict;

use Win32::GUI 1.0;
use Win32::GUI::HyperLink;

my $win = Win32::GUI::Window->new(
  -pos   => [ 100, 100 ],
  -size  => [ 200,  80 ],
);

$win->AddHyperLink(
  -text => "http://renenyffenegger.ch",
  -pos  => [10,10],
);

$win->Show();
Win32::GUI::Dialog();
exit 0 ;
