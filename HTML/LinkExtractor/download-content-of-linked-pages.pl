#!/usr/bin/perl
use warnings;
use strict;

use HTML::LinkExtractor;
use LWP::Simple qw(get);
use File::Path qw(make_path);
use URI;

my $url = $ARGV[0] or die "No url specified";

my $html = get($url) or die;

my $extractor = new HTML::LinkExtractor(\&link_found, $url);

$extractor -> parse(\$html);

sub link_found {
  my $link = $_[1];

  return unless $link->{tag} eq 'a';

  my $href=$link->{href};

  $href .= 'index' if substr($href, -1) eq '/'; # Add index to link if it ends in a slash...

  my $uri = new URI($href);


  my $host      = $uri->host;
  my $full_path = "downloads/$host". $uri->path;
  $full_path .= '?' . $uri->query if $uri->query;

  print "href = $href\nhost = $host\nfull_path= $full_path\n";

  $full_path =~ s/#[^#]*$//;
  
  return if -e $full_path;

 (my $dirname ) = $full_path =~ m!(.*)/[^/]+$!;

  print "$href  -> $host -> $full_path -> $dirname\n";
  make_path $dirname unless -d $dirname;
 
  open my $out , '>', $full_path or die "$full_path\n$!";
  print $out (get($href));
  close $out;

  printf "Downloaded %-100s to %s\n", $href, $full_path;
}
