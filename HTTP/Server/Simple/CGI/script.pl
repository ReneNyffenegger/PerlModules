use warnings; use strict;

use HTTP::Server::Simple::CGI;

{ package WebServer; use base 'HTTP::Server::Simple::CGI';

my $nl = "\x0d\x0a";

sub handle_request { # {{{

    my $self = shift;
    my $cgi  = shift;

    print "HTTP/1.0 200 OK$nl";
    print "Content-Type: text/html; charset=utf-8$nl$nl";

    print "<h1>Hällö Wörld</h1>";

    print "<code>\$cgi-&gt;path_info: </code> " . $cgi->path_info;

} # }}}

}

my $pid = WebServer -> new(8080) -> background;
