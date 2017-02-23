function [newdoc,start] = multiz(fnamemultiz,print)

fileid = fopen(fnamemultiz);

tline = fgets(fileid);
linenum = 0;
while ischar(tline)
    %disp(tline)
    
    tline = fgets(fileid);
    if (strncmp(tline,'s hg',4) || strncmp(tline,'s mm',4))
        linenum = linenum + 1;
        newdoc{linenum} = tline;
    end
end
fclose(fileid);

if(print==1)
fname = sprintf('%sofhg&mm.txt',fnamemultiz(1:length(fnamemultiz)-4));
fid = fopen(fname,'wt');

for i = 1:1:length(newdoc)
    fprintf(fid, newdoc{i});
end
fclose(fid);
end

start = NaN(length(newdoc),1);
for i = 1:1:length(newdoc)
    
    temp = strsplit(newdoc{i});
    start(i) = str2double(temp(3));
    
end

end