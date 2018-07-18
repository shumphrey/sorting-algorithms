package Sort::Merge;
use v5.14;
use strictures 2;
use Exporter::Shiny qw/merge_sort/;
use POSIX qw/floor/;
use Sort::Utils qw/swap/;

use feature 'signatures';
no warnings 'experimental::signatures';

# Average/Worst/Best all O(nlogn)
sub merge_sort($array) {
    _merge_sort($array, 0, scalar($array->@*) - 1);
}

sub _merge_sort($array, $start, $end) {
    return if ! ($start < $end);

    my $mid = floor( ($start + $end) / 2);

    _merge_sort($array, $start, $mid);
    _merge_sort($array, $mid + 1, $end);
    _merge($array, $start, $mid, $end);
}

sub _merge($array, $start, $mid, $end) {
    my @left = @{$array}[$start..$mid];
    my @right = @{$array}[($mid + 1) .. $end];

    my $i = 0;
    my $j = 0;
    my $k = $start;
    while($i < scalar(@left) && $j < scalar(@right)) {
        if ($left[$i] <= $right[$j]) {
            $array->[$k] = $left[$i];
            $i++;
        }
        else {
            $array->[$k] = $right[$j];
            $j++;
        }
        $k++;
    }

    ## Append any remaining left elements
    while($i < scalar(@left)) {
        $array->[$k] = $left[$i];
        $k++;
        $i++;
    }

    ## Append any remaining right elements
    while($j < scalar(@right)) {
        $array->[$k] = $right[$j];
        $k++;
        $j++;
    }
}

1;
