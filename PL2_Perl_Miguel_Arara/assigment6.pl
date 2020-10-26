#!/usr/bin/perl 
#Miguel Arara

use strict;
use warnings;
use Data::Dumper;

my $DATA;
my $prefix_lenght = $ARGV[0];

sub save_words {

    ### method for extract words 
   
    my $file = $ARGV[1];
    unless ($file) {
        print "Enter filename:\n";
        $file = <STDIN>;
        chomp $file;
    }
    my @prefixes ;
    open($DATA, $file) or die $!;
    foreach my $line (<$DATA>) {
           chomp $line ;
           my @words = split(' ',$line );
           @words = sort(@words);
           foreach my $word ( @words ){
               $word =~ s/(?!-)[[:punct:]]//g; #remove all punctuation markwith regex
               my $prefix = substr ($word ,0, $prefix_lenght); 
	       push (@prefixes,$prefix); #save the prefixes in list 
	      
           }
    }
    return @prefixes ;
}

my @prefixes = save_words();

sub count_prefixes{ 
    my %counts_prefixes ;
    $counts_prefixes{$_}++ for @prefixes;
    foreach my $prefix (sort keys %counts_prefixes) {
        printf "%-8s : %s\n", $prefix, $counts_prefixes{$prefix};
    }
}

count_prefixes();
