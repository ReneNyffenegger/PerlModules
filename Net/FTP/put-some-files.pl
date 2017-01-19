#!/usr/bin/perl
use warnings;
use strict;
use Net::FTP;

my $ftp = new Net::FTP(
  $ENV{TQ84_RN_FTP_HOST},
  Debug => 1,
  Passive=>1
) or die "Could not connect to $ENV{TQ84_RN_FTP_HOST}";

$ftp -> login($ENV{TQ84_RN_FTP_USER}, $ENV{TQ84_RN_FTP_PW}) or die "Could not login";

printf "Mode is %s\n", $ftp->passive ? 'active' : 'passive';

$ftp -> cwd('/test/NetFTP');


for my $i (1 .. 100) {
  open (my $f, '>', "/tmp/$i.txt") or die "could not open /tmp/$i.txt";

  for my $j (1 .. 100) {
    print $f "$i\n";
  }

  close $f;

  print "Trying to put $i.txt\n";
  $ftp -> put("/tmp/$i.txt") or die "Could not put /tmp/$i.txt";

  unlink "/tmp/$i.txt" or die;
}

for my $i (1 .. 100) {

  $ftp -> get("$i.txt", "/tmp/$i.get") or die;
  $ftp -> delete("$i.txt") or die;

  unlink "/tmp/$i.get" or die;
}
