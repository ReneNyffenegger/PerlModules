use warnings;
use strict;

use File::Slurp;

use YAPE::HTML;

my $html = read_file('../../HTML/test_01.html');

my $p = YAPE::HTML->new($html, 0);

my $indent_ = 0;

while (my $chunk = $p->next) {

  if ($chunk->type eq 'tag') {

    print '  ' x $indent_ . "Tag, ", $chunk->{TAG}, "\n";

    $indent_ ++;
  }
  elsif ($chunk->type eq 'closetag') {

    $indent_ --;

    print '  ' x $indent_ . "Close-Tag, ", $chunk->{TAG}, "\n";
  }
  elsif ($chunk->type eq 'text') {

    my $text = $chunk->{TEXT};
    $text =~ s/\n/ /g;
    $text =~ s/\s+/ /g;
    print '  ' x $indent_ . "Text " . $text . "\n";
  }
  elsif ($chunk->type eq 'comment') {

    print '  ' x $indent_ . "Comment: ", $chunk->{TEXT} . "\n";
  }
  elsif ($chunk->type eq 'dtd') {

    print "DTD " . join "-", keys %$chunk, "\n";
  }
  else {
    die "\n\n" . $chunk->type . "\n\n";
  }
}
