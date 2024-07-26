% Fit regression model
% Inverse
%-------------------------------------------------------------------------%
% Input:    x   -  Predictors
%           y   -  Dependent variable

% Output:   M   -      Estimate
%           W   -     regression coefficients
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%



function [M W ]=fit_regression(x,y,order)


V=[ones(size(x,1),1)];

for j=1:order
    V=[V, x.^j];
end


W=pinv(V)*y;
M=V*W;


