data = csvread('winequality-red.csv', 1, 0); % Loading the dataset without header
TF = ismissing(data); % checking the missing data
sum(TF);
ndata = zscore(data);
plot(ndata); % checking data center so the mean of the data stands in the origin
[Loadings, Scores, EigenVals, T2, Explained, mu] = pca(ndata); % Simple PCA

%Computing the biplot
vbls = {'fixedAcidity', 'volatileAcidity', 'citricAcid', 'residualSugar',...
        'chlorides', 'freeSulfurDioxide', 'totalSulfurDioxide', 'density',...
        'pH', 'sulphates', 'alcohol', 'quality'};  % Labels for the variables
biplot(Loadings(:,1:2), 'Scores', Scores(:,1:2),...
     'VarLabels', vbls);
idx = find(cumsum(Explained)>95);

