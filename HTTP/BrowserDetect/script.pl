#!/usr/bin/perl
use warnings;
use strict;

use HTTP::BrowserDetect;

open (my $user_agent_strings_h, '<', '../../_additional_files_/User-Agent-Strings') or die;

my %examples;
my %examples_val;

while (my $agent = <$user_agent_strings_h>) {

  chomp $agent;

  my $parser = new HTTP::BrowserDetect ($agent);


  if (my $val = $parser -> browser) {
    add_to_examples_val('Browser', $agent, $val);
  }
# if (my $val = $parser -> browser_string) {
#   add_to_examples_val('Browser string', $agent, $val);
# }
  if (my $val = $parser -> browser_version) {
    add_to_examples_val('Browser version', $agent, $val);
  }
  if (my $val = $parser -> browser_major) {
    add_to_examples_val('Browser major', $agent, $val);
  }
  if (my $val = $parser -> browser_minor) {
    add_to_examples_val('Browser minor', $agent, $val);
  }
  if (my $val = $parser -> browser_beta) {
    add_to_examples_val('Browser beta', $agent, $val);
  }
  if (my $val = $parser -> os) {
    add_to_examples_val('OS', $agent, $val);
  }
  if (my $val = $parser -> device) {
    add_to_examples_val('Device', $agent, $val);
  }
# if (my $val = $parser -> device_string) {
#   add_to_examples_val('Device String', $agent, $val);
# }
  if (my $val = $parser -> robot) {
    add_to_examples_val('Robot', $agent, $val);
  }

  if ($parser -> mobile) {
    add_to_examples('Mobile', $agent);
  }
  else {
    add_to_examples('Non-Mobile', $agent);
  }

  if ($parser -> tablet) {
    add_to_examples('Tablet', $agent);
  }
  else {
    add_to_examples('Non-Tablet', $agent);
  }

  if ($parser -> lib) {
    add_to_examples('Library', $agent);
  }
  else {
    add_to_examples('Non-Library', $agent);
  }
}

close $user_agent_strings_h;

for my $example_name (keys %examples) {
  print "\n\n$example_name\n    ";
  print join "\n    ", @{$examples{$example_name}};
}

for my $example_name (keys %examples_val) {
  print "\n\n$example_name\n    ";

  print join "\n    ",  (map { sprintf("%-20s: %s", $_, $examples_val{$example_name}{$_}) }  keys %{$examples_val{$example_name}});
}

sub add_to_examples_val {
  my $name  = shift;
  my $agent = shift;
  my $val   = shift;

  $examples_val{$name} = {} unless exists $examples_val{$name};

  return if exists $examples_val{$name}{$val};

  return if keys %{$examples_val{$name}} >= 6;

  $examples_val{$name}{$val} = $agent;
}

sub add_to_examples {
  my $name  = shift;
  my $agent = shift;

  $examples{$name} = [] unless exists $examples{$name};

  if (@{$examples{$name}} <= 3) {
    push @{$examples{$name}}, $agent;
  }
}
