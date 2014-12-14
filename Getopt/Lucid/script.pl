#
#   ./script.pl --opt_A foo --opt_C X --opt_D Y --OPT_F fff --help
#
use warnings;
use strict;
use feature 'say';
use Config::Std;
use File::Basename;

use Getopt::Lucid qw(:all);


my $opt = Getopt::Lucid->getopt([

  Param ( 'opt_A' ),
  Param ( 'opt_B' ) -> default  ('val_B'  ),
  Param ( 'opt_C' ) -> needs    ('opt_D'  ),   # dependencies
  Param ( 'opt_D' ),
  Param ( 'opt_E' ) -> valid    (qr/^\d+$/),   # must be number
  Param ( 'opt_F' ) -> anycase,                # case insensitiv
  Switch( 'help'  )

]);

read_config(dirname($0) . '/script_config.ini' => my %cfg);
$opt->merge_defaults ($cfg{''});

$opt->validate( { 'requires' => ['opt_A'] } );

say $opt->get_opt_A;
say $opt->get_opt_B;
say $opt->get_opt_C;
say $opt->get_opt_D;
say $opt->get_opt_E;
say $opt->get_opt_F;
say $opt->get_help;

