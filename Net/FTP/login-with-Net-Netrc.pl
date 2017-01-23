#!/usr/bin/perl
use warnings;
use strict;
use Net::FTP;
use Net::Netrc;

my $hostname = shift or die "No hostname given";
die "~/.netrc is needed" unless glob '~/.netrc';

my ($username, $password) = Net::Netrc -> lookup($hostname) -> lpa;

my $ftp = new Net::FTP($hostname, Debug => 0) or die "Could not open connection to $hostname";
$ftp -> login($username, $password) or die "$username, $password";

printf "Logged in, current working directory: %s\n", $ftp->pwd;

print join "\n", $ftp -> ls;
