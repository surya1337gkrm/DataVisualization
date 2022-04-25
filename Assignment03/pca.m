function [pc,v] = pca(data)
%PCA Summary of this function goes here
%   Detailed explanation goes here
[M,N]=size(data);
mn=mean(data,2);
data=data-repmat(mn,1,N);
Y=data'/sqrt(N-1);
[u,S,pc]=svd(Y);
s=diag(S);
v=S.*S;

end

