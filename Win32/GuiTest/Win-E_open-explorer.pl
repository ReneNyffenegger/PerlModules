#
#  http://stackoverflow.com/questions/34247984/win32guitest-simulate-windowse-to-start-explorer
#

use warnings;
use strict;

use Win32::GuiTest ':ALL';

# Open Windows Explorer {

SendRawKey(VK_LWIN , 0);
SendRawKey(ord('E'), 0);

SendRawKey(ord('E'), KEYEVENTF_KEYUP);
SendRawKey(VK_LWIN , KEYEVENTF_KEYUP);

# }

# Go To c:\temp {

sleep 1;

SendKeys('{F4}'          ); # Address bar
SendKeys('+{HOME}'       ); # Shift Home: select entire text in address bar
SendKeys('{DEL}'         ); # delete it
SendKeys('c:\temp{ENTER}'); # enter desired path


# }
