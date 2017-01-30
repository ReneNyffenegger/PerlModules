#!/usr/bin/perl
use warnings;
use strict;

use Apache2::RequestUtil;
# use Apache2::RequestRec;

# $| = 1;
print "Content-type: text/html\r\n";
print "\r\n";

print "<h1>Apache2::RequestUtil->request()</h1>";

my $req = Apache2::RequestUtil->request;
my $str = $req->as_string;

$str =~ s/</\&lt;/;
$str =~ s/>/\&gt;/;
$str =~ s/&/\&amp;/;
print "<pre><code>$str</code></pre>";

print "<h1>\%ENV</h1>";
print "<table>";

for my $env (sort keys %{ENV}) {
  printf "<tr><td>%s</td><td>%s</td></tr>", $env, $ENV{$env};
}
print "</table>";
