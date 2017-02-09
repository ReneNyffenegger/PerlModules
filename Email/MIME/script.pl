#!/usr/bin/perl
use warnings;
use strict;

use Email::MIME;

my $rfc_2822 = <<'END_2822';
Message-ID: <some_id>
From: "Beleidigte Leberwurs" <beleidigt@nowhere.qqq>
To: "Saurer Stein" saurer@stein.ppp>
Subject: Hello, how are you
Date: Sun, 5 Dec 2004 15:36:34 +0400
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SOME_RANDOM_BOUNDARY"

This is a multi-part message in MIME format.
--SOME_RANDOM_BOUNDARY
Content-type: text/plain

Hello Saurer

How are you? 

Cheers,
Beleidigte Leberwurst
--SOME_RANDOM_BOUNDARY
Content-type: application/octet-stream
Content-transfer-encoding: base64

VGhpcyBtZXNzYWdlIGlzIGdvaW5nIHRvIGJlIGVuY29kZWQgaW4gYmFzZSA2NA==
--SOME_RANDOM_BOUNDARY--
END_2822

my $email_mime = new Email::MIME($rfc_2822);

foreach my $header_item (qw(Subject From To Date)) {
  printf "%-8s: %-30s\n", $header_item, $email_mime->header($header_item);
}

my @parts = $email_mime->parts();

foreach my $part (@parts) {
  print "\n-----------------------\n";
  print $part->body();
}

print "\n";
