#!/usr/bin/perl
use warnings;
use strict;

use Test::Simple tests => 6;
use Test::File;

use File::Touch;

unlink 'empty' if -f 'empty';

file_exists_ok($0, "$0 exists");

file_not_exists_ok('empty', 'empty does not exist');
touch 'empty';
file_empty_ok('empty', 'empty is empty');
file_not_empty_ok($0, "$0 is not empty");

open (my $fh, '>', 'file-with-content') or die;
print $fh '<elems>
<!-- comment
more comment
-->
<nd x="12.3456789" y="98.7654321" />
<nd x="55.5555555" y="77.7777771" />
</elems>';

close $fh;

#
# Mutliple pattern can be given. Note the following
# tests consists of two tests and counts as
# such.
#
file_contains_utf8_like('file-with-content', [
    qr/<nd x="55\.5555.*".* y="55\.5555/,
    qr/<nd x="12\.3456.*".* y="98\.7654/ 
]);
