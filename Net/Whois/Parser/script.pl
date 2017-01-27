#!/usr/bin/perl
#
#   http://stackoverflow.com/a/11900805/180275
#
use warnings;
use strict;

use Net::Whois::Parser;
$Net::Whois::Parser::GET_ALL_VALUES = 1;

my $domain = shift or die;  

my $whois = parse_whois(domain => $domain) or die;

my @keys = keys %$whois;

for my $category (qw/ admin  registrant  tech/) {
  print "$category:\n";
  printf "  $_ => $whois->{$_}\n" for grep /^${category}_/, @keys;
  print "\n";
}
