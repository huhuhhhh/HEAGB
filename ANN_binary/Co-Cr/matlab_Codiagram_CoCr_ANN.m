clear
clc

load("../ANN_netCo");

n = 20;
eqcolmn = ones(n,1)*0.2;
uneqcolmn = linspace(0.35,0.05,n)';
tempcolmn = ones(n,1)*1000;

% for i = 1:1:3
data_CoCr = [tempcolmn uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
%data_CoCr(((i*n+1):((i+1)*n)),:) = [tempcolmn+i*100 uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
data_CoCr(21:40,:) = [tempcolmn+100 uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
data_CoCr(41:60,:) = [tempcolmn+200 uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
data_CoCr(61:80,:) = [tempcolmn+300 uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn eqcolmn];

data_NiCr = [tempcolmn eqcolmn uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
data_NiCr(21:40,:) = [tempcolmn+100 eqcolmn uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
data_NiCr(41:60,:) = [tempcolmn+200 eqcolmn uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn];
data_NiCr(61:80,:) = [tempcolmn+300 eqcolmn uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn];

data_FeCr = [tempcolmn eqcolmn eqcolmn flip(uneqcolmn) uneqcolmn eqcolmn];
data_FeCr(21:40,:) = [tempcolmn+100 eqcolmn eqcolmn flip(uneqcolmn) uneqcolmn eqcolmn];
data_FeCr(41:60,:) = [tempcolmn+200 eqcolmn eqcolmn flip(uneqcolmn) uneqcolmn eqcolmn];
data_FeCr(61:80,:) = [tempcolmn+300 eqcolmn eqcolmn flip(uneqcolmn) uneqcolmn eqcolmn];

data_MnCr = [tempcolmn eqcolmn eqcolmn flip(uneqcolmn) eqcolmn uneqcolmn];
data_MnCr(21:40,:) = [tempcolmn+100 eqcolmn eqcolmn flip(uneqcolmn) eqcolmn uneqcolmn];
data_MnCr(41:60,:) = [tempcolmn+200 eqcolmn eqcolmn flip(uneqcolmn) eqcolmn uneqcolmn];
data_MnCr(61:80,:) = [tempcolmn+300 eqcolmn eqcolmn flip(uneqcolmn) eqcolmn uneqcolmn];

data_CoNi = [tempcolmn uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn eqcolmn];
data_CoNi(21:40,:) = [tempcolmn+100 uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn eqcolmn];
data_CoNi(41:60,:) = [tempcolmn+200 uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn eqcolmn];
data_CoNi(61:80,:) = [tempcolmn+300 uneqcolmn flip(uneqcolmn) eqcolmn eqcolmn eqcolmn];

data_CoFe = [tempcolmn uneqcolmn eqcolmn eqcolmn flip(uneqcolmn) eqcolmn];
data_CoFe(21:40,:) = [tempcolmn+100 uneqcolmn eqcolmn eqcolmn flip(uneqcolmn) eqcolmn];
data_CoFe(41:60,:) = [tempcolmn+200 uneqcolmn eqcolmn eqcolmn flip(uneqcolmn) eqcolmn];
data_CoFe(61:80,:) = [tempcolmn+300 uneqcolmn eqcolmn eqcolmn flip(uneqcolmn) eqcolmn];

data_CoMn = [tempcolmn uneqcolmn eqcolmn eqcolmn eqcolmn flip(uneqcolmn)];
data_CoMn(21:40,:) = [tempcolmn+100 uneqcolmn eqcolmn eqcolmn eqcolmn flip(uneqcolmn)];
data_CoMn(41:60,:) = [tempcolmn+200 uneqcolmn eqcolmn eqcolmn eqcolmn flip(uneqcolmn)];
data_CoMn(61:80,:) = [tempcolmn+300 uneqcolmn eqcolmn eqcolmn eqcolmn flip(uneqcolmn)];

data_NiFe = [tempcolmn eqcolmn uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn];
data_NiFe(21:40,:) = [tempcolmn+100 eqcolmn uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn];
data_NiFe(41:60,:) = [tempcolmn+200 eqcolmn uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn];
data_NiFe(61:80,:) = [tempcolmn+300 eqcolmn uneqcolmn eqcolmn flip(uneqcolmn) eqcolmn];

data_NiMn = [tempcolmn eqcolmn uneqcolmn eqcolmn eqcolmn flip(uneqcolmn)];
data_NiMn(21:40,:) = [tempcolmn+100 eqcolmn uneqcolmn eqcolmn eqcolmn flip(uneqcolmn)];
data_NiMn(41:60,:) = [tempcolmn+200 eqcolmn uneqcolmn eqcolmn eqcolmn flip(uneqcolmn)];
data_NiMn(61:80,:) = [tempcolmn+300 eqcolmn uneqcolmn eqcolmn eqcolmn flip(uneqcolmn)];

data_FeMn = [tempcolmn eqcolmn eqcolmn eqcolmn uneqcolmn flip(uneqcolmn)];
data_FeMn(21:40,:) = [tempcolmn+100 eqcolmn eqcolmn eqcolmn uneqcolmn flip(uneqcolmn)];
data_FeMn(41:60,:) = [tempcolmn+200 eqcolmn eqcolmn eqcolmn uneqcolmn flip(uneqcolmn)];
data_FeMn(61:80,:) = [tempcolmn+300 eqcolmn eqcolmn eqcolmn uneqcolmn flip(uneqcolmn)];
% end



y_CoCr_ANN = net(data_CoCr');
y_NiCr_ANN = net(data_NiCr');
y_FeCr_ANN = net(data_FeCr');
y_MnCr_ANN = net(data_MnCr');

y_CoNi_ANN = net(data_CoNi');
y_CoFe_ANN = net(data_CoFe');
y_CoMn_ANN = net(data_CoMn');

y_NiFe_ANN = net(data_NiFe');
y_NiMn_ANN = net(data_NiMn');
y_FeMn_ANN = net(data_FeMn');

Temp = data_CoCr(:,1);
Co_comp = data_CoCr(:,2);
% Ni_comp = data_up(:,3);
% Cr_comp = data_up(:,4);
% Fe_comp = data_up(:,5);
% Mn_comp = data_up(:,6);

figure(1)
%%%%%%post process figure(1) %%%%%%%%%%
[xData, yData, zData] = prepareSurfaceData(Co_comp, Temp, y_CoCr_ANN*100 );
ft = fittype( 'lowess' );
% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, 'Normalize', 'on' );
% Plot fit with data.
h=plot( fitresult, [xData, yData], zData);
%h=plot( fitresult, [xData, yData], zData,'style','contour');
h(2).MarkerSize = 0.000001;
zlabel ex_adsorp
grid off
shading interp
hold on
plotbrowser('off')
view( 0.5, 90.0 );
axis([0.05 0.35 1000 1300])
%axis([0.05 0.35 1000 1300])
%axis([min(Co_comp) max(Co_comp) 1000 1300])
caxis([-30 0])
% red-white-blue color map
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
mycolormap = flip(mycolormap);
colorbar;
colormap(mycolormap);
colorbar('off')

%axis([0.05 0.35 1000 1300])
xticks([0.05 0.15 0.25 0.35])

xlabel('\it{x}\rm (at%)')
ylabel('\it{T}\rm (K)')
title('ANN \it{\Gamma}\rm_{Co}')
text(0.25,1250,0,'Co\rightarrowCr','color','w')

set(gca,'fontsize',10,'fontweight','normal');
set(gca,'linewidth',1.5)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [1 1 2.5 2.3]);

print -dpng -r300 Co_Cr_diagramCo_ANN