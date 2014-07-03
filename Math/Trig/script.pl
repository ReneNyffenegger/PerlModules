use warnings;
use strict;
use Math::Trig;
use utf8;


printf "pi: %10.9f\n", pi;


for (my $i=0;$i<=12; $i++) {

  printf "sin(%2i/6*pi) = % 5.3f        cos(%2i/6*pi) = % 5.3f\n", $i, sin($i/6*pi), $i, cos($i/6*pi);

}


atan_atan2_test(   0 / 16 * 2 * pi);
atan_atan2_test(   1 / 16 * 2 * pi);
atan_atan2_test(   2 / 16 * 2 * pi);
atan_atan2_test(   3 / 16 * 2 * pi);
atan_atan2_test(   4 / 16 * 2 * pi);
atan_atan2_test(   5 / 16 * 2 * pi);
atan_atan2_test(   6 / 16 * 2 * pi);
atan_atan2_test(   7 / 16 * 2 * pi);
atan_atan2_test(   8 / 16 * 2 * pi);
atan_atan2_test(   9 / 16 * 2 * pi);
atan_atan2_test(  10 / 16 * 2 * pi);
atan_atan2_test(  11 / 16 * 2 * pi);
atan_atan2_test(  12 / 16 * 2 * pi);
atan_atan2_test(  13 / 16 * 2 * pi);
atan_atan2_test(  14 / 16 * 2 * pi);
atan_atan2_test(  15 / 16 * 2 * pi);

print "------------------\n";

printf "asin(pi) = %7.6f  |  acos(0) = %7.6f  |  pi/2=%7.6f\n", asin(pi), acos(0), pi/2;


sub atan_atan2_test {

   my $rad = shift;

   my $y  = sin ($rad);
   my $x  = cos ($rad);

   my $atan  = atan ($y/$x);
   my $atan2 = atan2($y,$x);

   printf "rad = % 10.9f   atan = % 10.9f    atan2 = % 10.9f | % 10.9f\n", $rad, $atan, $atan2, $atan >= 0 ? $atan : $atan + 2 * pi;
   

}


