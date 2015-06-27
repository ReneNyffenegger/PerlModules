use warnings;
use strict;
use DBD::Oracle;

my $username = shift;
my $password = shift;
my $database = shift;

die "Indicate Username, password and database" unless defined $database;

my $set_LongReadLen = shift;

die "Indicate if I must set LongReadLen!" unless defined $set_LongReadLen;

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

if ($set_LongReadLen) {
  print "Seting LongReadLen to $set_LongReadLen\n";
  $dbh -> {LongReadLen} = $set_LongReadLen;
}

createTables();
copyTables();
deleteTables();


sub createTables { # {{{

    $dbh -> do("create table tq84_LongReadLen_1(id number, c clob)");
    $dbh -> do("create table tq84_LongReadLen_2(id number, c clob)");

    $dbh -> do("insert into tq84_LongReadLen_1 values (1, rpad('x',    80, 'x'))");
    $dbh -> do("insert into tq84_LongReadLen_1 values (2, rpad('x', 32000, 'x'))"); # TODO only 4000 characters inserted....
    
} # }}}

sub copyTables { # {{{

    my $sth = $dbh -> prepare("select * from tq84_LongReadLen_1");
    $sth -> execute;

    while (my $r = $sth -> fetchrow_hashref) {
      printf("%2d %5d\n", $r->{ID}, length($r->{C}));
    }
    
} # }}}

sub deleteTables { # {{{
    $dbh -> do("drop table tq84_LongReadLen_1 purge");   
    $dbh -> do("drop table tq84_LongReadLen_2 purge");   
} # }}}
