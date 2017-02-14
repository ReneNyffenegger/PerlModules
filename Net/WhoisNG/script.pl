#!/usr/bin/perl
#
#   http://stackoverflow.com/a/11899899/180275
#
use warnings;
use strict;

use Net::WhoisNG;

my $addr = shift or die;

# my $whois = Net::WhoisNG->new($addr) or die;

$whois -> lookUp() or die;

print $whois->getExpirationDate, "\n";

foreach my $type (qw(admin tech registrant bill)) {

  if (my $contact=$whois->getPerson($type)) {

      print "$type\n";
      my $email = $contact->getEmail();

      if ($email and $email =~ /\S/) {
          print "$email\n";
      } else {
          my $unparsed = join(' ', @{$contact->getCredentials()});
        # Use an regexp to extract e-mail from freeform text here, you can even pick ready one somewhere here on SO
          print "$unparsed\n";
      }
      print "----\n\n";
  }

}
