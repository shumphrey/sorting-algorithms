package Sort::Bubble;
use strictures 2;
use Exporter::Shiny qw/bubble_sort/;
use Sort::Utils qw/swap/;
use feature 'signatures';
no warnings 'experimental::signatures';

## Worst case and *average case* O(n^2)
sub bubble_sort($array) {
    while(1) {
        my $did_a_sort = 0;
        for(my $i = 0; $i < scalar($array->@*) - 1; $i++) {
            if ($array->[$i] > $array->[$i + 1]) {
                swap($array, $i, $i+1);
                $did_a_sort = 1;
            }
        }
        last if !$did_a_sort;
    }
}

1;
