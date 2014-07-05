use warnings; use strict;

use Sys::Info::OS;
use Time::localtime;

my $os_info = new Sys::Info::OS;

printf "OS name:    %s\n", $os_info -> name;
printf "OS version: %s\n", $os_info -> version;
printf "OS build:   %s\n", $os_info -> build;
printf "OS build:   %s\n", $os_info -> build;

print "\n";
printf "up since:   %s\n", Time::localtime::ctime($os_info -> uptime);
printf "up seconds: %d\n", $os_info -> tick_count;
printf "node name:  %s\n", $os_info -> node_name;
printf "domain:     %s\n", $os_info -> domain_name;
printf "login name: %s\n", $os_info -> login_name;

print "\n";
printf "IP:         %s\n", $os_info -> ip;

print "\n";
printf "bitness:    %d\n", $os_info -> bitness;

print "\n";
printf "is_windows: %d\n", $os_info -> is_windows;
printf "is_winnt:   %d\n", $os_info -> is_winnt;
printf "is_win95:   %d\n", $os_info -> is_win95;
printf "is_linux:   %d\n", $os_info -> is_linux;
printf "is_bsd:     %d\n", $os_info -> is_bsd;
printf "is_unknown: %d\n", $os_info -> is_unknown;


print "\n";
printf "is_root:    %d\n", $os_info -> is_root;

print "\n";
printf "cd_key:     %d\n", $os_info -> cdkey;
printf "locale:     %d\n", $os_info -> locale;

print "\n";
my %meta = $os_info->meta;
for my $key (keys %meta) {
  printf "%-28s %-s\n", $key, $meta{$key};
}

