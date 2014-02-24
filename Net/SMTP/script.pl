use warnings;
use strict;

use Net::SMTP;

my $to_email_addr      = shift; # 'rene.nyffenegger@adp-gmbh.ch';
my $from_email_addr    = shift; # 'no.replay@bla.ch';
my $mailserver         = shift; # 'mail.adp-gmbh.ch';

my $smtp = Net::SMTP->new($mailserver, Timeout => 2, hello=>$mailserver) or die;

$smtp->mail($from_email_addr);

$smtp->recipient($to_email_addr);

$smtp->data ();

$smtp->datasend("From: $from_email_addr\n");
$smtp->datasend("Subject: Test\n");
$smtp->datasend("To: $to_email_addr\n");

$smtp->datasend("\n");

$smtp->datasend("first line\nsecond line\n");

$smtp->dataend();

$smtp->quit();



