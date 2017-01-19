#!/usr/bin/perl
use warnings;
use strict;
use Net::Netrc;

my $rc = Net::Netrc->lookup('renenyffenegger.ch') or die;

printf "Login: %s\n\n", $rc->login;

my ($login, $password, $account) = $rc->lpa;
printf "Login:   %s\nPassord: %s\nAccount: %s\n", $login, $password, $account || 'n/a';
