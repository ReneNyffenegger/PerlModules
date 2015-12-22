use warnings;
use strict;
use WWW::Mechanize::Firefox;

my $mech = new WWW::Mechanize::Firefox (
  launch   =>'C:\Program Files\Mozilla Firefox\firefox.exe',
);

$mech->get_local('xpath.html');

my $xpath_1 = '/html/body/div[3]/div[2]';

my $a = $mech->xpath("$xpath_1", single=>1);
print $a->{innerHTML}, "\n";

my $b = $mech->xpath("$xpath_1/text()", single=>1);
print $b->{nodeValue}, "\n";

