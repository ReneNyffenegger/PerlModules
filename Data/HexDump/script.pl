use warnings;
use strict;
use Data::HexDump;

seperate_(); # --------------------

my $buf = "foo\0bar";
print HexDump $buf;

seperate_(); # --------------------

my $f = Data::HexDump->new;
$f->data($buf);
print $f->dump;

seperate_(); # --------------------

open (my $fh, '<', $0);

my $f1 = Data::HexDump->new;
$f1->fh($fh);
$f1->block_size(1024);
print while $_ = $f1->dump;
close $fh;

seperate_(); # --------------------

my $f2 = Data::HexDump->new;
$f2->file($0);
$f2->block_size(1024);
print while $_ = $f2->dump;

seperate_(); # --------------------

sub seperate_ { # {{{

    print "\n", "=" x 77, "\n\n";

} # }}}

