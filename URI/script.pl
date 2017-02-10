#!/usr/bin/perl
use warnings;
use strict;

use URI;

my $uri = URI->new("http://xxx.yy.ch:8080/a/b/c.html?vier=4&fuenf=5");

print "Scheme: ",$uri->scheme,"\n";
print "Path:   ",$uri->path  ,"\n";
print "Host:   ",$uri->host  ,"\n";
print "Port:   ",$uri->port  ,"\n";
print "Query:  ",$uri->query ,"\n";
