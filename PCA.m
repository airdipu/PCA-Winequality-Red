data = csvread('winequality-red.csv', 1, 0); % Loading the dataset without header
TF = ismissing(data); % checking the missing data
sum(TF);
ndata = zscore(data); % Standaraization 
plot(ndata); % checking data center so the mean of the data stands in the origin
[Loadings, Scores, EigenVals, T2, Explained, mu] = pca(ndata); % Simple PCA

%Computing the biplot
vbls = {'fixedAcidity', 'volatileAcidity', 'citricAcid', 'residualSugar',...
        'chlorides', 'freeSulfurDioxide', 'totalSulfurDioxide', 'density',...
        'pH', 'sulphates', 'alcohol', 'quality'};  % Labels for the variables
biplot(Loadings(:,1:2), 'Scores', Scores(:,1:2),...
     'VarLabels', vbls);
idx = find(cumsum(Explained)>95);
% Recomputation having the number of components
[Loadings2, Scores2] = pca(ndata, 'NumComponents', 6);

% Some predictors are more important than others
[rows, cols] = size(ndata);
weights = ones(cols,1);
weight(3) = 18;
[Loadings3, Scores3] = pca(ndata, 'VariableWeights', weights);

% ploting the T2 value
figure;
a = 1:length(T2);
plot(a, T2); % To identify the outliers
xlabel('Sample');
ylabel('T square scores')

