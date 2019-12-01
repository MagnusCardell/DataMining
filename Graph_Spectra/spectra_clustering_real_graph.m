clear all;
data = csvread('example1.dat');
affinity = CalculateAffinity(data);
row_sum = sum(affinity, 2);
D = diag(row_sum);
for i=1:size(affinity,1)
    for j=1:size(affinity,2)
        L(i,j) = affinity(i,j) / (sqrt(D(i,i)) * sqrt(D(j,j)));  
    end
end
[eigVectors,eigValues] = eig(L);
k = 3;
X = eigVectors(:,(size(eigVectors,1)-(k-1)): size(eigVectors,1));

for i = 1:size(X, 1)
    temp = sqrt(sum(X(i,:).^2));
    Y(i,:) = X(i,:)./temp; 
end

[index, clustering] = kmeans(Y,k); 
figure,
hold on;
for i=1:size(index,1)
    if index(i,1) == 1
        plot(data(i,1),data(i,2),'m+');
    elseif index(i,1) == 2
        plot(data(i,1),data(i,2),'g+');
    else
        plot(data(i,1),data(i,2),'b+');        
    end
end
hold off;
title('Clustering Results using K-means');
grid on;


