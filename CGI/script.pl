use warnings; use strict;

#
#   Demonstrate the CGI class «via» HTTP::Server::Simple::CGI
#
#   run the script and point the browser to http://localhost:8080
#

use HTTP::Server::Simple::CGI;

{ package ASimpleWebserver; use base 'HTTP::Server::Simple::CGI';


my $nl = "\x0d\x0a";




sub handle_request {

    my $self = shift;
    my $cgi  = shift;

    print "HTTP/1.0 200 OK$nl";
    print "Content-Type: text/html; charset=utf-8$nl$nl";

    print "<h1>Hällö Wörld</h1>";


    print "<table>";

    printf "<tr><td>accept     </td><td>%s</td></tr>",(join "<br>", $cgi->Accept    )     ;
    printf "<tr><td>raw cookie </td><td>%s</td></tr>",              defined $cgi->raw_cookie      ? $cgi->raw_cookie      : '';
    printf "<tr><td>user agent </td><td>%s</td></tr>",              defined $cgi->user_agent      ? $cgi->user_agent      : '';
    printf "<tr><td>path       </td><td>%s</td></tr>",              defined $cgi->path_info       ? $cgi->path_info       : '';
    printf "<tr><td>path trans </td><td>%s</td></tr>",              defined $cgi->path_translated ? $cgi->path_translated : '';
    printf "<tr><td>remote host</td><td>%s</td></tr>",              defined $cgi->remote_host     ? $cgi->remote_host     : '';
    printf "<tr><td>remote addr</td><td>%s</td></tr>",              defined $cgi->remote_addr     ? $cgi->remote_addr     : '';
    printf "<tr><td>script     </td><td>%s</td></tr>",              defined $cgi->script_name     ? $cgi->script_name     : '';
    printf "<tr><td>refererrer </td><td>%s</td></tr>",              defined $cgi->referer         ? $cgi->referer         : '';
    printf "<tr><td>auth       </td><td>%s</td></tr>",              defined $cgi->auth_type       ? $cgi->auth_type       : '';
    printf "<tr><td>server     </td><td>%s</td></tr>",              defined $cgi->server_name     ? $cgi->server_name     : '';
    printf "<tr><td>host (virt)</td><td>%s</td></tr>",              defined $cgi->virtual_host    ? $cgi->virtual_host    : '';
    printf "<tr><td>port (srv) </td><td>%s</td></tr>",              defined $cgi->server_port     ? $cgi->server_port     : '';
    printf "<tr><td>port (virt)</td><td>%s</td></tr>",              defined $cgi->virtual_port    ? $cgi->virtual_port    : '';
    printf "<tr><td>software   </td><td>%s</td></tr>",              defined $cgi->server_software ? $cgi->server_software : '';
    printf "<tr><td>user       </td><td>%s</td></tr>",              defined $cgi->remote_user     ? $cgi->remote_user     : '';
    printf "<tr><td>user name  </td><td>%s</td></tr>",              defined $cgi->user_name       ? $cgi->user_name       : ''; # Only for older browsers
    printf "<tr><td>method     </td><td>%s</td></tr>",              defined $cgi->request_method  ? $cgi->request_method  : '';
    printf "<tr><td>content typ</td><td>%s</td></tr>",              defined $cgi->content_type    ? $cgi->content_type    : '';
    printf "<tr><td>http       </td><td>%s</td></tr>",(join "<br>", $cgi->http    )       ;
    printf "<tr><td>https      </td><td>%s</td></tr>",(join "<br>", $cgi->https   )       ;

    print "</table>";

}


}

my $pid = ASimpleWebserver->new(8080)->background;
