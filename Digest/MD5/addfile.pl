use warnings;
use strict;

use Digest::MD5;

my $md5 = new Digest::MD5;

open (my $fh, '<', 'File/script.pl') or die;
binmode $fh;

$md5->addfile($fh);

print $md5->hexdigest, "\n";

close $fh;
