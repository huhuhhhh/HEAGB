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
    
for i=1:1:length(Temp)
    
    if Temp(i) == 1000
        data_1000(num1,:) = data(i,:);
        num1 = num1 + 1;
    end
    
    if Temp(i) == 1100
        data_1100(num2,:) = data(i,:);
        num2 = num2 + 1;
    end
    
    if Temp(i) == 1200
        data_1200(num3,:) = data(i,:);
        num3 = num3 + 1;
    end
    
    if Temp(i) == 1300
        data_1300(num4,:) = data(i,:);
        num4 = num4 + 1;
    end
end


%% Fitting for DBAM models

%  define the linear expansion as a first-order approximation for GB
%  adsorption, which is the equation 11 in the main text


fy = @(b,X) (X(:,1)*b(1)+X(:,2)*b(2)+X(:,3)*b(3)+X(:,4)*b(4)+X(:,5)*b(5)).* exp(-b(6)/(8.61733E-5 * X(:,6)))';

X(:,1) = data(:,2); % Co composition
X(:,2) = data(:,3); % Ni composition 
X(:,3) = data(:,4); % Cr composition
X(:,4) = data(:,5); % Fe composition
X(:,5) = data(:,6); % Mn composition
X(:,6) = data(:,1); % Temperature

% Y is the targeting variable, which is GB disorder   
Y = data(:,12); 

% beta0 is the initial parameters for b1, b2, b3, b4, and b5   
beta0 = [0.5 0.5 0.5 0.5 0.2 0];

% Using Matlab non-linear fitting function to fit the parameters  
[beta,R,J,CovB,MSE,ErrorModelInfo] = nlinfit(X,Y,fy,beta0,'ErrorModel','combined');

% Displaying the non-linear fitting function to fit the parameters 
display(beta)
display(ErrorModelInfo)

% Estimating Y values using fitted parameters 
Y_fit = (X(:,1)*beta(1)+X(:,2)*beta(2)+X(:,3)*beta(3)+X(:,4)*beta(4)+X(:,5)*beta(5)).* exp(-beta(6)/(8.61733E-5 * X(:,6)))';

% Predict GB excess of disorder using fitted parameters
Y1 = (0.35*beta(1)+0.35*beta(2)+0.05*beta(3)+0.20*beta(4)+0.05*beta(5)).* exp(-beta(6)/(8.61733E-5 * 1000))';

% Calculate RMSE between DBAM and MC/MD simulations
RMSE = sqrt(mean((Y - Y_fit).^2));  % Root Mean Squared Error
display(RMSE)


%% parity plots for DBAM model vs MC/MD simulations 
figure(1)

% color for each elements
cocolor = [170 170 255]/255;
nicolor = [0 0 1];
crcolor = [0 230 0]/255;
fecolor = [0.9 0.6 0.5];
mncolor = [255 98 98]/255;

plot(disorder*100,Y_fit*100,'o','markersize',8,'color',[0.9 0.2 0.4],'markerfacecolor',[0.9 0.2 0.4])
hold on
plot([35 60],[35 60],'--','linewidth',1.5,'color',[0.5 0.5 0.5])
axis([35 55 35 55])
xlabel('MC/MD \it{\Gamma}\rm_{Disorder} (nm^{-2})')
ylabel('Predicted \it{\Gamma}\rm_{Disorder} (nm^{-2})')

xticks([35 40 45 50 55])
yticks([35 40 45 50 55])
%figure, plotresponse(targets,outputs)
%figure, ploterrcorr(errors)
%figure, plotinerrcorr(inputs,errors)
set(gca,'fontsize',16,'fontweight','normal');
set(gca,'linewidth',1.5)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [1 1 4 4]);


print -dpng -r300 Disorder_prediction_2

