#!/usr/bin/perl
use warnings;
use strict;
use DBI;

my $db = 'explain_query_plan.db';

unlink $db if -f $db;
my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die "Could not create $db";

$dbh->do(q{
  create table p (
    id   int primary key,
    col  text
  )
}) or die;

$dbh->do(q{
  create table c (
    id    int primary key,
    id_p  int references p,
    col   text
  )
}) or die;

$dbh->do(q{
  create index ix_p on p (col)
}) or die;

my $sth = $dbh->prepare(q{
  explain query plan
  select
    c.col col_c
  from
    p                  join
    c on p.id = c.id_p
  where
    c.col = 'foo'
 }
) or die;

$sth->execute;

while (my @r = $sth->fetchrow_array) {
  printf "%2d %2d %2d %s\n", @r;
}
