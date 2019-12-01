clear all;
data = csvread('example2.dat');
% figure,
% hold on;
% for i = 1:size(data)
%    plot(data(i, 1), data(i, 2), 'g+');
% end
% hold off;
% grid on;
affinity = CalculateAffinity(data);
figure,
plot(affinity);
row_sum = sum(affinity, 2);
D = diag(row_sum);
for i=1:size(affinity,1)
    for j=1:size(affinity,2)
        L(i,j) = affinity(i,j) / (sqrt(D(i,i)) * sqrt(D(j,j)));  
    end
end
[eigVectors,eigValues] = eig(L);
% figure,
% plot(eigValues);
k = 7;
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
    elseif index(i,1) == 3
        plot(data(i,1),data(i,2),'r+');
    elseif index(i,1) == 4
        plot(data(i,1),data(i,2),'y+');
    elseif index(i,1) == 5
        plot(data(i,1),data(i,2),'b+');
    elseif index(i,1) == 6
        plot(data(i,1),data(i,2),'c+');
    else
        plot(data(i,1),data(i,2),'black+');
    end
end
hold off;
title('Clustering Results using K-means');
grid on;


