#
#   http://stackoverflow.com/a/30473177/180275
#
use warnings;
use strict;

use Config::IniFiles;

my $ini = Config::IniFiles->new( -file => "stackoverflow_30472923.ini" );

# print $ini->val("RemotePhoneBook0", "path");

$ini -> setval('RemotePhoneBook0', 'path', '/somePath/to/someDir');
$ini -> setval('RemotePhoneBook0', 'URL' ,  'someUrl'            );
$ini -> setval('RemotePhoneBook0', 'Name',  'someName'           );

$ini -> WriteConfig("stackoverflow_30472923.modified.ini");
