#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Win32::TieRegistry;

#
#   Win32::TieRegistry creates a variable $Registry which is a VIRTUAL root above
#   of all registry trees (Such as HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE etc)
#
#   Make sure it does indeed exist!
#
die unless $Registry;

#   Each regstry key is identified by a name that differs, however, from
#   the known HKEY_* names:
say for keys (%$Registry);
# Classes\
# LMachine\
# CConfig\
# CUser\
# Users\
# PerfData\
# DynData\
