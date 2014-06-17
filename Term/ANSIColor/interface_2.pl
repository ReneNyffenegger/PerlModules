use warnings;
use strict;

use Win32::Console::ANSI;            # Seems to be necessary on Windows

use Term::ANSIColor     ;            # Interface 2, no constants

my @predefined_colors = qw(black  red  green  yellow  blue  magenta  cyan  white);

for my $foreground_color (@predefined_colors) {
for my $bold             ('clear ', 'bold ' ) {
for my $background_color (@predefined_colors) {

  print color "$bold$foreground_color";
  print color "on_" . $background_color;
  printf " %8s ", $foreground_color;

# bright colors not always supported:
# print color "bright_$predefined_color";
# print "bright $predefined_color\n";

} print "\n" }} 

print color "reset";

print "\n";
