function [tableintron] = knowngene(fnameknown,print)

fileid = fopen(fnameknown);

tline = fgets(fileid);
newdoc{1} = fgets(fileid);


fclose(fileid);

string1 = strsplit(newdoc{1});

code1 = string1(9);
str1 = char(code1);
val1 = strsplit(str1,',');
for i = 1:1:length(val1)
    exonstart(i) = str2double(val1(i));
end

code2 = string1(10);
str2 = char(code2);
val2 = strsplit(str2,',');  %now val1 and val2 have cells with start and end of exons as int
for i = 1:1:length(val2)
    exonend(i) = str2double(val2(i));
end

for i = 1:1:length(exonstart)-1
    for j = 1:1:2
        if (j==1)
            table(i,j) = exonstart(i);
        else
            table(i,j) = exonend(i);        
        end
    end
end

for i=1:1:length(table)-1
    tableintron(i,1) = table(i,2)+1;
    tableintron(i,2) = table(i+1,1)-1;
end

if(print==1)
fnameknown2 = sprintf('%sintron.txt',fnameknown(1:length(fnameknown)-4));
fid = fopen(fnameknown2,'wt');

for i = 1:1:length(tableintron)
    temp = sprintf('%d %d \n', tableintron(i,1), tableintron(i,2));
    fprintf(fid, temp);
end
fclose(fid);
end
end

