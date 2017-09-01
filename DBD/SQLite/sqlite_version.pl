#!/usr/bin/perl
use warnings;
use strict;
use DBI;

my $dbh = DBI->connect("dbi:SQLite:dbname=:memory:") or die "Could not conect to memory database";

printf "sqlite version is %s\n", $dbh->{sqlite_version};
