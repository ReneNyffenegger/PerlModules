#
#   This script sends a mail with an attachment.
#   Mutliple attachments can be sent by repeatedly
#   calling $msg -> attach()
#
#   NOTE that MIME::Lite is not recommended by
#   its current maintainer (7.7.2014).
#
use warnings;
use strict;

use MIME::Lite;

my $sender_mail_address    = shift;
my $smtp_server            = shift;
my $recipient_mail_address = shift;
my $subject                = shift;
my $filename               = shift;
my $auth_passwd            = shift;

MIME::Lite->send('smtp', $smtp_server, Timeout=>60, AuthUser => $sender_mail_address, AuthPass => $auth_passwd);

my $msg = MIME::Lite->new(
    From    => $sender_mail_address,
    To      => $recipient_mail_address,
    Subject => $subject,
    Data    =>"Attached is a file.",
    Type    =>"multipart/mixed",
);

$msg->attach('Type'     => 'application/octet-stream',
             'Encoding' => 'base64',
              Path      => $filename
          );

$msg->send();

