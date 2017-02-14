#!/usr/bin/perl
use warnings;
use strict;

use Net::FTP;

my $host     = shift or die;
my $username = shift or die;
my $password = shift or die;
my $path     = shift or die;

my $ftp = Net::FTP->new($host) or die "Could not connect to $host";

$ftp->login($username, $password) or die "Could not login as $username";
$ftp->cwd($path);

my @dir = $ftp->dir;
my @ls  = $ftp->ls;

print "dir:\n  ";
print join "\n  ", @dir;

print "\nls\n  ";
print join "\n  ", @ls;
