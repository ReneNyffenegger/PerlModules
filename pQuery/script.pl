use warnings;
use strict;

use pQuery;

my $html=<<"END"; # {{{

  <html>

    <div> aaa </div>

    <div> <div> bbb </div> </div>

    <p> ccc </p>

  </html>


END
# }}}


my $p = pQuery($html);

print $p -> find('p'  ) -> html, "\n";
$p -> find('div')->each(sub {
  print 'Each: ' . pQuery($_)->html,"\n";
});

print $p -> find('div')->eq(2) -> text;

