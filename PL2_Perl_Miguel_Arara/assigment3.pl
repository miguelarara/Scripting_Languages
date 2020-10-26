
#!/usr/bin/perl
use strict;
use warnings;

my $counter = 0;
my $prev_hour = 00;

foreach my $file (@ARGV ) {
   next if ($file =~ m/^\./);
   open my $fh, '<', $file or die $!;
   my $firstLine = <$fh>; 
   (my $ip_address,my $separator1,my $separator2,my $timestamp,my $request) = split(' ',$firstLine );
   (my $date,my $hours,my $min,my $sec ) = split(':',$timestamp );
   $date =~ s/^.//; #With regex for remove first element ("[") of the line
   print "File: $date  \nhour: requests \# \n" ;
   print "------------------------------------------\n";
   foreach my $line (<$fh>) {
      chomp($line );
      (my $ip_address,my $separator1,my $separator2,my $timestamp,my $request) = split(' ',$line );
      (my $date,my $hours,my $min,my $sec ) = split(':',$timestamp );
      if ($prev_hour == $hours ){
         $counter ++;
      }else{
         print "$hours : $counter\n";
         $counter = 0;
         $prev_hour = $hours ;
         $counter ++;
         }
   }
   print("\n\n");
}
