use warnings;
use strict;

use HTML::TokeParser;

my $p = HTML::TokeParser->new("../test_01.html") or die "Can't open: $!";

my $indent_ = 0;
while (my $t = $p->get_token) {

  if     ($t->[0] eq 'S') {

    print '  ' x $indent_ . 'Start-Tag: ' . $t->[1] . "\n";

    $indent_ ++;

  }
  elsif ($t->[0] eq 'E') {

    $indent_ --;

    print '  ' x $indent_ . 'End-Tag: ' . $t->[1] . "\n";

  }
  elsif ($t->[0] eq 'T') {

    my $text = $t->[1];
    $text =~ s/\n|\r//g;
    $text =~ s/\s+/ /g;
    print '  ' x $indent_ . 'Text: ' . $text . "\n";
  }


}
