package Sort::Quick;
use v5.14;
use strictures 2;
use Exporter::Shiny qw/quick_sort/;
use POSIX qw/floor/;
use Sort::Utils qw/swap/;

use feature 'signatures';
no warnings 'experimental::signatures';

# Worst case O(n^2)
# Best case O(n)
# Average case O(nlogn)
sub quick_sort($array) {
    _quick_sort($array, 0, scalar($array->@*) - 1);
}

sub _quick_sort($array, $low, $high) {
    return if ! ($low < $high);

    my $partition = _partition($array, $low, $high);

    _quick_sort($array, $low, $partition - 1);
    _quick_sort($array, $partition + 1, $high);

}

sub _partition($array, $low, $high) {
    my $pivot = $array->[$low];

    my $index = $low;
    for(my $j = $low + 1; $j <= $high; $j++) {
        if ($array->[$j] <= $pivot) {
            $index++;
            swap($array, $index, $j);
        }
    }
    swap($array, $low, $index);
    return ($index);
}

1;
