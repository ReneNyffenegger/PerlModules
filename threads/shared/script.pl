use warnings;
use strict;

use threads;
use threads::shared;

my $foo = 1;
my $bar = 1;

share($bar);


my $t1 = threads->create(\&thr, 1);
my $t2 = threads->create(\&thr, 2);
my $t3 = threads->create(\&thr, 3);

$t1 -> join();
$t2 -> join();
$t3 -> join();



sub thr { # {{{

    my $init_wait = shift;

    sleep $init_wait;

    $foo ++;
    $bar ++;

    print "foo: $foo, bar: $bar\n";
    

} # }}}
