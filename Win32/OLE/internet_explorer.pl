use warnings;
use strict;
use Win32::OLE;

use Const::Fast;

const my $READYSTATE_COMPLETE => 4;

my $ie = Win32::OLE->new("InternetExplorer.Application") or die;

$ie->Navigate('http://renenyffenegger.ch');
sleep 1 while $ie->{ReadyState} != $READYSTATE_COMPLETE;

$ie->{Visible} = 1;
