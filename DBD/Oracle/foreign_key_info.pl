use warnings;
use strict;

use DBI;
use DBD::Oracle;

my $username = shift;
my $password = shift;
my $database = shift || '';

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

create_tables();

my $fk_sth = $dbh -> foreign_key_info(undef, undef, undef, undef, uc $username, 'TQ84_C');


print "\n";
while (my $r = $fk_sth->fetchrow_arrayref) { # {{{

  my ($what_1, $schema_1, $table_1, $column_1,
      $what_2, $schema_2, $table_2, $column_2,
      $a, $b, $c,
      $name_fk, $name_pk,
      $what_3,
      $what_4) = @$r;


  printf( "%-10s %-10s %-10s | %-10s %-10s %-10s | %2d %2d %2d | %-30s %-30s | $what_4\n", 
          $schema_1, $table_1, $column_1,
          $schema_2, $table_2, $column_1,
          $a, $b, $c,
          $name_fk, $name_pk);




} # }}}
print "\n";


drop_tables();

sub create_tables { # {{{

    $dbh -> do ("create table tq84_p1 (
      id number primary key,
      tx varchar2(10)
    )");
    
    $dbh -> do ("create table tq84_p2 (
      id_1 number      ,
      id_2 varchar2( 5),
      tx   varchar2(10),
      --
      constraint tq84_p2_pk primary key (id_1, id_2)
    )");
    
    $dbh -> do ("create table tq84_c (
      id references tq84_p1,
      id_1,
      id_2,
      tx varchar2(10),
      --
      constraint tq84_c_fk1 foreign key (id_1, id_2) references tq84_p2
    )");

} # }}}

sub drop_tables { # {{{

    $dbh -> do ("drop table tq84_c" );
    $dbh -> do ("drop table tq84_p1");
    $dbh -> do ("drop table tq84_p2");

} # }}}
