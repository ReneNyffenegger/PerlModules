use warnings;
use strict;
use URI::Find;

my $linkifyer = URI::Find->new(sub {
    my $uri       = shift;
    my $orig_uri  = shift;

#   print "$uri  $orig_uri\n";

    return "<a href='$uri'>$uri</a>";
});

open my $html, '>', 'script-out.html' or die;

print $html "<html><body>";


while (my $line = <DATA>) {

  $linkifyer -> find(\$line);
  print $html $line;

}

print $html "</body></html";
close $html;


__DATA__
Here are a few links: http://www.renenyffenegger.ch, http://www.google.com, and http://www.github.com. Note
the trailing dot after github.org.

