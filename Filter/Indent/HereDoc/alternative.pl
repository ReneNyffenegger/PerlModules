use warnings;
use strict;

my $nine_nine = 99;

sub fix_indent {
  my $indent = shift;
  my $line = shift;
  my $pattern = ' ' x $indent;
  $line =~ s/^$pattern//mg;
  return $line
}

print fix_indent 4, << "    END";
    one
    two
    three
        1
        2
       $nine_nine;
    END
