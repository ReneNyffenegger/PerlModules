#!/usr/bin/perl
use warnings;
use strict;

use HTTP::MobileAgent;

open (my $user_agent_strings_h, '<', '../../_additional_files_/UserAgentStrings') or die;

my %examples;
my %examples_val;

while (my $agent = <$user_agent_strings_h>) {

  chomp $agent;

  my $parser = HTTP::MobileAgent->new($agent);

  if ($parser -> gps_compliant) {
    add_to_examples('gps compliant', $agent);
  }

  if (my $val = $parser -> name) {
    add_to_examples_val('name', $agent, $val);
  }
  if (my $val = $parser -> carrier) {
    add_to_examples_val('carrier', $agent, $val);
  }
  if (my $val = $parser -> carrier_longname) {
    add_to_examples_val('carrier (long)', $agent, $val);
  }
  if (my $val = $parser -> display) {
    add_to_examples_val('display', $agent, $val);
  }
  if (my $val = $parser -> user_id) {
    add_to_examples_val('user id', $agent, $val);
  }
}

close $user_agent_strings_h;

for my $example_name (keys %examples) {
  print "\n\n$example_name\n    ";
  print join "\n    ", @{$examples{$example_name}};
}

for my $example_name (keys %examples_val) {
  print "\n\n$example_name\n    ";
  print join "\n    ",  (map { sprintf("%-20s: %s", @{$_}) }  @{$examples_val{$example_name}});
}

sub add_to_examples_val {
  my $name  = shift;
  my $agent = shift;
  my $val   = shift;

  $examples_val{$name} = [] unless exists $examples_val{$name};

  if (@{$examples_val{$name}} <= 3) {
    push @{$examples_val{$name}}, [$val, $agent];
  }

}

sub add_to_examples {
  my $name  = shift;
  my $agent = shift;

  $examples{$name} = [] unless exists $examples{$name};

  if (@{$examples{$name}} <= 3) {
    push @{$examples{$name}}, $agent;
  }
}

