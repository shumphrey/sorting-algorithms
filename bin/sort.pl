#!/usr/bin/env perl

use v5.14;
use strictures 2;
use Time::HiRes;
use Benchmark qw/cmpthese timethese :hireswallclock/;
use Sort::Quick qw/quick_sort/;
use Sort::Merge qw/merge_sort/;
use Sort::Insertion qw/insertion_sort/;
use Sort::Bubble qw/bubble_sort/;
use Clone qw/clone/;


srand 1; # same array each time

my @array = map { int(rand(10000)) } 1..1000;

my $results = timethese(
    1000,
    {
        bubble    => run(\&bubble_sort),
        insertion => run(\&insertion_sort),
        merge     => run(\&merge_sort),
        quick     => run(\&quick_sort),
    }
);
cmpthese($results);

sub run {
    my $code = shift;
    return sub {
        my @to_sort = @array;
        $code->(\@to_sort);
    }
}
