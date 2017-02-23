function [comparisons, final_genes] = matching(tableintron,newdocmultiz,nucleomultiz,newdocrmsk,start)

%finding match between intron sequence and rmsk
count = 0;
for i = 1:1:length(tableintron)
    initial = tableintron(i,1);
    ending = tableintron(i,2);
    for j = 1:1:length(start)
        betini = start(j,1);
        betend = start(j,2);
        if(betini >= initial) && (betend <= ending)
            count = count + 1;
            nuclint(count,1) = betini;
            nuclint(count,2) = betend;
            genes{count} = newdocrmsk{j};
            
        end
    end
end

%%
%finding match between rmsk and multiz
if(exist('nuclint','var'))
    
index = 1;
count = 0;
for i = 1:1:length(nuclint)
    nuclbeg = nuclint(i,1);
    nuclend = nuclint(i,2);
    for j = 1:1:length(nucleomultiz)
       if(nucleomultiz(j) >= nuclbeg) && (nucleomultiz(j) <= nuclend)
           
           if(strncmpi(newdocmultiz(j),'s hg',4))
               comparisons(index) = newdocmultiz(j);
               comparisons(index+1) = newdocmultiz(j+1);
           else
               comparisons(index) = newdocmultiz(j);
               comparisons(index+1) = newdocmultiz(j-1);
           end
           index = index + 2;
           count = count + 1;
           final_genes{count} = genes{i};
       end
    end
end
end
end
