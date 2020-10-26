#!/usr/bin/perl Miguel Arara

use strict;
use warnings;

my $file = $ARGV[0] ;
    unless ($file) {
        print "Enter filename:\n";
        $file = <STDIN>;
        chomp $file;
    }

sub components_weights_method {

    ### method for extract weights
    
    print "Ranking List \n";
    print "-------------------------\n" ;
    my @data ;
    my $counter_file = 0;
    open (my $fh, '<', $file ) or die "Cant open '$file' $!\n";
    while (my $line = <$fh>) {
          chomp $line ;
          if ($counter_file == 0) {
             my @fields = split(';', $line);
             return @fields ;
          }
          $counter_file++;
    }
    close ($fh);
}

my @components_weights = components_weights_method();

sub results_students_marks {
   
    ### method for calculate the final marks

    my @data ;
    my $position = 1;
    my $counter_file = 0;
    open (my $fh, '<', $file ) or die "Cant open '$file' $!\n";
    while (my $line = <$fh>) {
          chomp $line ;
          my @fields = split(';', $line);
          if ($counter_file >= 1){
             my $final_mark = 0 ;
             my $counter_weights = 0 ;
             
             print "$position. ";
	     $position++;
             for (my $i = 0; $i <=10; $i++) #loop with number of cells 
             {
                 $fields[$i] = "Nothing" unless $fields[$i];
                
                 if ($i >= 4) {
                     $counter_weights++ ;
                     if ($fields[$i] eq "-"){
                         $fields[$i] = 0;
                     }
                     my $new_mark = $fields[$i] * $components_weights[$counter_weights];  
                     $final_mark += $new_mark ;
                  }    
             }
          print "$fields[3] $fields[2] ($fields[1]) ";
          print "$final_mark ";
          print "\n";
          }
          $counter_file++;
    }     
}
results_students_marks();
