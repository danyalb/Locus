clear all
close all
clc

%%
%set up

pwd = 'C:\Users\Danyal\Documents\University\bioinformatics\Locus';
addpath(genpath(pwd))

gene_name = 'test';

file = sprintf('%s\\%s',pwd,gene_name);
cd(file);

print = 1; %1 = yes, 0 = no

fname1 = sprintf('%shg.txt',gene_name);
fname2 = sprintf('%smm.txt',gene_name);

fnamemultiz = sprintf('%smultiz.txt',gene_name);
fnameknown = sprintf('%sknowngene.txt',gene_name);

fname_final = sprintf('%s_final.txt',gene_name);

%%
%receive intron sections
tableintron = knowngene(fnameknown,print); %%table of introns we care about

%%
%from multiz, receive just human and mouse sequence of interest
%from multiz, receive nucleotide numbers to check in rmsk
[newdocmultiz, nucleomultiz] = multiz(fnamemultiz,print); %%newdocmultiz is the hg and mm sequence, nucleomultiz is the nucleotide number

%%
%run rmsk data
[newdocrmsk, start] = rmsk(fname1, fname2, print);

%%
%matching
[comparisons, final_genes] = matching(tableintron,newdocmultiz,nucleomultiz,newdocrmsk,start);


%%
%%print final

fid = fopen(fname_final,'wt');
if(exist('comparisons','var'))
    
count = 0;
for i = 1:2:length(comparisons)
    count = count + 1;
    fprintf(fid, final_genes{count});
    fprintf(fid, comparisons{i});
    fprintf(fid, '%s \n', comparisons{i+1});
end
else
    fprintf(fid, 'no match');
end
fclose(fid);