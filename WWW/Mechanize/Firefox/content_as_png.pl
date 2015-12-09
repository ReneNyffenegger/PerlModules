use warnings;
use strict;

use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new(
  create    => 1,
  activate  => 1,
  autoclose => 0,
  launch    =>'C:\Program Files\Mozilla Firefox\firefox.exe',
);

$mech->get_local('content_as_png.html');

# my $png_1 = $mech->content_as_png(undef,undef,
#     {
#         width  => 2000,
#         height => 2000,
#         scalex => 1,
#         scaley => 1
#     }
# );

write_png ('', 
  $mech->content_as_png(undef,undef, {
    }
   )
);

write_png ('cropped', 
  $mech->content_as_png(undef, {
        left   => 1000,
        top    => 1000,
    },
    {
        width  =>  500,
        height =>  500,
        scalex =>    1,
        scaley =>    1
    }
   )
);

write_png ('scaled', 
  $mech->content_as_png(undef,undef, {
        scalex =>   0.25,
        scaley =>   0.25
    }
   )
);

sub write_png {

  my $suf = shift;
  my $png = shift;

  open my $out, '>', "content_as_png_$suf.png" or die $!;
  binmode $out;
  print $out $png;

}
