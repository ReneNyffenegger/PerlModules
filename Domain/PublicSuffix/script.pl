#!/usr/bin/perl
use warnings;
use strict;

use Domain::PublicSuffix;

my $suffix = Domain::PublicSuffix->new() or die;

print_root('www.google.com');
print_root('foo.co.uk');
print_root('www.foo.bar.ch');
print_root('www.foo.co.uk');
print_root('www.foo.com.in');
print_root('www.foo.com.tr');
print_root('www.foo.com.br');
print_root('www.foo.com.cn');

sub print_root {
  my $host = shift;
  printf "%-15s -> %s\n", $host, $suffix->get_root_domain($host);
}

