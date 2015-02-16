use warnings;
use strict;

use DBD::Oracle qw(:ora_types);

my $username = shift;
my $password = shift;
my $database = shift;

die "Indicate Username, password and database" unless defined $database;

my $dbh = DBI->connect("dbi:Oracle:$database", $username, $password) or die;

drop_table();
create_table();
insert_data();
select_data();


sub insert_data { # {{{

    my $sth = $dbh -> prepare(q{
    
      insert into tq84_lob values (
        1,
        empty_clob()
      )
--    returning c into :c
    });

#   This approach does not seem to work, it throws
#
#       DBD::Oracle::db ora_lob_write failed: ORA-22990: LOB locators cannot span transactions
#       
#   $sth -> bind_param_inout(':c', \my $c, 0, {ora_type=>ORA_CLOB});
#
    $sth -> execute;

    my $c = $dbh -> selectrow_array("select c from tq84_lob where id = 1 for update", {ora_auto_lob => 0});

    $dbh -> ora_lob_write(
      $c,
      1,   # offset, starts with 1!
      join '-', (1 .. 10000)
    );

    
} # }}}

sub select_data { # {{{

    my $c = $dbh -> selectrow_array("select c from tq84_lob where id = 1", {ora_auto_lob => 0});

    my $count = 0;
    while (my $buf = $dbh -> ora_lob_read($c, 1 + $count*1000 , 1000)) {
      print $buf;
      $count++;
    }
    print "\ncount: $count\n";
    
} # }}}

sub create_table { # {{{

    $dbh -> do (q{

      create table tq84_lob (
        id    number primary key,
        c     clob
      )

    });
    
} # }}}

sub drop_table { # {{{
    $dbh -> do('drop table tq84_lob purge');
} # }}}
