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

# Output:
# 
# www.google.com  -> google.com
# foo.co.uk       -> foo.co.uk
# www.foo.bar.ch  -> bar.ch
# www.foo.co.uk   -> foo.co.uk
# www.foo.com.in  -> com.in
# www.foo.com.tr  -> foo.com.tr
# www.foo.com.br  -> foo.com.br
# www.foo.com.cn  -> foo.com.cn
