#!/usr/bin/perl
#This script converts a PED file into a PHY file for phylogenetic inference
#By Chris Organ, Sept 14th, 2010
#
#STRUCTURE
#Open data file
#Remove spaces - PED files are space delimited
#Remove columns 2-6 (Individ ID, Pat ID, Mat ID, Sex, Pheno)
#PED files have diploid data. Recode for presence or absence on either chromosome, so 0 for both=0, 1 for both or either=1
#Convert to PHY format: Insert taxon count and character count on line 1
#Save

#Open data file whose name is given in the first argument on the command
# line, assigning to a file handle PEDFILE (it is customary to choose
# all-caps names for file handles in Perl); file handles do not have any
# prefixing punctuation
	( $ped_source, $ped_dest ) = @ARGV;
	$usage = "perl Convert.ped.to.phylotab.pl source_file destination_file";
	unless ( $ped_source && $ped_dest )
	{ die "\nUsage: $usage\n" };
	open( SOURCE, "$ped_source" ) or die 
	"Couldn't find the source file $ped_source!\n";
	
#Remove spaces - PED files are space delimited
	$line_count = 0;
	$word_count = 0;
	while ($line = <SOURCE>) {
	   $line_count++;
	   # break $line into names and data, array names must begin with @
	   @predata = split(' ', $line);    
	   @name = shift @predata;
	   #Separates phenotype
	   $pheno = @predata[4];
	   #Deletes name and phenotype
	   delete @predata[0..4];
	   #Combine alleles together
	   @data = join("",@predata);
	   $datastring = @data[0];
	   $datastring =~ s/(..)/$1 /g;
	   #Translate Plink format to binary format for phylogenetic analysis. Note that Plink:1=minor allele, My file:0=minor allele
		$datastring =~ s/00/?/g;
		$datastring =~ s/11/0/g;
		$datastring =~ s/12/1/g;
		$datastring =~ s/21/1/g;
		$datastring =~ s/22/2/g;
		$datastring =~ s/ //g;		
	  #FASTA Format
	  open (DESTINATION,">>$ped_dest") or die
	  "Couldn't create the destination file $seq_dest!\n";
	  # The "*" is a place holder to separate phenotype from the data
	  print DESTINATION ">",@name,"\n",$pheno,"*",$datastring,"\n";    
	}
	close ( DESTINATION );
		
	
	
	