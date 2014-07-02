use warnings;
use strict;

use HTML::TableExtract;

my $html = <<HTML; #  # {{{

<p>Hello</p>
<p>More Hello</p>

<table summary='sum sum sum'><!--{{{-->

  <tr><td> Col 1  </td><td> Col  2 </td><td> Col 3  </td></tr>
  <!--     ======           ======           ======        -->
  <tr><td> Head 1 </td><td> Head 2 </td><td> Head 3 </td></tr>
  <tr><td> Val 1  </td><td> Val 2  </td><td> Val 3  </td></tr>
  <tr><td> Foo 1  </td><td> Foo 2  </td><td> Foo 3  </td></tr>
  <tr><td> Bar 1  </td><td> Bar 2  </td><td> Bar 3  </td></tr>
  <tr><td> Baz 1  </td><td> Baz 2  </td><td> Baz 3  </td></tr>

</table><!--}}}-->

<table summary='sum sum sum'><!--{{{-->

  <tr><td>Head 1</td><td>Head 2</td><td>Head 3</td></tr>
  <tr><td>

         <table summary='abc'><!--{{{-->
             <tr><td>Head 1</td><td>Head 2</td><td>Head 3</td></tr>
             <tr><td>Inner 1 </td><td>Inner 2 </td><td>Inner 3 </td></tr>
             <tr><td>Inner a </td><td>Inner b </td><td>Inner c </td></tr>
         </table><!--}}}-->

     </td>
      <td>qqqqq</td>
      <td>rrrrr</td>
      
   </tr>
</table><!--}}}-->

<p>New Table</p>

<table summary='sum sum sum'><!--{{{-->

  <tr><td          > Head 1 </td><td> Head 2 </td><td> Head 3 </td></tr>
  <!--               ======           ======           ======        -->
  <tr><td          > #      </td><td> ?      </td><td> /      </td></tr>
  <tr><td colspan=3>  !                                       </td></tr>
  <tr><td          > %      </td><td> *      </td><td> @      </td></tr>

</table><!--}}}-->

HTML
#  # }}}

my $te = HTML::TableExtract -> new (
   headers => ['Head 2', 'Head 3', 'Head 1']
);


$te -> parse($html);

foreach my $table ( $te->tables ) {

    print "\nTable (", join(',', $table->coords), "):\n";   # (0,0)

    foreach my $row ($table->rows) {
       print "  ";
       print join(',', map { defined $_ ? $_ : "n/a"} @$row), "\n";
    }

}
