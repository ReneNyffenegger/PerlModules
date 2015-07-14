use warnings;
use strict;

use       HTML::Parser ;

my $p = new HTML::Parser (
  start_h       => [\&start_tag  , 'tag, attr, attrseq, text' ],
  end_h         => [\&end_tag    , 'tag'                      ],
  text_h        => [\&text       , 'text'                     ],
  comment_h     => [\&comment    , 'text'                     ],
  default_h     => [\&default    , 'text'                     ],
  process_h     => [\&process    , 'text'                     ],
  declaration_h => [\&declaration, 'text'                     ]
);


my $indent_ = 0;
 
$p->parse_file("test_01.html") or die;

sub text {
    my ($text) = @_;
    $text =~ s/\n//g;
    print '  ' x $indent_ . "Text: $text\n";
}

sub comment {
    my ($comment) = @_;
    print '  ' x $indent_ . "Comment: $comment\n";
}

sub start_tag {
    my ($tag, $attr, $attrseq, $text) = @_;
    print '  ' x $indent_ . "Tag: $tag $text\n";
    $indent_ ++;
}

sub end_tag {
    my ($tag, $text) = @_;

    $indent_ --;
    print '  ' x $indent_ . "Endtag: $tag\n";
}

sub default {
    my ($text) = @_;
    print '  ' x $indent_ . "Default: $text\n";
}

sub process {
    my ($text) = @_;
    print '  ' x $indent_ . "Process: $text\n";
}

sub declaration {
    my ($text) = @_;
    print '  ' x $indent_ . "Declaration: $text\n";
}
