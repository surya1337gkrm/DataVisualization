clear;
close all;
clc;

imagefiles=dir('.\places\Images\*.jpg');
len=length(imagefiles);
imageData=zeros(64*64,len);

for i=1:len
    img=imread(strcat('.\places\Images\',imagefiles(i).name));
    img=imresize(img,[64,64]);
    img=im2gray(img); 
    imageData(:,i)=img(:);
end

testfiles=dir('.\places\Test\*.jpg');
testlen=length(testfiles);
testData=zeros(64*64,testlen);

for i=1:testlen
    img=imread(strcat('.\places\Test\',testfiles(i).name));
    img=imresize(img,[64,64]);
    img=im2gray(img); 
    testData(:,i)=img(:);
end

%f=1;
% problem b
for j=1:testlen
    distMat=zeros(1,len);
    for i=1:len
        dist=sqrt(sum((testData(:,j)-imageData(:,i)).^2));
        distMat(i)=dist;      
    end
    minDist=min(distMat);
    minIndex=find(distMat==minDist);
    figure;
    subplot(1,2,1);
    limg=imread(strcat('.\places\Test\',testfiles(j).name));
    imshow(limg);
    title(testfiles(j).name);
    subplot(1,2,2);
    rimg=strcat('.\places\Images\',imagefiles(minIndex).name);
    imshow(rimg);
    title(strcat('Match for',{' '},testfiles(j).name));
    %f=f+2;    
end

% problem c
[PC, V] = pca(imageData);
PC = PC(:,1:40);

figure;
for i= 1:40
    subplot(8,5,i);
    temp = reshape(PC(:,i),[64 64]);
    imshow(temp,[]);
end
sgtitle('First 20 Eigen-Vectors obtained from PCA');

% problem d
testpca=zeros(40,testlen);
testrecover=zeros(4096,testlen);

for i=1:testlen
    im_test= imread(strcat('.\places\Test\',testfiles(i).name));
    im_test= im2gray(im_test);
    im_test= im2double(im_test);
    im_test= imresize(im_test,[64,64]);
    im_test= im_test(:)';
    
    im_pca= im_test*PC;
    
    im_recover= im_pca*PC';
    im_recover= reshape(im_recover,[64 64]);
    im_pca=im_pca';
    testpca(:,i)=im_pca(:);
    testrecover(:,i)=im_recover(:);
    
end

imagespca=zeros(40,len);
imagesrecover=zeros(4096,len);

for i=1:len
    im_test= imread(strcat('.\places\Images\',imagefiles(i).name));
    im_test= im2gray(im_test);
    im_test= im2double(im_test);
    im_test= imresize(im_test,[64,64]);
    im_test= im_test(:)';
    
    im_pca= im_test*PC;
    im_recover= im_pca*PC';
    im_pca=im_pca';
    imagespca(:,i)=im_pca(:);
    imagesrecover(:,i)=im_recover(:);
end


for j=1:testlen
    
    distMat=zeros(1,len);
    for i=1:len
        dist=sqrt(sum((testpca(:,j)-imagespca(:,i)).^2));
        distMat(i)=dist;      
    end
    minDist=min(distMat);
    minIndex=find(distMat==minDist);
    figure('Name','Using PCA');
    subplot(1,2,1);
    limg=imread(strcat('.\places\Test\',testfiles(j).name));
    imshow(limg);
    title(testfiles(j).name);
    subplot(1,2,2);
    rimg=imread(strcat('.\places\Images\',imagefiles(minIndex).name));
    imshow(rimg);
    title(strcat('Match for',{' '},testfiles(j).name, ...
        {' '},':',{' '},imagefiles(minIndex).name));
    %f=f+2;    
    lpcimg=reshape(testrecover(:,j),[64,64]);
    rpcimg=reshape(imagesrecover(:,minIndex),[64,64]);
    figure('Name','Principal Component Comparision');
    subplot(1,2,1);
    imshow(lpcimg,[])
    title(strcat('PC of',{' '}, testfiles(j).name));
    subplot(1,2,2);
    imshow(rpcimg,[])
    title(strcat('PC of',{' '},imagefiles(minIndex).name));

end

% problem-e
imagespca5=zeros(10,5);
for i=1:testlen
    im_test= imread(strcat('.\places\Test\',testfiles(i).name));
    im_test= im2gray(im_test);
    im_test= im2double(im_test);
    im_test= imresize(im_test,[64,64]);
    im_test= im_test(:)';
    
    im_pca= im_test*PC(:,1:10);
    im_pca=im_pca';
    imagespca5(:,i)=im_pca(:);   
end
figure;
spider_plot(imagespca5');
legend('test1','test2','test3','test4','test5');

% figure;
% h=parallelcoords(imagespca5,'Group',{'PC1','PC2','PC3','PC4','PC5'});

imagefiles=dir('./places/Images/*.jpg');
len=length(imagefiles);

% testfiles=dir('.\places\Test\*.jpg');
% testlen=length(testfiles);

% problem(a)
imageData=zeros(32*32,len);
% testData=zeros(32*32,testlen);

for i=1:len
    img=imread(strcat('./places/Images/',imagefiles(i).name));
    img=imresize(img,[32,32]);
%     img=im2gray(img); 
    imageData(:,i)=img(:);
end

[idx,C]=kmeans(imageData',4,'Distance','sqeuclidean');
% disp(C)
figure;

ptsymb={'bs','g^','md','go','c+'};
% for i=1:4
%     clust=find(idx==i);
% %     plot(imageData(clust,1),imageData(clust,2),ptsymb{i},'LineWidth',2);
%     hold on;
% end
for i=1:4
subplot(1,4,i);
imshow(reshape(C(i,:),[32,32]),[]);
end

% plot3(C(:,1),C(:,2),C(:,3),'rx','MarkerSize',15,'Linewidth',5);
% title('Fisher"s Iris Data');
% xlabel('Sepal Length (cm)');
% ylabel('Sepal Width (cm)');
hold off;

