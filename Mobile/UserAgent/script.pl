#!/usr/bin/perl
use warnings;
use strict;

use Mobile::UserAgent;

open (my $user_agent_strings_h, '<', '../../_additional_files_/UserAgentStrings') or die;

my %examples;
my %examples_val;

while (my $agent = <$user_agent_strings_h>) {

  chomp $agent;

  my $parser = new Mobile::UserAgent ($agent);

  unless ($parser -> success) {
    add_to_examples('unsuccessful', $agent);
    next;
  }
  if ($parser -> isRubbish) {
    add_to_examples('rubbish', $agent);
    next;
  }
  if ($parser -> isSeries60) {
    add_to_examples('Symbian OS Series 60 handset', $agent);
  }
  if ($parser -> isMozilla) {
    add_to_examples('Mozilla compatible user agent string', $agent);
  }
  if ($parser -> isStandard) {
    add_to_examples('Standard vendor-model/version format', $agent);
  }
  if ($parser -> isImode) {
    add_to_examples('i mode handset', $agent);
  }
  if (my $val = $parser -> vendor) {
    add_to_examples_val('vendor', $agent, $val);
  }
  if (my $val = $parser -> model) {
    add_to_examples_val('model', $agent, $val);
  }
  if (my $val = $parser -> version) {
    add_to_examples_val('version', $agent, $val);
  }
  if (my $val = $parser -> screenDims) {
    add_to_examples_val('screen dimensions', $agent, $val);
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
