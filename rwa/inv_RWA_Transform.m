% Regression Wavelet Analysis (RWA) 
% Forward
%-------------------------------------------------------------------------%
% Input:  raw_image   -    Transformed image in raw format 
%         z      - spectral channels
%         y      - lines
%         x      - columns
%         dtype  - 'int16' for integer signed 16 bits, 'uint16' for integer unsigned 16 bits, ... 
%         output - name of the recovered rawfile
%         sifile - side information in matlab format (.mat)
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function inv_RWA_Transform(raw_image,z,y,x,dtype,output,sifile)



fid=fopen(raw_image,'r');
G=fread(fid,y*x*z,'int16',0,'b');
RWAim = reshape(G,x*y,z);

l = ceil(log2(z));
%system(['lzma -d ' sifile ])
load(sifile);

im = inv_RWA(RWAim,l,W,1);

fid=fopen(output,'w');

fwrite(fid,im,dtype,0,'b');


fprintf('\n Transformed: %s \n size: (%u, %u, %u) \n Recovered: %s \n side information used: %s \n',raw_image,z,y,x,output,sifile);

