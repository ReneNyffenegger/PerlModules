use warnings; use strict;

use HTTP::Server::Simple::CGI;

{ package WebServer; use base 'HTTP::Server::Simple::CGI';

use File::Slurp; # import read_file

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

    my $path = $cgi -> path_info;

#   print STDERR "$path\n";

    if ($path eq '/') {
      serve_file ("index.html", 'text/html');
      return;
    }


  #  See http://de.selfhtml.org/diverses/mimetypen.htm for Mime Types.

    if ($path =~ /\.htm$/  or $path =~ /\.html$/) {
      serve_file (".$path", 'text/html');
      return;
    }
    if ($path =~ /\.js$/ ) {
      serve_file (".$path", 'application/javascript');
      return;
    }
    if ($path =~ /\.txt$/) {
      serve_file (".$path", 'text/plain');
      return;
    }
    if ($path =~ /\.js$/ ) {
      serve_file (".$path", 'application/javascript');
      return;
    }
    if ($path =~ /\.png$/) {
      serve_file (".$path", 'image/png');
      return;
    }
    if ($path =~ /\.ico$/) {
      serve_file (".$path", 'image/x-icon');
      return;
    }

    print STDERR "Unknown Mime type for $path\n";

    serve_file( ".$path", 'text/plain');

} # }}}


}

# Use Port 8080 (http://localhost:8080)
my $pid = WebServer -> new(8080) -> background;

