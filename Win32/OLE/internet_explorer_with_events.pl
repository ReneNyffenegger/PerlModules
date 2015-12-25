use warnings;
use strict;
use Const::Fast;
use Win32::OLE qw(EVENTS);
use feature 'say';

const my $READYSTATE_COMPLETE => 4;

my $ie = Win32::OLE->new("InternetExplorer.Application", sub { $_[0]->Quit });

Win32::OLE->WithEvents($ie, \&IE_Event, 'DWebBrowserEvents2');

$ie->{Visible} = 1;
$ie->Navigate2('http://renenyffenegger.ch');
Win32::OLE->MessageLoop;
Win32::OLE->SpinMessageLoop;
$ie->Quit;

sleep 3;



sub IE_Event {
  my ($browser, $event, @argv) = @_;
  say $event;
}
