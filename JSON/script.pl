use strict;
use warnings;

use JSON;

my $json_text = <<JSON;
  {"foo":{"42":"forty-two",
           "8":"eight"},
    "bar":[{"key":"1"},
           {"key":"2"},
           {"key":"3"},
           {"key":"4"}]
   }
JSON

my $json_ = from_json($json_text);

print $json_->{foo}->{42}, "\n";       # forty-two

print $json_->{bar}->[2]->{key}, "\n"; # three
