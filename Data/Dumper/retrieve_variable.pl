#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

# use Data::Dumper;

open my $in, '<', 'variables.store' or die;
my @in = <$in>;
close $in;

# @in now contains an assignment to a variable:
print @in;
# $VAR1 = {
#           '42' => 'forty two',
#           'some_hash_ref' => {
#                                'some_other_hash_ref' => {
#                                                           'some_hash_ref' => $VAR1->{'some_hash_ref'}
#                                                         },
#                                'foo' => 'bar',
#                                'now' => 'then'
#                              },
#           'one' => 1,
#           'two' => 2
#         };


my $VAR1;

eval (join "", @in);
say "After first eval";

say $VAR1->{42};
# forty two

say $VAR1->{some_hash_ref}{foo};
# bar

say $VAR1->{some_hash_ref}{some_other_hash_ref}{some_hash_ref}{now};
# Use of uninitialized value …

print "\n\n";

eval (join "", @in);
say "After second eval";

say $VAR1->{some_hash_ref}{some_other_hash_ref}{some_hash_ref}{now};
# then
