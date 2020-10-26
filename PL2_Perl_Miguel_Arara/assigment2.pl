#!/usr/bin/perl
# Miguel Arara
use strict;
use warnings;

print "Enter numbers for calculate  the average:  \n";
my @numbers = <STDIN> ;
chomp @numbers ;

my $avg = total(@numbers ) / scalar(@numbers ) ;
print "The average was $avg ";

sub total {
    my $sum ;
    foreach (@_) {
        $sum += $_;
    }
    return $sum;
}

