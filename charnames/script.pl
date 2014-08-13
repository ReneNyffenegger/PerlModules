use warnings;
use strict;
use utf8;

use charnames ':loose' # , ':alias' => { e_ACUTE => "LATIN SMALL LETTER E WITH ACUTE"}
;

open (my $html, '>', 'charnames.html') or die;
binmode ($html, ':utf8');

print $html '<html><head><meta content="text/html;charset=utf-8" http-equiv="Content-Type"><title>charnames</title></head></body>';

print $html "<table>
  <tr><td>GREEK SMALL LETTER ALPHA</td><td>\N{GREEK SMALL LETTER ALPHA}</td></tr>
  <tr><td>Greek small letter beta </td><td>\N{Greek small letter beta }</td></tr>
  <tr><td>Bullet                  </td><td>\N{Bullet                  }</td></tr>
</table>";
# <tr><td>e_acute                 </td><td>\N{e_ACUTE                 }</td></tr>

print $html charnames::viacode (ord 'ä'); # LATIN SMALL LETTER A WITH DIAERESIS

print $html '</body></html>';
