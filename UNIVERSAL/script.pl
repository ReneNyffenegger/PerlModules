#!/usr/bin/perl
use warnings;
use strict;

use UNIVERSAL;

my $universal = {};
bless $universal, 'UNIVERSAL';

printf "isa :    %d\n", $universal->isa('foo');
printf "isa :    %d\n", $universal->isa('UNIVERSAL');

printf "DOES:    %d\n", $universal->DOES('foo');
printf "DOES:    %d\n", $universal->DOES('UNIVERSAL');

printf "can:     %d\n", $universal->can('can');
printf "can:     %d\n", $universal->can('isa');
printf "can:     %d\n", $universal->can('buy') // 0;

printf "VERSION: %s\n", $universal->VERSION();
