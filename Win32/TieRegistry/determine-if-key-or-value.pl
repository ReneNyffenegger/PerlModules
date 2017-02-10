#!/usr/bin/perl
use warnings;
use strict;
use Win32::TieRegistry(Delimiter => '/');

determine('HKEY_CURRENT_USER/Environment');
determine('HKEY_CURRENT_USER/Environment/PATH');
determine('HKEY_CURRENT_USER/Environment/does-not-exist');

sub determine {
  my $path = shift;

  if (my $key_ = $Registry->Open($path)) {
     print "$path is a key\n";
     return;
  }

  if (exists $Registry->{$path}) {
     printf "$path is a value: %s\n", substr($Registry->{$path}, 0, 50);
     return
  }

  print "$path is neither\n";
}
