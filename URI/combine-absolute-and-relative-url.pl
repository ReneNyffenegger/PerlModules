#!/usr/bin/perl
use warnings;
use strict;

use URI;

my $absolute_url = 'http://www.host.xyz/path/to/a/page.html';
my $relative_url = '../../of/another/resource.html';

print URI->new_abs($relative_url, $absolute_url), "\n";
