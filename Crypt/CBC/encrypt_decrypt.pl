#!/usr/bin/perl
use warnings;
use strict;

use Crypt::CBC;

#  ----------------------------------------------------------------------------------
#   -key can be any number of characters; the actual key will be derived by
#        passing the passphrase through a series of MD5 hash operations. To take
#        full advantage of a given block cipher, the length of the passphrase should
#        be at least equal to the cipher's blocksize. 
#
my $password = $ENV{TQ84_CBCCRYPTPASSWORD} or die "Env Variable TQ84_CBCCRYPTPASSWORD not set";
#  ----------------------------------------------------------------------------------

my $filename_in = shift or die "Filename not specified";

my $cipher = Crypt::CBC -> new ( -key    => $password,
                                 -cipyer => 'blowfish',
                                 -salt   =>  1);


my $filename_out;


if ($filename_in =~ /(.*)\.crypt/) {
   $filename_out = $1;
   print "Decrypting to $filename_out\n";

   $cipher -> start('decrypting');
}
else {
   $filename_out = "$filename_in.crypt";

   print "Encrypting to $filename_out\n";
   $cipher -> start('encrypting');

}

die "$filename_out exists" if -f $filename_out;

open (my $f_in , '<', $filename_in ) or die "could not open $filename_in";
open (my $f_out, '>', $filename_out) or die "could not open $filename_in";

binmode $f_in;
binmode $f_out;

my $buf;


while (read($f_in, $buf, 1024)) {
    print $f_out $cipher->crypt($buf);
}
print $f_out $cipher->finish;

close $f_in;
close $f_out;

unlink $filename_in or die "Could not delete $filename_in";
print "$filename_in deleted\n";
