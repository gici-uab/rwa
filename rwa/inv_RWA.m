% Regression Wavelet Analysis (RWA) 
% Inverse
%-------------------------------------------------------------------------%
% Input:  im   -    image 
%         l    -    level
%         n    -     order
%	  WW   -    Regression coefficients
% Output:   im   - Recovered image    
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function [im]=inv_RWA(im,l,WW,n)




[y z]=size(im);



fijo=[];
data=im;

for i=1:l
    
    p=ceil(z/2);
    q=floor(z/2);
    P(i)=p;
    Q(i)=q;
    
    z=p;
end


for i=l:-1:1
    
    
    p=P(i);
    q=Q(i);
    
    L=data(:,1:p);
    H=data(:,p+1:p+1+q-1);

    

    w=WW{i};
    aux=inv_RWA1l(L,H,w,n);
    data(:,1:p+q)=aux;
    
    
end

im=data;


function [im]=inv_RWA1l(L,H,w,n)


 %%% Regression
    
% n=1;
    
[M]=generate_regression([L],w,n);

H=H+round(M);
       
%     %%%%%%%%%%%%%

q=size(H,2);
p=size(L,2);
z=p+q;

im=zeros(size(L,1),z);


for j=1:q
    
    
    im(:,2*j) = L(:,j)-floor(H(:,j)/2);
    
    im(:,2*j-1) = im(:,2*j)+H(:,j); 
    
    
end


if mod(z,2)~=0
    
    im(:,2*q+1) = L(:,p);
    
else
    
    
end
 
end


end
