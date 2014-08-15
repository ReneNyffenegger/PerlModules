use warnings; use strict;

use HTTP::Server::Simple::CGI;

{ package WebServer; use base 'HTTP::Server::Simple::CGI';
  use File::Slurp;

my $nl = "\x0d\x0a";

sub print_header { # {{{

    my $content_type = shift;

    print "HTTP/1.0 200 OK$nl";
    print "Content-Type: $content_type; charset=utf-8$nl$nl";

} # }}}

sub serve_file { # {{{

    my $path_relative = shift;
    my $content_type  = shift;

    print_header($content_type);

    print read_file($path_relative, binmode => ":raw");

} # }}}

sub handle_request { # {{{

    my $self = shift;
    my $cgi  = shift;

    if ($cgi->path_info eq '/') {
       serve_file('test-concurrency.html', 'text/html');
       return;
    }

    my ($seconds_to_sleep) = $cgi->path_info =~ m|/sleep_(\d+)$|;

    print STDERR "Going to sleep for $seconds_to_sleep second(s)\n";
    sleep $seconds_to_sleep;
    print STDERR "Woke up from $seconds_to_sleep sleep\n";

    print "HTTP/1.0 200 OK$nl";
    print "Content-Type: text/html; charset=utf-8$nl$nl";

    print "{\"seconds_slept\": $seconds_to_sleep}";

} # }}}

}

my $pid = WebServer -> new(8080) -> background;
