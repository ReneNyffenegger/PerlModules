use warnings;
use strict;
use feature 'say';
use YAML::Tiny;

my $yaml_file = 'data.yaml';

unless (-e $yaml_file) {

  my %data = (

    'foo' => 42,
    'bar' => 'baz',
    'inner_hash' => {
      one => 1,
      two => 2
    }
  );

  my $yaml = YAML::Tiny->new(\%data);

  $yaml->write($yaml_file);

  exit 0;

}

my $yaml = YAML::Tiny->read($yaml_file);
my %data = %{ $yaml->[0] };

say $data{foo};
say $data{bar};
say $data{inner_hash}{one};
say $data{inner_hash}{two};
