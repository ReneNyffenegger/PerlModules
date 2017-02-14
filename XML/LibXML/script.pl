use XML::LibXML;
use strict;
use warnings;
my $parser = XML::LibXML->new;

my $xmlp= $parser -> parse_file("stackoverflow_17722520.xml");
my $rootel = $xmlp -> getDocumentElement();

my $elname = $rootel -> getName();
my @rootelements=$rootel -> getAttributes();


foreach my $rootatt(@rootelements){
    my  $name = $rootatt -> getName();
    my $value = $rootatt -> getValue();
    print " ${name}[$value]\n ";
}

my @kids = $rootel -> childNodes();
foreach my $child(@kids) {
# print "\nchild: $child\n";
  my @grand_kids = $child -> childNodes();

  foreach my $grand_kid (@grand_kids) {

    my $elname = $grand_kid -> getName();
    my @atts = $grand_kid -> getAttributes();
    foreach my $at (@atts) {
        print "--\n";
        my $name = $at -> getName();
        my $value = $at -> getValue();
        print "   ${name}[$value]\n ";

    }
  }
}
