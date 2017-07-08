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
      foreign key (col_a) references T1(col_1)
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
    alter table T1 add col_4 number references T3(col_x)
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
   
  my $format = 'pdf';
   
  $graph -> run(format => $format, output_file => "erd.$format");

  $dbh->disconnect;

}

sub open_db {
  
  my $attr               = {};
  $$attr{sqlite_unicode} = 1;

# my $dbh = DBI->connect("dbi:SQLite:dbname=$database_name", $attr) or die "Could not create $database_name";
  my $dbh = DBI->connect("dbi:SQLite:$database_name", '', '', $attr) or die "Could not create $database_name";

  $dbh -> do('PRAGMA foreign_keys = ON');

  return $dbh;
}
