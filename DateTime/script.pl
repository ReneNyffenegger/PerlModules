use warnings;
use strict;

use DateTime;


my $date_1 = new DateTime (year => 2014, month => 7, day => 5);
my $date_2 = new DateTime (year => 2014, month => 7, day =>15);

#  Calculate Δ
#    delta_tays() returns a DateTime::Duration object
printf "date_2 (%s) is %d days away from date_1 (%s)\n", $date_2 -> dmy, $date_1->delta_days($date_2)->delta_days, $date_1 -> dmy;
