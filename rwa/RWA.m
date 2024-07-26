% Regression Wavelet Analysis (RWA) 
% Forward
%-------------------------------------------------------------------------%
% Input:  im   -    image 
%	  l    -    level
%	  n    -     order. Default n=1

% Output:   pim   - Transformed image
%           WW    -  Regression coefficients    
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
% See: "http://ieeexplore.ieee.org/document/7487041/?arnumber=7487041"
%-------------------------------------------------------------------------%


function [pim,WW]=RWA(im,l,n)


[y z]=size(im);


    
    L=[];
    H=[];
    data=im;
    fijo=[];
    for i=1:l

        [L,H,w,mse]=RWA1l(data,n);
        WW{i}=w;
	MSE(i)=mse;
        fijo=[H,fijo];
        data=L;
    end
    pim=[L,fijo]; 




function [L,H,w,mse]=RWA1l(im,n)



[y z]=size(im);

p=round(z/2);
q=floor(z/2);

H=zeros(y,q);
L=zeros(y,p);


for j=1:q
    
    
    H(:,j)=im(:,2*j-1)-im(:,2*j);
    
    L(:,j)=im(:,2*j)+floor(H(:,j)/2);
    
end

if mod(z,2)~=0
    
    L(:,p)=im(:,end);
end



% regrerssion

%   n=1;
    
   [M w]=fit_regression([L],H,n);
    
    mse=(sum(M(:)-H(:)).^2)/size(H,1)/size(H,2);    
    H=H-round(M);

end

end
