function [newdoc, start] = rmsk(fname1, fname2, print)

%human genes of interest from rmsk
fileid = fopen(fname1);

tline = fgets(fileid);
linenum = 0;
while ischar(tline)
    %disp(tline)
    for i=1:1:length(tline)-4
        temp = tline(i:1:i+3);
        if (strncmpi(temp,'sine',4) || strncmpi(temp,'line',4) || strncmpi(temp,'dna',3) || strncmpi(temp,'ltr',3))
            linenum = linenum + 1;
            newdoc{linenum} = tline;
        end
    end
    tline = fgets(fileid);
    
end
fclose(fileid);

%%
%mouse genes of interest from rmsk
fileid = fopen(fname2);

tline = fgets(fileid);
linenum = length(newdoc);
while ischar(tline)
    %disp(tline)
    for i=1:1:length(tline)-4
        temp = tline(i:1:i+3);
        if (strncmpi(temp,'sine',4) || strncmpi(temp,'line',4) || strncmpi(temp,'dna',3) || strncmpi(temp,'ltr',3))
            linenum = linenum + 1;
            newdoc{linenum} = tline;
        end
    end
    tline = fgets(fileid);
    
end
fclose(fileid);



%%
%%print interest genes (sine, line, dna, ltr) on one page, of both mouse
%%and human, from rmsk
if(print==1)
fname = sprintf('%s_genesofinterest.txt',fname1(1:4));
fid = fopen(fname,'wt');

for i = 1:1:length(newdoc)
    fprintf(fid, newdoc{i});
end
fclose(fid);
end
%%
%separate start and end newdoc info, to get just the start and end value
%nucleotides
start = NaN(length(newdoc),2);

for i = 1:1:length(newdoc)
    temp = strsplit(newdoc{i});
    start(i,1) = str2double(temp(7));
    start(i,2) = str2double(temp(8));
end


end
