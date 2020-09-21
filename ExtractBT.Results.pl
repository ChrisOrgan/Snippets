<<<<<<< HEAD
#!/usr/bin/perl
#This script extracts results from a merged BayesTraits Output
#By Chris Organ, Dec 14th, 2010
#

	( $results_source ) = @ARGV;
	$usage = "perl Extract.Results.pl source_file";
	unless ( $results_source )
	{ die "\nUsage: $usage\n" };
	open( SOURCE, "$results_source" ) or die "Could not open file";
	open (DESTINATION,">>ExtractedResults.txt") or die;
	$line_count = 0;
		while ($line = <SOURCE>) {
		   $line_count++;
		if($line =~ m/^1\t/)
		  {print DESTINATION  "$line"} 
		}
	close (DESTINATION);


		
	
	
=======
#!/usr/bin/perl
#This script extracts results from a merged BayesTraits Output
#By Chris Organ, Dec 14th, 2010
#

	( $results_source ) = @ARGV;
	$usage = "perl Extract.Results.pl source_file";
	unless ( $results_source )
	{ die "\nUsage: $usage\n" };
	open( SOURCE, "$results_source" ) or die "Could not open file";
	open (DESTINATION,">>ExtractedResults.txt") or die;
	$line_count = 0;
		while ($line = <SOURCE>) {
		   $line_count++;
		if($line =~ m/^1\t/)
		  {print DESTINATION  "$line"} 
		}
	close (DESTINATION);


		
	
	
>>>>>>> 5c6b919a8237ae306b54b209bdbd035405ec9b34
	