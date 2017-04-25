#!/usr/bin/perl
use warnings;
use strict;

use Regexp::Common;

xyz("42"                          );
xyz("-42"                         );
xyz("forty-two: 42!"              );
xyz("foo 42.42 bar"               );
xyz("foo -42.42 bar"              );
xyz("foo -.42 bar"                );
xyz("hello world"                 );
xyz("hello 'world'."              );
xyz('good by, "world"!'           );
xyz("Five o'clock"                );
xyz("foo // comment"              );
xyz("foo /* more comment */"      );
xyz("foo # even more comment"     );
xyz("xyz <!-- comment --> abc"    );
xyz("http://abc.ch/foo.html?id=42");

sub xyz {

  my $text = shift;

  printf("%-30s | ", ">$text<");

  re($text, $RE{num}{int}      );
  re($text, $RE{num}{real}     );
  re($text, $RE{quoted}        );
  re($text, $RE{URI}{HTTP}     );
  re($text, $RE{comment}{C}    );
  re($text, $RE{comment}{'C++'});
  re($text, $RE{comment}{PHP}  );
  re($text, $RE{comment}{Java} );
  re($text, $RE{comment}{Perl} );
  re($text, $RE{comment}{awk}  );
  re($text, $RE{comment}{HTML} );


  print "\n";

}

sub re {
  my $text   = shift;
  my $regexp = shift;

  if ($text =~ /$regexp/) {
    print "x ";
  }
  else {
    print  "  ";
  }


}
