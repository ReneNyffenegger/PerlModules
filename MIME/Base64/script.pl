use warnings;
use strict;
use feature 'say';

use MIME::Base64;

say '';

my $encoded = encode_base64('Foo, bar, baz etc.');
say "Encoded: $encoded";

my $decoded = decode_base64($encoded);
say "Decoded: $decoded";
