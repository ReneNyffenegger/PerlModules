#!/usr/bin/perl
use warnings;
use strict;

use Net::Curl::Easy  qw( :constants );
use Net::Curl::Multi qw( );

use File::Find;
use File::Spec;
use File::Slurp;
use Time::HiRes qw(time);


unlink for (grep {$_ !~ /\.gitignore$/} glob 'downloaded/*');

my $max_running = 20;
my @files = gather_files();


my $net_curl_multi = Net::Curl::Multi->new();
my $running = 0;

my $t_start_download = time;
while (1) { #_{

    while ( @files && $running < $max_running ) {

       my $file = shift @files;

       printf(" %7.3f  %2d  req: %s\n", time - $t_start_download, $running, $file);

       my $net_curl_easy = make_request("https://raw.githubusercontent.com/ReneNyffenegger/PerlModules/master/$file");

       $net_curl_multi->add_handle($net_curl_easy);
       ++$running;
    }

    last if !$running;

    my ($r, $w, $e) = $net_curl_multi->fdset();

    my $timeout = $net_curl_multi->timeout();

    select($r, $w, $e, $timeout / 1000) if $timeout > 0;

    $running = $net_curl_multi->perform();

    while ( my ( $msg, $easy, $result ) = $net_curl_multi->info_read() ) {
        $net_curl_multi->remove_handle( $easy );

        my $url    = $easy->{url};
        my $status = $easy->getinfo(CURLINFO_RESPONSE_CODE);

        $url =~ s|.*?master/||;

        printf(" %7.3f  %2d  got: %-60s %d\n", time - $t_start_download, $running, $url, $status);

        $url =~ s|/|__|g;

        write_file("downloaded/$url", $easy->{body});


    }

} #_}

sub make_request { #_{

    my $url = shift;

    my $net_curl_easy = Net::Curl::Easy->new();

    $net_curl_easy->{url} = $url;
    $net_curl_easy->setopt(CURLOPT_URL,         $url                  );
    $net_curl_easy->setopt(CURLOPT_HEADERDATA, \$net_curl_easy->{head});
    $net_curl_easy->setopt(CURLOPT_FILE,       \$net_curl_easy->{body});

    return $net_curl_easy;

} #_}

sub gather_files { #_{

  my @files = ();

  find(sub {
  
      if (-d $_ and $_ eq '.git') {
        $File::Find::prune = 1;
        return;
      }
  
      if (-f $_) {
        return if $_ =~ /\.gitignore$/;
        my $path =  File::Spec->abs2rel($File::Find::name, $File::Find::topdir);
        $path =~ s!\\!/!g; # Windows ...
        push @files, $path;
      }
    },
    '../../..'
  );

  return @files;

} #_}
