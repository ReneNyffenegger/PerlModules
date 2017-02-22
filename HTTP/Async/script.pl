#!/usr/bin/perl
use warnings;
use strict;

use HTTP::Async;

use File::Find;
use File::Spec;

use LWP::UserAgent;
use Time::HiRes qw(time);

my @files = gather_files();

my $with_HTTP_ASYNC = 1;


if ($with_HTTP_ASYNC) {

  my $http_async = HTTP::Async->new;
  my %id_2_file;

  my $t_start_download = time;

  while (@files) {

    my ($http_response, $id) = $http_async->next_response;

    if ($http_response) {
       my $t_end_get = time;

       printf(" %6.3f %2d [%2d/%2d] resp %-55s %-15s %6.3f\n",
         $t_end_get - $t_start_download,
         $http_async->in_progress_count, $http_async->to_send_count, $http_async->to_return_count,
         $id_2_file{$id}{file},
         $http_response->status_line,
         $t_end_get - $id_2_file{$id}{t_submit}
       );

    }
    else {

       my $file = shift @files;

       printf(" %6.3f %2d [%2d/%2d] subm: %-55s\n",
         time - $t_start_download,
         $http_async->in_progress_count, $http_async->to_send_count, $http_async->to_return_count,
         $file
       );

       my $t_submit = time;
       my $id = $http_async->add(HTTP::Request->new(GET => "https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/$file"));

       $id_2_file{$id}{file    } = $file;
       $id_2_file{$id}{t_submit} = $t_submit;

       printf(" %6.3f %2d [%2d/%2d] done\n",
         time - $t_start_download,
         $http_async->in_progress_count, $http_async->to_send_count, $http_async->to_return_count
       );

    }

  }
  print "No more files\n";
  while (my ($http_response, $id) = $http_async->wait_for_next_response) {

     my $t_end_get = time;

     printf(" %6.3f %2d [%2d/%2d] resp %-55s %-15s %6.3f\n",
       $t_end_get - $t_start_download,
       $http_async->in_progress_count, $http_async->to_send_count, $http_async->to_return_count,
       $id_2_file{$id}{file},
       $http_response->status_line,
       $t_end_get - $id_2_file{$id}{t_submit}
     );

  }


  
}
else {

  my $ua = LWP::UserAgent->new();

  my $t_start_download = time;

  for my $file (@files) {

  
    my $t_start_get = time;
    my $http_response = $ua -> get("https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/$file");
    my $t_end_get   = time;
  
    printf (" %-55s %-15s %6.3f %6.3f\n", $file, $http_response->status_line, $t_end_get - $t_start_download, $t_end_get - $t_start_get);

  }
}


sub gather_files {

  my @files = ();

  find(sub {
  
      if (-d $_ and $_ eq '.git') {
        $File::Find::prune = 1;
        return;
      }
  
      if (-f $_) {
        my $path =  File::Spec->abs2rel($File::Find::name, $File::Find::topdir);
        $path =~ s!\\!/!g; # Windows ...
        push @files, $path;
      }
    },
    '../..'
  );

  return @files;

}

