#!/usr/bin/perl
use warnings;
use strict;

use utf8;

use Devel::Peek 'Dump';

my $text = 'Föö, Bär, Bäz';

Dump $text;
#
# SV = PV(0x17b3b20) at 0x17dc318
#   REFCNT = 1
#   FLAGS = (POK,IsCOW,pPOK,UTF8)
#   PV = 0x17e4ce0 "F\303\266\303\266, B\303\244r, B\303\244z"\0 [UTF8 "F\x{f6}\x{f6}, B\x{e4}r, B\x{e4}z"]
#   CUR = 17
#   LEN = 19
#   COW_REFCNT = 1
