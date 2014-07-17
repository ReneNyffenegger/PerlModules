use warnings;
use strict;

use DBD::CSV;

my $csv_file_name = "without_column_names.csv";

my $dbh = DBI->connect ("dbi:CSV:", undef, undef, {

      csv_sep_char   => ';',
#     csv_null       =>  1 ,
#     eol            => "\n",
      csv_tables     => {
        $csv_file_name => {
           col_names => [ qw(col_1 col_2 col_3) ]
        }
      }
  });

my $sth = $dbh->prepare ("select col_1, col_2 from $csv_file_name");
$sth->execute;

while (my $row = $sth->fetchrow_hashref) {
    print "$row->{'col_1'}   $row->{'col_2'}\n";
}
