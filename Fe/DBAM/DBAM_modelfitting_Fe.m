clear
clc

%% Data extraction for GB segregation
data = xlsread('DBAM_data.csv','DBAM_data','G3:R1035');
data_diff = xlsread('DBAM_data.csv','DBAM_data','AG3:AK1035');
data(:,13:17) = data_diff; % calculated difference

Temp = data(:,1); % temperature 
Co_adp = data(:,7); % GB excess of Co adsorption
Ni_adp = data(:,8); % GB excess of Co adsorption
Cr_adp = data(:,9); % GB excess of Co adsorption
Fe_adp = data(:,10); % GB excess of Co adsorption
Mn_adp = data(:,11); % GB excess of Co adsorption
disorder = data(:,12); % GB excess of disorder

% Split dataset by different temperatures 
    num1 = 1;
    num2 = 1;
    num3 = 1;
    num4 = 1;
    
for i=1:1:length(Temp) % GB properties at 1000K 
    
    if Temp(i) == 1000
        data_1000(num1,:) = data(i,:);
        num1 = num1 + 1;
    end
    
    if Temp(i) == 1100 % GB properties at 1100K 
        data_1100(num2,:) = data(i,:);
        num2 = num2 + 1;
    end
    
    if Temp(i) == 1200 % GB properties at 1200K 
        data_1200(num3,:) = data(i,:);
        num3 = num3 + 1;
    end
    
    if Temp(i) == 1300 % GB properties at 1300K 
        data_1300(num4,:) = data(i,:);
        num4 = num4 + 1;
    end
end

%% Fitting for DBAM models

%  define the linear expansion as a first-order approximation for GB
%  adsorption, which is the equation 9 in the main text

fy = @(b,X) (X(:,1)*b(1)+X(:,2)*b(2)+X(:,3)*b(3)+X(:,4)*b(4)+X(:,5)*b(5)); 

X(:,1) = data(:,2); % Co composition
X(:,2) = data(:,3); % Ni composition 
X(:,3) = data(:,4); % Cr composition
X(:,4) = data(:,5); % Fe composition
X(:,5) = data(:,6); % Mn composition
X(:,6) = data(:,1); % Temperature

% Y is the targeting variable, which is Fe segregation  
Y = data(:,16);  

% beta0 is the initial parameters for b1, b2, b3, b4, and b5   
beta0 = [0.5 0.5 0.5 0.5 0.2];

% Using Matlab non-linear fitting function to fit the parameters  
[beta,R,J,CovB,MSE,ErrorModelInfo] = nlinfit(X,Y,fy,beta0,'ErrorModel','combined');

% Displaying the non-linear fitting function to fit the parameters 
display(beta)
display(ErrorModelInfo)

% Estimating Y values using fitted parameters 
Y_fit = (X(:,1)*beta(1)+X(:,2)*beta(2)+X(:,3)*beta(3)+X(:,4)*beta(4)+X(:,5)*beta(5));

% Predict GB excess of Co using the critical temperature, minimal disorder, and
% estimated Y (last step). All parameters can be obtained in Fig. 4g.
min_dis = 0.35;
Tc_fe = 1370;
slope_beta = -0.0075;

% Calculate GB excess of Fe via DBAM models
Y_Fe = (disorder-min_dis).*slope_beta.*(Tc_fe-Temp) - Y_fit;

% Calculate RMSE between DBAM and MC/MD simulations
RMSE_Fe = sqrt(mean((Fe_adp - Y_Fe).^2));  % Root Mean Squared Error
display(RMSE_Fe)

%% parity plots for DBAM model vs MC/MD simulations 
figure(1)

% color for each elements
cocolor = [170 170 255]/255;
nicolor = [0 0 1];
crcolor = [0 230 0]/255;
fecolor = [0.9 0.6 0.5];
mncolor = [255 98 98]/255;

% plot Gamma_Co predicted by DBAM vs MCMD simulations
plot(Fe_adp*100,Y_Fe*100,'o','markersize',8,'color',fecolor,'markerfacecolor',fecolor)
hold on
plot([-50 0],[-50 0],'--','linewidth',1.5,'color',[0.5 0.5 0.5])
axis([-50 0 -50 0])

% axis label
xlabel('MC/MD \it{\Gamma}\rm_{Fe} (nm^{-2})')
ylabel('Fitted \it{\Gamma}\rm_{Fe} (nm^{-2})')

% legend boxoff
xticks([-50 -40 -30 -20 -10 0])
yticks([-50 -40 -30 -20 -10 0])

% figure settings 
set(gca,'fontsize',12,'fontweight','normal');
set(gca,'linewidth',1.5)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [1 1 4 4]);


print -dpng -r300 Fe_prediction


% x = 1:70; 
% P1 = polyfit(data_1000(:,12)*100,data_1000(:,9)*100,1);
% yfit = P1(1)*x+P1(2);
% plot(x,yfit,'-.','color',[60 37 168]/255,'linewidth',1.5);
% axis([35 60 0 80])
% 
% P2 = polyfit(data_1100(:,12)*100,data_1100(:,9)*100,1);
% yfit = P2(1)*x+P2(2);
% plot(x,yfit,'-.','color',[33 147 234]/255,'linewidth',1.5);
% 
% 
% P3 = polyfit(data_1200(:,12)*100,data_1200(:,9)*100,1);
% yfit = P3(1)*x+P3(2);
% plot(x,yfit,'-.','color',[255 219 0]/255,'linewidth',1.5);
% 
% P4 = polyfit(data_1300(:,12)*100,data_1300(:,9)*100,1);
% yfit = P4(1)*x+P4(2);
% plot(x,yfit,'-.','color',[0.5 0 0],'linewidth',1.5);
% 
% xticks([35 40 45 50 55 60])
% xlabel('\it{\Gamma}\rm_{Disorder} (nm^{-2})')
% ylabel('\it{\Gamma}\rm_{Cr} (nm^{-2})')
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.2)
% 
% subplot(2,3,4)
% plot(0,0)
% hold on 
% scatter(disorder*100, Mn_adp*100, 20 ,Temp,'filled')
% 
% x = 1:70; 
% P1 = polyfit(data_1000(:,12)*100,data_1000(:,11)*100,1);
% yfit = P1(1)*x+P1(2);
% plot(x,yfit,'-.','color',[60 37 168]/255,'linewidth',1.5);
% axis([35 60 0 80])
% 
% P2 = polyfit(data_1100(:,12)*100,data_1100(:,11)*100,1);
% yfit = P2(1)*x+P2(2);
% plot(x,yfit,'-.','color',[33 147 234]/255,'linewidth',1.5);
% 
% 
% P3 = polyfit(data_1200(:,12)*100,data_1200(:,11)*100,1);
% yfit = P3(1)*x+P3(2);
% plot(x,yfit,'-.','color',[255 219 0]/255,'linewidth',1.5);
% 
% P4 = polyfit(data_1300(:,12)*100,data_1300(:,11)*100,1);
% yfit = P4(1)*x+P4(2);
% plot(x,yfit,'-.','color',[0.5 0 0],'linewidth',1.5);
% 
% axis([35 60 0 20])
% 
% xticks([35 40 45 50 55 60])
% xlabel('\it{\Gamma}\rm_{Disorder} (nm^{-2})')
% ylabel('\it{\Gamma}\rm_{Mn} (nm^{-2})')
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.2)
% 
% 
% subplot(2,3,2)
% plot(0,0)
% hold on 
% scatter(disorder*100, Fe_adp*100, 20 ,Temp,'filled')
% 
% x = 1:70; 
% P1 = polyfit(data_1000(:,12)*100,data_1000(:,10)*100,1);
% yfit = P1(1)*x+P1(2);
% plot(x,yfit,'-.','color',[60 37 168]/255,'linewidth',1.5);
% axis([35 60 0 80])
% 
% P2 = polyfit(data_1100(:,12)*100,data_1100(:,10)*100,1);
% yfit = P2(1)*x+P2(2);
% plot(x,yfit,'-.','color',[33 147 234]/255,'linewidth',1.5);
% 
% 
% P3 = polyfit(data_1200(:,12)*100,data_1200(:,10)*100,1);
% yfit = P3(1)*x+P3(2);
% plot(x,yfit,'-.','color',[255 219 0]/255,'linewidth',1.5);
% 
% P4 = polyfit(data_1300(:,12)*100,data_1300(:,10)*100,1);
% yfit = P4(1)*x+P4(2);
% plot(x,yfit,'-.','color',[0.5 0 0],'linewidth',1.5);
% 
% axis([35 60 -60 5])
% 
% xticks([35 40 45 50 55 60])
% xlabel('\it{\Gamma}\rm_{Disorder} (nm^{-2})')
% ylabel('\it{\Gamma}\rm_{Fe} (nm^{-2})')
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.2)
% 
% subplot(2,3,5)
% plot(0,0)
% hold on 
% scatter(disorder*100, Co_adp*100, 20 ,Temp,'filled')
% 
% x = 1:70; 
% P1 = polyfit(data_1000(:,12)*100,data_1000(:,7)*100,1);
% yfit = P1(1)*x+P1(2);
% plot(x,yfit,'-.','color',[60 37 168]/255,'linewidth',1.5);
% axis([35 60 0 80])
% 
% P2 = polyfit(data_1100(:,12)*100,data_1100(:,7)*100,1);
% yfit = P2(1)*x+P2(2);
% plot(x,yfit,'-.','color',[33 147 234]/255,'linewidth',1.5);
% 
% P3 = polyfit(data_1200(:,12)*100,data_1200(:,7)*100,1);
% yfit = P3(1)*x+P3(2);
% plot(x,yfit,'-.','color',[255 219 0]/255,'linewidth',1.5);
% 
% P4 = polyfit(data_1300(:,12)*100,data_1300(:,7)*100,1);
% yfit = P4(1)*x+P4(2);
% plot(x,yfit,'-.','color',[0.5 0 0],'linewidth',1.5);
% 
% axis([35 60 -40 5])
% 
% xticks([35 40 45 50 55 60])
% xlabel('\it{\Gamma}\rm_{Disorder} (nm^{-2})')
% ylabel('\it{\Gamma}\rm_{Co} (nm^{-2})')
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.2)
% 
% subplot(2,3,3)
% plot(0,0)
% hold on 
% scatter(disorder*100, Ni_adp*100, 20 ,Temp,'filled')
% axis([35 60 -8 1])
% 
% xticks([35 40 45 50 55 60])
% xlabel('\it{\Gamma}\rm_{Disorder} (nm^{-2})')
% ylabel('\it{\Gamma}\rm_{Ni} (nm^{-2})')
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.2)
% 
% subplot(2,3,6)
% 
% disfactor = [1000	3.8	0.64	-2.73	-1.67
% 1100	2.88	0.51	-2.109	-1.34
% 1200	1.48	0.33	-1.171	-0.695
% 1300	0.65	0.23	-0.539	-0.354];
% 
% cocolor = [170 170 255]/255;
% nicolor = [0 0 1];
% crcolor = [0 230 0]/255;
% fecolor = [0.9 0.6 0.5];
% mncolor = [255 98 98]/255;
% 
% plot(disfactor(:,1),disfactor(:,2),'p','color',crcolor,'markerfacecolor',crcolor,'markersize',9,'linewidth',1.5)
% hold on 
% plot(disfactor(:,1),disfactor(:,3),'>','color',mncolor,'markerfacecolor',mncolor,'markersize',8,'linewidth',1.5)
% plot(disfactor(:,1),disfactor(:,4),'<','color',fecolor,'markerfacecolor',fecolor,'markersize',8,'linewidth',1.5)
% plot(disfactor(:,1),disfactor(:,5),'o','color',cocolor,'markerfacecolor',cocolor,'markersize',8,'linewidth',1.5)
% 
% x = 1000:1400; 
% P1 = polyfit(disfactor(:,1),disfactor(:,2),1);
% yfit = P1(1)*x+P1(2);
% plot(x,yfit,'-.','color',crcolor,'linewidth',1.5);
% axis([35 60 0 80])
% 
% P2 = polyfit(disfactor(:,1),disfactor(:,3),1);
% yfit = P2(1)*x+P2(2);
% plot(x,yfit,'-.','color',mncolor,'linewidth',1.5);
% 
% P3 = polyfit(disfactor(:,1),disfactor(:,4),1);
% yfit = P3(1)*x+P3(2);
% plot(x,yfit,'-.','color',fecolor,'linewidth',1.5);
% 
% P4 = polyfit(disfactor(:,1),disfactor(:,5),1);
% yfit = P4(1)*x+P4(2);
% plot(x,yfit,'-.','color',cocolor,'linewidth',1.5);
% 
% 
% 
% axis([950 1400 -4 4.5])
% xticks([1000 1100 1200 1300 1400])
% plot([900 1450],[0 0],'k--')
% 
% xlabel('\it{T}\rm (K)')
% ylabel('d\it{\Gamma}\rm_{Seg}/d\it{\Gamma}\rm_{Disorder} (atom)')
% 
% set(gca,'fontsize',12,'fontweight','normal');
% set(gca,'linewidth',1.2)
% 
% 
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperUnits', 'inches');
% set(gcf, 'PaperPosition', [1 1 9.5 6]);
% 
% print -dpng -r300 disorder_factor3