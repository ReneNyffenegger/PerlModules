use strict;
use warnings;

use Parse::RecDescent;

my $grammar = q {
  
  operation  :  ident operator ident
              {printf "Parsed operation: 1st ident: %s %s %s\n", $item[1], $item[2], $item[3];}

  operator   : '+' | '-' | '*' | '/'
  
  ident      :  char char_or_num(s?) # s: one or more, s? zero or more
               { $item[1] . join "", @{$item[2]} }

  char_or_num: char | num

  num        :  /\d/

  char       :  /[a-zA-Z]/
};

my $parser = Parse::RecDescent->new($grammar) or die "Bad grammar!";

defined $parser->operation('Foo + Bar') or print "didn't match\n";
defined $parser->operation('x10 / y15') or print "didn't match\n";
defined $parser->operation('100 /  42') or print "didn't match\n"; # Doesn't match because operator requires ident's, not num's.
defined $parser->operation('a   -  b ') or print "didn't match\n";

print "\nUniversal token prefix pattern: >$Parse::RecDescent::skip<\n";  # \s*
