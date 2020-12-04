Directions for using LOCUS software

--------------------------------------------------------
1. Get Data from UCSC genome data
--------------------------------------------------------
create a folder with gene name.
add rmsk of both human and mouse. Name it 'gene'hg.txt and 'gene'mm.txt
add multiz of gene from human genome data. Name it 'gene'multiz.txt
add knowngene from human genome data. Name it 'gene'knowngene.txt

overall 4 files created in the gene folder.
--------------------------------------------------------

2. Open locus.m
--------------------------------------------------------
Change pwd to folder with the matlab files
Change gene_name to gene of interest.

Print = 0 to print just final result.
Print = 1 to print all intermediate data documents (slower).

run locus.m
--------------------------------------------------------


How the program works?
--------------------------------------------------------

knowngene function calculates the intron nucleotide values

multiz function creates a variable with just human and mouse information, as well as a variable with their nucleotide number.

rmsk functon creates a variable with transposons of interest lines from rmsk data (sine, line, dna, ltr). 

matching function compares the nucleotides, if rmsk data lines are part of the intron values, then if those are in multiz values. It creates the variables "comparison", interested sequences from multiz, and "final_gene",their corresponding rmsk data line. 

locus is the overall program that calls all the functions and prints final text document to match by eye. 

--------------------------------------------------------

Made by Danyal Bhutto
