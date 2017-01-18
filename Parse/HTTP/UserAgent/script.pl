#!/usr/bin/perl
use warnings;
use strict;

use Parse::HTTP::UserAgent;

open (my $user_agent_strings_h, '<', '../../../_additional_files_/User-Agent-Strings') or die
my %seen;
while (my $agent = <$user_agent_strings_h>) {
  chomp $agent;

  eval {
    my $parser = new Parse::HTTP::UserAgent($agent);

    if (!$seen{$parser->name}{$parser->os}++) {
      printf "%-30s %-50s $agent\n", $parser->name, $parser->os;
    }

  };
  if ($@) {
    print "$.: $agent -> $@\n";
  }


}
close $user_agent_strings_h;
