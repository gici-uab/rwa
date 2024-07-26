% Regression Wavelet Analysis (RWA) 
% Forward
%-------------------------------------------------------------------------%
% Input:  raw_image   -    Orginal image in raw format 
%         z      - spectral channels
%	  y      - lines
%	  x	 - columns
%	  dtype  - 'int16' for integer signed 16 bits, 'uint16' for integer unsigned 16 bits, ... 
%	  output - name of the output rawfile
%    
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%




function     RWA_Transform(raw_image,z,y,x,dtype,output)



fid=fopen(raw_image,'r');
G=fread(fid,y*x*z,dtype,0,'b');
im = reshape(G,x*y,z);

l = ceil(log2(z));
[RWAim W] = RWA(im,l,1); 

fid=fopen(output,'w');

fwrite(fid,RWAim,'int16',0,'b');

sifile = [output '_SI.mat'];

save(sifile,'W');

fprintf('\n Image: %s \n size: (%u, %u, %u) \n Transformed: %s \n side information: %s \n',raw_image,z,y,x,output,sifile);





