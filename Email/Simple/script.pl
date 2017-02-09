#!/usr/bin/perl
use warnings;
use strict;

use Email::Simple;

my $rfc_2822 = <<'END_2822';
From: John Doe <jdoe@machine.example>
To: Mary Smith <mary@example.net>
Subject: Saying Hello
Date: Fri, 21 Nov 1997 09:55:06 -0600
Message-ID: <1234@local.machine.example>

This is a message just to say hello.
So, "Hello".
END_2822

my $mail = Email::Simple->new($rfc_2822);

foreach my $header_item (qw(Subject From To Date)) {
  printf "%-8s: %-30s\n", $header_item, $mail->header($header_item);
}
print "\n";
print $mail->body;
