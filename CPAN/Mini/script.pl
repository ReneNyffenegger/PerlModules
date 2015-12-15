use warnings;
use strict;

use CPAN::Mini;

CPAN::Mini->update_mirror(
  remote    => "http://mirror.switch.ch/ftp/mirror/CPAN/",
  local     => "./cpan-mirror",
  log_level => 'debug',
);
