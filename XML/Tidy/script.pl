use warnings;
use strict;

use XML::Tidy;

use File::Copy;

copy('messy.xml', 'messy.copy.xml');

 
my $xml_tidy = new XML::Tidy (filename => 'messy.copy.xml');
$xml_tidy -> tidy();
$xml_tidy -> write();
