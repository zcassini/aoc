use warnings;
use strict;
use v5.30;
use experimental 'signatures';
use List::Util qw(max reduce sum);
use File::Slurp qw(read_file);

sub p1(@elves) {
    max(elves_to_powers(@elves));
}

sub p2(@elves) {
    my @top = sort { $b <=> $a } elves_to_powers(@elves);
    sum(@top[0..2]);
}

sub elf_to_power ($elf) {
    reduce { int($a) + $b } split("\n", $elf);
}    

sub elves_to_powers (@elves) {
    map { elf_to_power $_ } @elves;
}

my @elves = split("\n\n", read_file("input_d1"));
say p1(@elves);
say p2(@elves);