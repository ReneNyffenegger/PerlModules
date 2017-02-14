use warnings;
use strict;

use XML::Parser;

my $xml_string = qq{<?xml version="1.0"?>
<root-node>
  <node-1 attribute-1='attribute one value'>Hello</node-1>
  <node-2/>
  <node-3 attribute-3='attribute three value'/>
  <node-4 attribute-4a='attribute four a'
          attribute-4b='attribute four b'>Something new
  </node-4>
         
</root-node>
};

my $xml_parser = XML::Parser->new;

$xml_parser -> setHandlers (
   Start     => \&    start_element,
   End       => \&      end_element,
   Char      => \&     char_data,
   Default   => \&  default_element
);

$xml_parser -> parse($xml_string);

sub start_element {

  my($parseinst, $element, %attributes) = @_;

  #print "  parseinst: $parseinst\n";
  print "start element: [$element]\n";

  foreach my $attribute (keys %attributes) {
    print "    $attribute = $attributes{$attribute}\n"
  }

  print "\n";
}

sub end_element {
  my($parseinst, $element, %attributes) = @_;

  #print " parseinst: $parseinst\n";
  print "end element: [$element]\n";

# It seems as though attributes will be always
# be empty in end_element?
  foreach my $attribute (keys %attributes) {
    print "    $attribute = $attributes{$attribute}\n"
  }

  print "\n";
}

sub char_data {
  my($parseinst, $data) = @_;
  $data =~ s/{amp}/&/;

  print "character data:\n";
  print "  data: $data\n";

  print "\n";
}

sub default_element {

  my $parseinst = shift;

  my $what_is_this = shift;

  print "default element\n";
  print "  $what_is_this\n";

  print "\n";
}
