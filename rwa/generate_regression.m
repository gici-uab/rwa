% Generate response 
%-------------------------------------------------------------------------%
% Input: 	x  -   Predictors 
%		W  -   Regression coefficients
% 		order  -  Predictors order

% Output:   M   -  Estimate
%        
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function [M]=generate_regression(x,W,order)


V=[ones(size(x,1),1)];

for j=1:order
    V=[V, x.^j];
end

M=V*W;
