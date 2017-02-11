use warnings; use strict;
use Geo::Coordinates::Transform;


my $g = Geo::Coordinates::Transform->new();


printf "%s\n", @{$g->cnv_to_dms([ 20.5     ])}[0];   # 20 30 0.00000
printf "%s\n", @{$g->cnv_to_ddm([ 20.5     ])}[0];   # 20 30.00000
printf "%s\n", @{$g->cnv_to_dd (["20 30 0" ])}[0];   # 20.5000000
printf "%s\n", @{$g->cnv_to_dd (["20 30 12"])}[0];   # 20.5033333

