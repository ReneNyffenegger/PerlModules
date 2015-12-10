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

$mech->get_local('highlight_link.html');

my @sel = $mech -> selector('p.bar');

# print "selector " . join(' - ', @sel) ."\n";

$mech -> highlight_node(@sel);


# sleep 5;
# $mech->highlight_node(
#     $mech->selector('a.download'));
# 
# print $_->{href}, " - ", $_->{innerHTML}, "\n"
#     for $mech->selector('a.download');
