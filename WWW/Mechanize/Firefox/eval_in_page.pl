use warnings;
use strict;
use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new(
  launch   =>'C:\Program Files\Mozilla Firefox\firefox.exe',
);

$mech->get_local('eval_in_page.html');

my ($obj, $obj_type) = $mech->eval_in_page(<<'JS');

  var e = document.getElementById('foo');

//window.alert(e.innerHTML);
//e.innerHTML;

 var r = {
   'text': e.innerHTML,
   'xyz' : 42,
  };

 r;


JS

print "object type: $obj_type\n";
print $obj->{text},"\n";
print $obj->{xyz},"\n";
