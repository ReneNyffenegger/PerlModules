use warnings;
use strict;
use File::Find;
use feature 'say';


find({preprocess => \&preprocess,
      wanted     => \&wanted},
     '../..');

sub preprocess {
# Only files or directories that match

  say "Preprocess $File::Find::dir: ", join " - ", @_;
  return grep { m/o/ } @_;
}

sub wanted {
  say $File::Find::name;
}
