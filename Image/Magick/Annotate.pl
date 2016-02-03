use warnings;
use strict;

use Image::Magick;

my $image = new Image::Magick;

$image->Set( size => '500x500' );

$image->ReadImage( 'xc:none' );

$image->Annotate(
    text      => "Here's some text!\nAnd another line",
    font      => 'c:/windows/fonts/courbd.ttf',
    x         =>  100,
    y         =>  200,
#   gravity   => 'North',
#   fill      => '#f70',
    fill      => 'orange',
    pointsize => '40',
#   stretch   => 10,
#   style     => 'Oblique',
#   weight    => 0
 );

# $image->Trim();

$image->Write( 'Annotated.png' )
