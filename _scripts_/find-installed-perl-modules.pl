#!/usr/bin/perl
use warnings;
use strict;
use File::Find;
use File::Spec;

if ($ENV{SCRIPT_NAME}) { # Cheap and dirty way to determine if running as cgi script
  print "Status: 200 OK\r\n";
  print "Content-type: text/plain\r\n";
  print "\r\n";
}

for my $inc (@INC) {
  print "$inc\n";
  find({
    preprocess => sub {
      sort @_;
    },
    wanted => sub {
      return unless -f;

      if ($File::Find::name =~ /(.*)\.pm$/) {
        my $module = File::Spec->abs2rel($1, $inc);
        $module =~ s![/\\]!::!g;

        print "  $module\n";
      }

    }
  }, $inc);
}
