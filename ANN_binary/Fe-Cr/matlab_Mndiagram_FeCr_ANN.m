clear
clc

load("../ANN_netMn");

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

Temp = data_FeCr(:,1);
Fe_comp = data_FeCr(:,5);
% Ni_comp = data_up(:,3);
% Cr_comp = data_up(:,4);
% Fe_comp = data_up(:,5);
% Mn_comp = data_up(:,6);

figure(1)
%%%%%%post process figure(1) %%%%%%%%%%
[xData, yData, zData] = prepareSurfaceData(Fe_comp, Temp, y_FeCr_ANN*100 );
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
caxis([0 15])
% red-white-blue color map
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
colorbar;
colormap(mycolormap);
colorbar('off')

%axis([0.05 0.35 1000 1300])
xticks([0.05 0.15 0.25 0.35])

xlabel('\it{x}\rm (at%)')
ylabel('\it{T}\rm (K)')
title('ANN \it{\Gamma}\rm_{Mn}')
text(0.25,1250,20,'Fe\rightarrowCr','color','k')

set(gca,'fontsize',10,'fontweight','normal');
set(gca,'linewidth',1.5)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [1 1 2.5 2.3]);

print -dpng -r300 Fe_Cr_Mndiagram_ANN

% ax1 = gca;
% ax1_pos = ax1.Position; % position of first axes
% ax2 = axes('Position',ax1_pos,'XAxisLocation','top','YAxisLocation','right','Color','none');
% ax2.YTick = [];
% ax2.XTick = [0 0.1666 0.333 0.5 0.6667 0.833 1.0];
% ax2.XTickLabel = {'0.35', '0.3 ', '0.25 ', '0.2 ', '0.15 ', '0.1 ', '0.05'};

%plot(Cr_comp,Temp,'markersize',0.0001,'Parent',ax2)
% axis([min(Cr_comp) max(Cr_comp) 1000 1300])
% ylabel('')
% h=plot( fitresult, [xData, yData], zData,'Parent',ax2);
% %h=plot( fitresult, [xData, yData], zData,'style','contour');
% h(2).MarkerSize = 0.000001;
% zlabel ex_adsorp
% grid off
% shading interp
% hold on
% plotbrowser('off')
% view( 0.5, 90.0 );
% ax2.YTick = [];
% %axis([0.05 0.35 1000 1300])
% %axis([0.05 0.35 1000 1300])
% axis([min(Co_comp) max(Co_comp) 1000 1300])
% caxis([min(output_Cr*100) max(output_Cr*100)])


% x2 = 1:0.2:20;
% y2 = x2.^2./x2.^3;
% line(Cr_comp, Temp,'linewidth',0.00001,'Parent',ax2,'Color','k')

%axis off;

% % net = feedforwardnet(10);
% % [net, tr] = train(net,input,output_Cr);
% 
% x = input';
% t = output_Fe';
% 
% % Choose a Training Function
% % For a list of all training functions type: help nntrain
% % 'trainlm' is usually fastest.
% % 'trainbr' takes longer but may be better for challenging problems.
% % 'trainscg' uses less memory. Suitable in low memory situations.
% trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
% 
% % Create a Fitting Network
% hiddenLayerSize = 10;
% net = fitnet(hiddenLayerSize,trainFcn);
% 
% % Setup Division of Data for Training, Validation, Testing
% net.divideParam.trainRatio = 70/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 15/100;
% 
% % Train the Network
% [net,tr] = train(net,x,t);
% 
% % Test the overall Network using original data
% y_test = net(x);
% e = gsubtract(t,y_test);
% performance = perform(net,t,y_test);
% 
% %% extracting train, validate, test ID and NN prediction value
% train_id = tr.trainInd;
% test_id = tr.testInd;
% val_id = tr.valInd;
% 
% for i = 1:1:length(train_id)
% train_nn(i)=y_test(train_id(i));
% train_mcmd(i)=t(train_id(i));
% end
% for i = 1:1:length(test_id)
% test_nn(i)=y_test(test_id(i));
% test_mcmd(i)=t(test_id(i));
% end
% for i = 1:1:length(val_id)
% val_nn(i)=y_test(val_id(i));
% val_mcmd(i)=t(val_id(i));
% end
% 
% train_rmse = sqrt(mean((train_mcmd - train_nn).^2))*100;
% test_rmse = sqrt(mean((test_mcmd - test_nn).^2))*100;
% val_rmse = sqrt(mean((val_mcmd - val_nn).^2))*100;
% 
% %%
% % View the Network
% %view(net)
% 
% % Plots
% % Uncomment these lines to enable various plots.
% %figure, plotperform(tr)
% %figure, plottrainstate(tr)
% train_color = [0.9 0.6 0.12];
% val_color = [0.5 0.7 0.9];
% test_color = [0.5 0.2 0.5];
% 
% figure(1), plotregression(output_Fe,y_test)
% figure(2), 
% plot(train_mcmd*100,train_nn*100,'o','markersize',8,'color',train_color,'markerfacecolor',train_color)
% hold on 
% plot(val_mcmd*100,val_nn*100,'o','markersize',8,'color',val_color,'markerfacecolor',val_color)
% plot(test_mcmd*100,test_nn*100,'o','markersize',8,'color',test_color,'markerfacecolor',test_color)
% plot([-100 100],[-100 100],'--','linewidth',1.5,'color',[0.5 0.5 0.5])
% axis([-30 0 -30 0])
% xlabel('MC/MD \it{\Gamma}\rm_{Fe} (nm^{-2})')
% ylabel('ANN \it{\Gamma}\rm_{Fe} (nm^{-2})')
% 
% train_legend = ['Train (' num2str(train_rmse,'%.2f') ' nm^{-2})'];
% val_legend = ['Validation (' num2str(val_rmse,'%.2f') ' nm^{-2})'];
% test_legend = ['Test (' num2str(test_rmse,'%.2f') ' nm^{-2})'];
% 
% 
% legend(train_legend, val_legend, test_legend,'location',[0.39 0.82 0 0])
% legend boxoff
% xticks([-30 -25 -20 -15 -10 -5 0])
% yticks([-30 -25 -20 -15 -10 -5 0])
% %figure, plotresponse(targets,outputs)
% %figure, ploterrcorr(errors)
% %figure, plotinerrcorr(inputs,errors)
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.5)
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperUnits', 'inches');
% set(gcf, 'PaperPosition', [1 1 4 4]);
% 
% 
% print -dpng -r300 Fe_prediction