#!/usr/bin/perl
#This script parses out tab delimited SNP file [Name \t Phenotype \t Snps...] into separate files with format [Name \t Phenotype \t Snp]
#By Chris Organ, Dec 14th, 2010
#

#Open data file whose name is given in the first argument on the command
# line
	( $mutli_source ) = @ARGV;
	$usage = "perl Export.MultiStateFiles.pl source_file";
	unless ( $mutli_source )
	{ die "\nUsage: $usage\n" };
	open( SOURCE, "$mutli_source" ) or die "Could not open file";

#Count SNPs
	$line = <SOURCE>;
	@split_count = split(/\t/, $line);
	$SNPcount = @split_count -1;
	seek(SOURCE,0,0);
	
#Parsing Data
	$line_count = 0;
	$word_count = 2;
	while ($word_count <= $SNPcount) {
	$file_count = $word_count -1;
	open (DESTINATION,">>data.$file_count.txt") or die;
		while ($line = <SOURCE>) {
		   $line_count++;
		   @split = split(/\t/, $line);
			if ($word_count == $SNPcount)
			{
			 print DESTINATION @split[0],"\t",@split[1],"\t",@split[$word_count];
			}
			else
			{
			 print DESTINATION @split[0],"\t",@split[1],"\t",@split[$word_count],"\n";
			}   
		}
	close (DESTINATION);
	$word_count++;
	seek(SOURCE,0,0);
	}

		
	
	
	