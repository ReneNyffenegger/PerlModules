use strict;
use warnings;

use Parse::RecDescent;

my $grammar = q {
  
  operation  :  ident operator ident
              {printf "Parsed operation: %s %s %s\n", $item[1], $item[2], $item [3];}

  operator   : '+' | '-' | '*' | '/'
  
  ident      :  char char_or_num(s)
                { $item[1] . join "", @{$item[2]} }

  char_or_num: char | num

  num        :  /\d/

  char       :  /[a-zA-Z]/
};

my $parser = Parse::RecDescent->new($grammar);

defined $parser->operation('Foo + Bar') or die "didn't match";
defined $parser->operation('x10 / y15') or die "didn't match";
defined $parser->operation('100 /  42') or die "didn't match";

__DATA__
Parsed operation: Foo + Bar
Parsed operation: x10 / y15
didn't match at C:\github\PerlModules\Parse\RecDescent\script.pl line 27.
