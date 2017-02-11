use warnings;
use strict;

use Image::Magick;
use File::Slurp;

my $image = Image::Magick->new;

$image->Set( size => '500x500' );

$image->ReadImage( 'xc:none' );

my $source_code=read_file(__FILE__);

$image->Annotate(
    text      =>  $source_code,
    font      => 'c:/windows/fonts/courbd.ttf',
    x         =>  20,
    y         =>  20,
#   gravity   => 'North',
    fill      => '#f70',
#   fill      => 'orange',
    pointsize => '13',
#   stretch   => 10,
#   style     => 'Oblique',
#   weight    => 0
 );

# $image->Trim();

$image->Write( 'Annotated.png' )
