use warnings;
use strict;
use MP3::Tag;

my $mp3_file = shift or die;
die unless -f $mp3_file;

my $mp3 = MP3::Tag->new($mp3_file) or die;
my ($title, $track, $artist, $album, $comment, $year, $genre) = $mp3->autoinfo();

print "\n";
print "Album:   $album\n";
print "Track:   $track\n";
print "Title:   $title\n";
print "Artist:  $artist\n";
print "Comment: $comment\n";
print "Genre:   $genre\n";
print "Year:    $year\n";
print "\n";

my @tagnames = $mp3 -> get_tags();
for my $tagname (@tagnames) {
   my $x = $mp3->{$tagname};
   print $x,"\n";
}

print "\n";

if (exists $mp3->{ID3v2}) {
  my $id3v2 = $mp3->{ID3v2};
  print "ID3v2 exists: $id3v2\n";
}
