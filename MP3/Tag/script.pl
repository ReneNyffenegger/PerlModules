use warnings;
use strict;
use MP3::Tag;

my $mp3_file = shift or die;
die unless -f $mp3_file;

my $mp3 = new MP3::Tag($mp3_file) or die;
my ($title, $track, $artist, $album, $comment, $year, $genre) = $mp3->autoinfo();

print "\n";
print "Album:   $album\n";
print "Track:   $track\n";
print "Title:   $title\n";
print "Artist:  $artist\n";
print "\n";

my @tagnames = $mp3 -> get_tags();
for my $tagname (@tagnames) {
   my $x = $mp3->{$tagname};
   print $x,"\n";
}

