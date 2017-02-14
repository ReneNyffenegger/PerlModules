#!/usr/bin/perl
use warnings;
use strict;

use Text::Diff::FormattedHTML;

my ($file_1, $file_2) = qw(one.txt two.txt);

my $html = diff_files($file_1, $file_2);

open (my $out, '>', 'diff.html') or die;
my $title = "Diff between $file_1 and $file_2";
print $out <<HTML;
<!DOCTYPE html>
<head>
  <title>$title</title>
  <style type='text/css'>

    table {border-collapse: collapse}

    td {white-space: pre; font-family: monospace; font-size:16px; spacing: 4px}

    td:nth-child(2) {border-right: black solid 1px; padding-right: 10px}
    td:nth-child(3) {border-right: #999  solid 1px; padding-right: 10px;padding-left: 10px}
    td:nth-child(4) {padding-left: 10px}

    td:nth-child(1),
    td:nth-child(2) {color: #999}

   tr.disc_a td:nth-child(3),
   tr.disc_b td:nth-child(4),
    del {background-color: #fcc; color:#900;}
    ins {background-color: #cfc; color:#090;}


/* .change {background-color: #ddf;} */

    del, ins {font-weight: bold}

    ins {text-decoration: none} /* Remove annoying default underline of ins tag */

    h1 {font-family: sans-serif;}

  </style>
</head>
<body>
<h1>$title</h1>
$html
</body>
</html>
HTML
close $out;

