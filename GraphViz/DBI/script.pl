#!/usr/bin/perl
use warnings;
use strict;

use DBI;
use GraphViz::DBI;

my $database_name = 'the.db';

unlink $database_name if -e $database_name;

create_database();
create_erd();

sub create_database {

  my $dbh = open_db();

  $dbh->do(q{
    create table T1 (
      col_1   number,
      col_2   varchar(10),
      col_3   date,
--    col_4   number not null,
      primary key (col_1)
    )
  });

  $dbh->do(q{
    create table T2 (
      col_a   number,
      col_b   varchar(10),
      col_c   varchar(10),
      col_d   varchar(20),
      primary key (col_b, col_c),
      foreign key (col_a) references T1
    )
  });

  $dbh->do(q{
    create table T3 (
      col_x   number,
      col_y   number,
      col_z   varchar(99),
      primary key (col_x)
    )
  });

  $dbh->do(q{
    alter table T1 add col_4 number references T3
  });

  $dbh -> disconnect;

}

sub create_erd {

  my $dbh = open_db();

  open my $erd_fh, '>', 'erd.png' or die;
  print $erd_fh GraphViz::DBI->new($dbh)->graph_tables->as_png;
  close $erd_fh;

  $dbh->disconnect;

}

sub open_db {

  my $dbh = DBI->connect("dbi:SQLite:dbname=$database_name") or die "Could not create $database_name";

  return $dbh;


}
