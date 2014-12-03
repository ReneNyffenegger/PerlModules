use warnings;
use strict;

use feature 'say';

use SomeModule (':some');

# say exp_one(); # Undefined subroutine &main::exp_one called at C:\github\PerlModules\Exporter\script_4.pl

say ok_one();
say exp_two();
