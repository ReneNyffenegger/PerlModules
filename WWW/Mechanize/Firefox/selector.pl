use warnings;
use strict;
use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new(
  launch   =>'C:\Program Files\Mozilla Firefox\firefox.exe',
);

$mech->get_local('selector.html');

print "selecting #baz\n";

my $baz = $mech->selector('#baz', single=>1);
print "  ", $baz->{innerHTML}, "\n";

print "selecting .foo_bar_baz\n";
my @foo_bar_baz = $mech->selector('.foo_bar_baz', all=>1);
for my $foo_bar_baz (@foo_bar_baz) {
  print "  ", $foo_bar_baz -> {innerHTML}, "\n";
}
