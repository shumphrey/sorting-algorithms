package Sort::Insertion;
use v5.14;
use strictures 2;
use Exporter::Shiny qw/insertion_sort/;
use POSIX qw/floor/;
use Sort::Utils qw/swap/;

use feature 'signatures';
no warnings 'experimental::signatures';

# Worst case O(n^2)
# Best case O(n)
# Average?
sub insertion_sort($array) {
    for ( my $i = 1 ; $i < scalar( $array->@* ) ; $i++ ) {
        my $val = $array->[$i];
        my $j   = $i - 1;

        while ( $j >= 0 && $array->[$j] > $val ) {
            $array->[ $j + 1 ] = $array->[$j];
            $j--;
        }
        $array->[ $j + 1 ] = $val;
    }
}

1;
