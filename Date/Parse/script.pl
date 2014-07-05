use warnings;
use strict;

use Date::Parse;
use Time::localtime;


parse_('Thu Jan  1 02:00:00 1970'            );
parse_('Mon May 19 02:00:00 1997'            );

parse_('1970-01-01'                          );
parse_('1995:01:24T09:08:17.1823213'         ); #  ISO-8601  (?)

parse_('1995-01-24T09:08:17.1823213'         );
parse_('Wed, 16 Jun 94 07:29:35 CST'         ); #  Comma and day name are optional
parse_('Thu, 13 Oct 94 10:13:13 -0700'       );
parse_('Wed, 9 Nov 1994 09:50:32 -0500 (EST)'); #  Text in ()'s will be ignored.

parse_('21 dec 17:05'                        ); #  Will be parsed in the current time zone
parse_('21-dec 17:05'                        );
parse_('21/dec 17:05'                        );
parse_('21/dec/93 17:05'                     );
parse_('1999 10:02:18 "GMT"'                 );
parse_('16 Nov 94 22:28:20 PST'              );

sub parse_ { # {{{

    my $date_string   = shift;

    my $time          = Date::Parse::str2time ($date_string);
    my $date_string_2 = Time::localtime::ctime($time       );

    printf  ("In: %-40s   Out: %-30s\n", $date_string, $date_string_2);
    
} # }}}
