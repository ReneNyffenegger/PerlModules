#!/usr/bin/perl
use warnings;
use strict;

use DBI;
use GraphViz2::DBI;

my $database_name = 'the.db';

unlink $database_name if -e $database_name;

create_database();
create_erd();

sub create_database {

  my $dbh = open_db();

  $dbh->do(q{
    create table T1 (
      id      integer primary key,
      col_1   number,
      col_2   integer references T3(id),
      col_3   varchar(10),
      col_4   date
--    col_4   number not null,
--    primary key (col_1)
    )
  });

  $dbh->do(q{
    create table T2 (
      id      integer,
      col_b   varchar(10),
      col_c   varchar(10),
      col_d   varchar(20),
      primary key (col_b, col_c),
      foreign key (id) references T1(id)
    )
  });

  $dbh->do(q{
    create table T3 (
      id      integer primary key, -- Apparently, must be named id!!!
      col_y   integer,
      col_z   varchar(99)
      )
    });

  $dbh -> disconnect;

}

sub create_erd {

  my $dbh = open_db();

  my $graph = GraphViz2 -> new (
    edge   => {color => 'grey'},
    global => {directed => 1},
    graph  => {rankdir => 'TB'},
  # logger =>  …
    node   => {color => 'blue', shape => 'oval'},
  );

  my $g  = GraphViz2::DBI -> new(dbh => $dbh, graph => $graph);

  $g -> create(name => '');

  my $format = 'png';

  $graph -> run(format => $format, output_file => "erd.$format");

  $dbh->disconnect;

}

sub open_db {

  my $attr               = {};
  # $$attr{sqlite_unicode} = 1;

# my $dbh = DBI->connect("dbi:SQLite:dbname=$database_name", $attr) or die "Could not create $database_name";
  my $dbh = DBI->connect("dbi:SQLite:$database_name", '', '', $attr) or die "Could not create $database_name";

# $dbh -> do('PRAGMA foreign_keys = ON');

  return $dbh;
}
