use warnings;
use strict;

use Time::localtime;
use Date::Calc;
use Date::Parse;

printf("\nNow, it is   %02d:%02d:%02d %2d.%02d.%4d  (%s)\n",
        localtime -> hour,
        localtime -> min,
        localtime -> sec,
        localtime -> mday,
        localtime -> mon   +    1,
        localtime -> year  + 1900,
        Date::Calc::Day_of_Week_to_Text(localtime->wday));


# ---- 

print "\n";

my  $zero_seconds___after_january_1st_1970 = ctime(0);
my  $one__second____after_january_1st_1970 = ctime(1);
my  $one__year______after_january_1st_1970 = ctime(365 * 24*60*60);
my  $january_10th_1970__03_hours__________ = ctime(  9 * 24*60*60  + 3 * 60 * 60);
my  $ten_10000_days_after_january_1st_1970 = ctime(10000 * 24*60*60);

printf  (  ("%s\n" x 5),                        # Note the time zone influence !
   #   -------------------------------------      ------------------------------
      $zero_seconds___after_january_1st_1970,   # Thu Jan  1 01:00:00 1970
      $one__second____after_january_1st_1970,   # Fri Jan  1 01:00:01 1971
      $one__year______after_january_1st_1970,   # Fri Jan  1 01:00:00 1971
      $january_10th_1970__03_hours__________,   # Sat Jan 10 02:12:00 1970
      $ten_10000_days_after_january_1st_1970    # Mon May 19 02:00:00 1997
);

#  Date::Parse can be used to convert these string representations back:

printf "\nUsing Date::Parse: %d\n", Date::Parse::str2time(  ctime( 1234567890 )  );  # prints 1234567890






