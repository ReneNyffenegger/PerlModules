#
#   First, execute
#       perl -d:NYTProf script.pl
#   then 
#       nytprofhtml
#
#   Finally, open generated report
#       nytprof\index.html
#
#
use warnings;
use strict;

use Time::HiRes qw(time sleep);

my $c     = 0;
my $cnt   = 0;
my $start = time;

while (time - 1 < $start) {
  $cnt ++;

  unless  ($cnt % 11) {

     if (a()) {
        b();
     }

  }
}

print "cnt: $cnt $c\n";

sub a {

   my $t  = time;
   my $r  = rand;

   my $rt = $t * $r;

   my $s  = sprintf("%s", $rt);

   if ($s =~ /42/) {
     return 1;
   }

   return 0;

}

sub b {
  sleep 0.001;
}
