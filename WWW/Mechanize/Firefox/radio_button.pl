use warnings;
use strict;

use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new(
  create    => 1,   # Create new tab...
  activate  => 1,   # ... and activate it.
  autoclose => 0,   # Keep tab open after perl script end.
# --------------------------------------------------------
# Name of the program if unable to connect on first try:
  launch   =>'C:\Program Files\Mozilla Firefox\firefox.exe',
);

$mech->get_local('radio_button.html');

# $mech->field('group_1', 'bar'); # Does not seem to work

$mech->click({xpath=>'/html/body/form/table/tbody/tr[1]/td[3]/input', synchronize=>0});
$mech->click({id=>'three', synchronize=>0});

$mech->field('text_1' , 'Changed to Bar'  );
$mech->field('text_2' , 'Changed to Three');
