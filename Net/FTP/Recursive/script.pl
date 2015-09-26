use warnings;
use strict;
use Net::FTP::Recursive;

if (@ARGV != 4) {
  die "I need host, username, password  remote dir";
}

my $ftp = new Net::FTP::Recursive(shift) or die;
$ftp -> login(shift, shift) or die;
$ftp -> cwd(shift);

# $ftp -> binary;

$ftp -> rget();
