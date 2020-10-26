#!/usr/bin/perl
#Miguel Arara

use strict;
use warnings;

my $file = $ARGV[0];
unless ($file) {
        print "Enter filename:\n";
        $file = <STDIN>;
        chomp $file;
    }
my @data ;
open (my $fh, '<', $file ) or die "Cant open '$file' $!\n";
my $dummy=<$fh>; #Skip first line 
while (my $line = <$fh>) {
    chomp $line ;
    my @fields = split(';', $line);
    my $global_hour = 10; #for the first iteration
    my $global_final_hour = 00;
    my $global_date = 00;
    my $global_init_hour = 00;
    my $global_date_student = 00;
    my $global_final_hour_student = 00;
    my $global_day_student = 00;
    my $global_day = 00;

    for (my $i = 0; $i <= 4; $i++) #loop with number of cells 
    { 
        $fields[$i] = "Nothing" unless $fields[$i];
        
        if ($i == 3){
           (my $date,my $init_hour,my $final_hour,my $room)  = split(' ',$fields[$i] );
           (my $hour) = split(':',$init_hour );
           (my $year, my $month, my $day ) = split('-',$date );
           $global_date = $date ;
           $global_day = $day ;
           $global_init_hour = $init_hour ;
           $global_hour = $hour ;
        }
        if ($i == 4){
           (my $date_student,my $final_hour_student)  = split(' ',$fields[$i] );
           (my $only_final_hour) = split(':',$final_hour_student );
           (my $year, my $month, my $day_student ) = split('-',$date_student );
           $global_day_student = $day_student ;
           $global_date_student = $date_student ;
           $global_final_hour_student = $final_hour_student ;
           $global_final_hour = $only_final_hour ;
           }
         if ($global_final_hour > $global_hour or $global_day_student > $global_day ){
              print ("$fields[0] $fields[1] $fields[2] - PROBLEM $global_date $global_init_hour -->$global_date_student  $global_final_hour_student\n");
          }
    } 
}
