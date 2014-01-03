use warnings; use strict;
use Geo::Coordinates::Transform;


my $g = new Geo::Coordinates::Transform();


print  "\n\n";

print  ${$g->cnv_to_dms([ '0.0000999' ])}[0];   # 0 0 0.35964
print  "\n";
print  ${$g->cnv_to_dms([ '0.0001000' ])}[0];   # 0 0 0.36000

print  "\n\n";

print  ${$g->cnv_to_dms([  0.0000999  ])}[0];   # NaN         (and Illegal char in 9.99e-005 at .../site/lib/Geo/Coordinates/Transform.pm line 71.)
print  "\n";
print  ${$g->cnv_to_dms([  0.0001000  ])}[0];   # 0 0 0.36000


print  "\n\n";
