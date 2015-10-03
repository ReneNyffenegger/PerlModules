use warnings;
use strict;
use Storable qw(nstore retrieve);
use feature 'say';

my $stored_file = 'data.store';

unless (-e $stored_file) {

  my %data = (

    'foo' => 42,
    'bar' => 'baz',
    'inner_hash' => {
      one => 1,
      two => 2
    }
  ); 

  nstore(\%data, $stored_file);
  exit 0;

}

my %data = %{ retrieve($stored_file) };


say $data{foo};
say $data{bar};
say $data{inner_hash}{one};
say $data{inner_hash}{two};
