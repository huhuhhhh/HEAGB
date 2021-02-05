% clear
% clc

MCMD = imread('Co_Mn_Codiagram.png');
ML = imread('Co_Mn_Codiagram_ANN.png');

[ssimval, ssimmap] = ssim(ML,MCMD,'DynamicRange',3);
ssim_final = (ssimval-0.43)/0.57;
fprintf('The SSIM value of Co_Mn_Codiagram is %0.4f.\n',ssim_final);

MCMD = imread('Co_Mn_Crdiagram.png');
ML = imread('Co_Mn_Crdiagram_ANN.png');

[ssimval, ssimmap] = ssim(ML,MCMD,'DynamicRange',3);
ssim_final = (ssimval-0.43)/0.57;
fprintf('The SSIM value of Co_Mn_Crdiagram is %0.4f.\n',ssim_final);

MCMD = imread('Co_Mn_Disdiagram.png');
ML = imread('Co_Mn_Disdiagram_ANN.png');

[ssimval, ssimmap] = ssim(ML,MCMD,'DynamicRange',3);
ssim_final = (ssimval-0.43)/0.57;
fprintf('The SSIM value of Co_Mn_Disdiagram is %0.4f.\n',ssim_final);

MCMD = imread('Co_Mn_Fediagram.png');
ML = imread('Co_Mn_Fediagram_ANN.png');

[ssimval, ssimmap] = ssim(ML,MCMD,'DynamicRange',3);
ssim_final = (ssimval-0.43)/0.57;
fprintf('The SSIM value of Co_Mn_Fediagram is %0.4f.\n',ssim_final);

MCMD = imread('Co_Mn_Mndiagram.png');
ML = imread('Co_Mn_Mndiagram_ANN.png');

[ssimval, ssimmap] = ssim(ML,MCMD,'DynamicRange',3);
ssim_final = (ssimval-0.43)/0.57;
fprintf('The SSIM value of Co_Mn_Mndiagram is %0.4f.\n',ssim_final);

MCMD = imread('Co_Mn_Nidiagram.png');
ML = imread('Co_Mn_Nidiagram_ANN.png');

[ssimval, ssimmap] = ssim(ML,MCMD,'DynamicRange',3);
ssim_final = (ssimval-0.43)/0.57;
fprintf('The SSIM value of Co_Mn_Nidiagram is %0.4f.\n',ssim_final);

