#!/usr/bin/perl
use warnings;
use strict;

use Net::Async::HTTP;

use File::Find;
use File::Spec;

use LWP::UserAgent;
use Time::HiRes qw(time);


my @urls = gather_urls();

my $t_start_download = time;

my $http = Net::Async::HTTP->new();
my $loop = IO::Async::Loop->new();

$loop->add($http);
 
my $future = fmap_void {

  my $url = shift;

  $url or die;   # dies here, $url is empty!

   $http->GET($url)
        ->on_done( sub {
           my $response = shift;
           printf(" %6.3f %-60s %s\n", time - $t_start_download, $url, $response->status_line);
        } )
        ->on_fail( sub {
           my $failure = shift;
           print ref($failure), "\n";
           printf(" %6.3f %-60s failed\n", time - $t_start_download, $url);
        } );
} foreach => \@urls;
 
$loop->await($future);


sub gather_urls {

  my @urls = ();

  find(sub {
  
      if (-d $_ and $_ eq '.git') {
        $File::Find::prune = 1;
        return;
      }
  
      if (-f $_) {
        my $path =  File::Spec->abs2rel($File::Find::name, $File::Find::topdir);
        $path =~ s!\\!/!g; # Windows ...
        push @urls, "https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/$path";
      }
    },
    '../../..'
  );

  return @urls;

}

