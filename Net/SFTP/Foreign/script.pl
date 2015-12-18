use warnings;
use strict;

use Net::SFTP::Foreign;

my $host     = shift;
my $username = shift;
my $password = shift;
my $path     = shift;

my $sftp = Net::SFTP::Foreign->new(
    host     =>  $host,
    user     =>  $username,
    password =>  $password,
#   ssh_cmd  => "$ENV{USERPROFILE}/tools/WinSCP.com"
    ssh_cmd  => 'plink'
);

$sftp->die_on_error("Unable to establish SFTP connection");

$sftp->setcwd($path, 
    check => 0  # Is this needed because I am connecting to a Windows server?
) or die "unable to change cwd: " . $sftp->error;

my $ls =  $sftp->ls; # ($path);

for my $e (@$ls) {
  printf "%-30s | %-90s | %-6s\n",
    $e->{filename},
    $e->{longname},
    $e->{a}->size || 'n/a'
   ;
}

# $sftp->get("foo", "bar") or die "get failed: " . $sftp->error;

# $sftp->put("bar", "baz") or die "put failed: " . $sftp->error;
