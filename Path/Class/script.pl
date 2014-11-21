use warnings;
use strict;

use Path::Class;

my $dir_ = dir('..','..');

# $dir_ is a Path::Class::Dir object
print ref $dir_,"\n";

my $h = $dir_ -> open;
while (my $item = $h -> read) {

  # turn $item into a Path::Class::File object
  my $file_ = $dir_ -> file($item);

  printf "%-20s %s\n", $item,  $file_;
}
