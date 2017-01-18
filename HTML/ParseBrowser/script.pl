#!/usr/bin/perl
use warnings;
use strict;

use HTML::ParseBrowser;

open (my $user_agent_strings_h, '<', '../../_additional_files_/User-Agent-Strings') or die;

while (my $agent = <$user_agent_strings_h>) {

  chomp $agent;

  my $parser = new HTML::ParseBrowser ($agent);

  my $version = $parser -> v        || '?';
  my $os      = $parser -> os       || '?';
  my $lang    = $parser -> language || '?';

  printf "%-20s %-20s %-20s %-10s %s\n", $parser->name, $version, $os, $lang, substr($agent, 0, 140);

}
close $user_agent_strings_h;
