package SomeModule;

use warnings;
use strict;

use Exporter;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

@ISA          = qw(Exporter);
$VERSION      = 1;
@EXPORT       = qw(exp_one exp_two);
@EXPORT_OK    = qw(ok_one ok_two ok_three ok_four);
%EXPORT_TAGS  = ('all'  => [ ( @EXPORT, @EXPORT_OK) ],
                 'some' => [ qw(ok_one ok_three exp_two) ]
                );


sub exp_one  { return 'exp_one'; }
sub exp_two  { return 'exp_two'; }
sub ok_one   { return 'ok_one';  }
sub ok_two   { return 'ok_two';  }
sub ok_three { return 'ok_three';}
sub ok_four  { return 'ok_four'; }


1;
