use warnings;
use strict;

use Time::localtime;
use Date::Calc;

printf("\n   %2d:%2d:%2d %2d.%02d.%4d (%s)\n",
        localtime -> hour,
        localtime -> min,
        localtime -> sec,
        localtime -> mday,
        localtime -> mon   +    1,
        localtime -> year  + 1900,
        Date::Calc::Day_of_Week_to_Text(localtime->wday));
