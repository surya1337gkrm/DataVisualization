close all;
clear;
clc;
load q1.mat;

branch={'Brighton & Hove','Chichester','Portsmouth','Southampton','Winchester'};
% outer_label={'Brighton & Hove',4483;'Chichester',4814;'Portsmouth',5407;'Southampton',3097;'Winchester',5602};
newData=zeros(27,3);
for i=1:5
    for j=1:27
       
        if(strcmp(char(branch(i)),char(q1{j,1}))==1)
           
            newData(j,i)=(q1{j,3});
        end
    end
end

branch_treemap = sum(newData);
rectangles = treemap(branch_treemap);
plotRectangles2(rectangles,branch);
outline(rectangles);

% labels=data(:,2);
branchIdx = findgroups(q1.Branch);
productGroupCount = splitapply(@(x){nonzeros(countcats(x))},q1.ProductGroup,branchIdx);
productGroupNames = splitapply(@(x){categories(removecats(x))},q1.ProductGroup,branchIdx);

% labels1={
%     {'Books','Electronics','Hardware','Software'};
%     {'Home&Garden','Health&Beauty','Sports','Software','Electronics','DIY'};
%     {'Books','Home&Garden','Electronics','DIY','Sports','Clothes','Toys&Children'};
%     {'DIY','Hardware','Electronics','Sports'};
%     {'Hardware','Sports','Books','Software','Toys&Children','Electronics'}
%     };
% 
% labels2={data(1:4,2);data(5:10,2);data(11:17,2);data(18:21,2);data(22:27,2)};

% for j = 1:5
%  
%     rNew = treemap(newData(:,j),rectangles(3,j),rectangles(4,j));
%     rNew(1,:) = rNew(1,:) + rectangles(1,j);
%     rNew(2,:) = rNew(2,:) + rectangles(2,j);
%         plotRectangles(rNew,labels);     
% end

m = 27; 
for j = 1:size(productGroupCount)
   
    rNew = treemap(productGroupCount{j}',rectangles(3,j),rectangles(4,j));
    rNew(1,:) = rNew(1,:) + rectangles(1,j);
    rNew(2,:) = rNew(2,:) + rectangles(2,j);
    plotRectangles(rNew,productGroupNames{j})
end

title('Nested Tree-map of Sales by Branch.')



