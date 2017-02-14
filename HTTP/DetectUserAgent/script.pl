#!/usr/bin/perl
use warnings;
use strict;

use HTTP::DetectUserAgent;

open (my $user_agent_strings_h, '<', '../../_additional_files_/UserAgentStrings') or die;

my %examples;
my %examples_val;

while (my $agent = <$user_agent_strings_h>) {

  chomp $agent;

  my $parser = HTTP::DetectUserAgent->new($agent);


  if (my $val = $parser -> type) {
    add_to_examples_val('Type', $agent, $val);
  }
  if (my $val = $parser -> name) {
    add_to_examples_val('Name', $agent, $val);
  }
  if (my $val = $parser -> version) {
    add_to_examples_val('Version', $agent, $val);
  }
  if (my $val = $parser -> vendor) {
    add_to_examples_val('Vendor', $agent, $val);
  }
  if (my $val = $parser -> os) {
    add_to_examples_val('OS', $agent, $val);
  }
}

close $user_agent_strings_h;

# for my $example_name (keys %examples) {
#   print "\n\n$example_name\n    ";
#   print join "\n    ", @{$examples{$example_name}};
# }

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


# if (@{$examples_val{$name}} <= 3) {
#   push @{$examples_val{$name}}, [$val, $agent];
# }

}

# sub add_to_examples {
#   my $name  = shift;
#   my $agent = shift;
#
#   $examples{$name} = [] unless exists $examples{$name};
#
#   if (@{$examples{$name}} <= 3) {
#     push @{$examples{$name}}, $agent;
#   }
# }

