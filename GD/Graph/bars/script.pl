use warnings;
use strict;

use GD::Graph::bars;
use GD::Graph::Data;

my $data = GD::Graph::Data->new([
  [qw /Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec/],
  [     10, 10, 12, 13, 16, 20, 23, 24, 22, 18, 13, 11 ], # Mean Temperature Barcelona
]);

my $graph = GD::Graph::bars->new;

$graph -> set (

    x_label    => 'Month',
    y_label    => 'Celsius',
    title      => 'Mean temperature Barcelona'

);

$graph->plot($data);

open my $png, '>', 'Temperature-Barcelona.png';
binmode $png;
print $png $graph->gd->png;
close $png;
