use warnings;
use strict;
use MP3::Info;

my $mp3_file = shift or die;
die unless -f $mp3_file;

my $mp3  = MP3::Info->new($mp3_file);

foreach my $field qw(ARTIST ALBUM TITLE TRACKNUM YEAR GENRE COMMENT) {
 printf("%-20s %s\n", ucfirst(lc $field), $mp3->{$field});
}
# Same thing?
# -----------
# my $tag  = get_mp3tag($mp3_file);
# foreach my $field qw(ARTIST ALBUM TITLE TRACKNUM YEAR GENRE COMMENT) {
#  printf("%-20s %s\n", ucfirst(lc $field), $tag->{$field});
# }


print "\n";

my $t = get_mp3tag($mp3_file, 2, 1);
print join "\n", keys %$t;

print $mp3->{TPUB};
