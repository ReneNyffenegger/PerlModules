#!/usr/bin/perl
use warnings;
use strict;

use HTML::LinkExtractor;

my $base_url = 'http://server.xyz/path/to/baseurl.html';

my $html = <<HTML;
<!doctype html>
<head>
  <title>Simple HTML page</title>
</head>
<body>

  <h1>Heading</h1>

  <p>Some text with a <a href="http://renenyffenegger.ch/">link to my homepage</a>.</p>

  There are two more links: <ul>
    <li>A <a href="../relative.html">relative link</a> and
    <li>one to <a href="file:///home/rene/test/foo.html">a local page</a>.
  </ul>

  <p><img src='picture.gif'>

</body>
</html>
HTML

my $extractor = HTML::LinkExtractor->new(\&link_found, $base_url);
$extractor -> parse(\$html);

sub link_found {
  my $extractor = shift; # not needed here: reference to extractor object
  my $link      = shift;

  my $link_to;
  my $text = '';

  if ($link->{tag} eq 'a') {
    $link_to = $link -> {href};
    $text    = $link -> {_TEXT};
  }
  elsif ($link->{tag} eq 'img') {
    $link_to = $link -> {src};
  }
  else {
    print "unhandled tag $link->{tag}\n";
    return;
  }


  printf "Found link: %-50s %s\n", $link_to, $text;

}
