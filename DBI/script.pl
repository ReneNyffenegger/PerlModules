use warnings;
use strict;

use DBI qw ( :sql_types );

my $driver   = 'dbi:Oracle';
my $dbname   = 'ORA_MANUALLY_CREATED';
my $username = 'meta';
my $password = 'meta';

my $dbh = DBI -> connect("$driver:$dbname", $username, $password) or die;

my $sth = $dbh -> prepare ("select * from dba_objects");

my @column_types = @{$sth -> {TYPE}};
my @column_names = @{$sth -> {NAME}};

for (my $c = 0; $c<@column_types; $c++) {
  my $type;
  if    ($column_types[$c] == SQL_VARCHAR        ) { $type = 'VARCHAR'         ;}
  elsif ($column_types[$c] == SQL_CHAR           ) { $type = 'CHAR'            ;}
  elsif ($column_types[$c] == SQL_LONGVARCHAR    ) { $type = 'LONGVARCHAR'     ;}
  elsif ($column_types[$c] == SQL_NUMERIC        ) { $type = 'NUMERIC'         ;}
  elsif ($column_types[$c] == SQL_BIGINT         ) { $type = 'BIGINT'          ;}
  elsif ($column_types[$c] == SQL_TINYINT        ) { $type = 'TINYINT'         ;}
  elsif ($column_types[$c] == SQL_REAL           ) { $type = 'REAL'            ;}
  elsif ($column_types[$c] == SQL_DOUBLE         ) { $type = 'DOUBLE'          ;}
  elsif ($column_types[$c] == SQL_DATE           ) { $type = 'DATE'            ;}
  elsif ($column_types[$c] == SQL_TIME           ) { $type = 'TIME'            ;}
  elsif ($column_types[$c] == SQL_TIMESTAMP      ) { $type = 'TIMESTAMP'       ;}
  elsif ($column_types[$c] == SQL_DATETIME       ) { $type = 'DATETIME'        ;}
  elsif ($column_types[$c] == SQL_BOOLEAN        ) { $type = 'BOOLEAN'         ;}
  elsif ($column_types[$c] == SQL_FLOAT          ) { $type = 'FLOAT'           ;}
  elsif ($column_types[$c] == SQL_DECIMAL        ) { $type = 'DECIMAL'         ;}
  elsif ($column_types[$c] == SQL_TYPE_TIME      ) { $type = 'TIME (sql)'      ;}
  elsif ($column_types[$c] == SQL_TYPE_TIMESTAMP ) { $type = 'TIMESTAMP (sql)' ;}
  else                                      { $type = "? " . $column_types[$c];}
  printf ("%-30s : %-10s\n", $column_names[$c], $type);
}
