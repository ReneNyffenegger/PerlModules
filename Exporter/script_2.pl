use warnings;
use strict;

use feature 'say';

use SomeModule qw(ok_one ok_two);

# say exp_one(); # Undefined subroutine &main::exp_one called at C:\github\PerlModules\Exporter\script_2.pl

say ok_one();
say ok_two();
