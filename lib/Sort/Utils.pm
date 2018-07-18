package Sort::Utils;
use strictures 2;
use Exporter::Shiny qw/swap/;

use feature 'signatures';
no warnings 'experimental::signatures';

sub swap($array, $i, $j) {
    my $temp = $array->[$j];
    $array->[$j] = $array->[$i];
    $array->[$i] = $temp;
}

1;
