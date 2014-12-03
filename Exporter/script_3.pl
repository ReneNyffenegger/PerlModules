use warnings;
use strict;

use feature 'say';

use SomeModule (':all');

say exp_one(); # Undefined subroutine &main::exp_one called at C:\github\PerlModules\Exporter\script_2.pl

say ok_one();
say ok_two();
