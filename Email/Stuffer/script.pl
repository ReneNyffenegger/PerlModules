use warnings;
use strict;

use Email::Stuffer;
use Email::Sender::Transport::SMTP;

my $sender_mail_address    = shift;
my $smtp_server            = shift;
my $recipient_mail_address = shift;
my $subject                = shift;
my $filename               = shift;
my $auth_passwd            = shift;

Email::Stuffer ->
  from       ( $sender_mail_address     ) -> 
  to         ( $recipient_mail_address  ) ->
  subject    ( $subject                 ) ->
# bcc        ( $blind_copy              ) ->
  text_body  ("Hi\n\nAttached is a file") ->
  attach_file( $filename                ) ->
  transport  ( Email::Sender::Transport::SMTP -> new ({
                 host             => $smtp_server,
               # port             =>  25,
                 sasl_username    => $sender_mail_address, # ?
                 sasl_password    => $auth_passwd })
             )
->send or die "sending of mail failed $!";
