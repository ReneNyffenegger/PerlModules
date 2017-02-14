use warnings;
use strict;
use Win32::Process::List;

my $procs = Win32::Process::List->new;

my $some_proc_name = 'explorer.exe';

printf ("There are %d processes:\n", $procs->GetNProcesses());

my %proc_list = $procs->GetProcesses();
foreach my $key ( keys %proc_list ) {
   print sprintf("%-30s  %5d\n", $proc_list{$key}, $key);
}

# printf ("%s has PID %s.\n", $some_proc_name, $procs->GetProcessPid($some_proc_name));
