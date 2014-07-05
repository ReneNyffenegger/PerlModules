use warnings;
use strict;

use DateTime::Format::Strptime;

my $format = new DateTime::Format::Strptime (
               pattern => '%F'   #  %Y-%m-%d
             );


my $date = $format -> parse_datetime ('2014-06-18');

#  $date is a DateTime object:
print ref $date, "\n";
