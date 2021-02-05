clear
clc

%% extract GB data for ANN training
data_up = xlsread('ANN_data.csv','ANN_data','G3:R1034');

input = data_up(:,1:6); % input parameters are bulk compositions
output_Co = data_up(:,7); % GB excess of Co
output_Ni = data_up(:,8); % GB excess of Ni
output_Cr = data_up(:,9); % GB excess of Cr
output_Fe = data_up(:,10); % GB excess of Fe
output_Mn = data_up(:,11); % GB excess of Mn
output_disord  = data_up(:,12); % GB excess of disorder

x = input';
t = output_Mn';

%% Choose a Training Function for ANN
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

% Create a Fitting Network
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the overall Network using original data
y_test = net(x);
e = gsubtract(t,y_test);
performance = perform(net,t,y_test);

%% extracting train, validate, test ID and NN prediction value
train_id = tr.trainInd;
test_id = tr.testInd;
val_id = tr.valInd;

for i = 1:1:length(train_id)
train_nn(i)=y_test(train_id(i));
train_mcmd(i)=t(train_id(i));
end
for i = 1:1:length(test_id)
test_nn(i)=y_test(test_id(i));
test_mcmd(i)=t(test_id(i));
end
for i = 1:1:length(val_id)
val_nn(i)=y_test(val_id(i));
val_mcmd(i)=t(val_id(i));
end

% calculate RMSE for training, test, and validation sets
train_rmse = sqrt(mean((train_mcmd - train_nn).^2))*100;
test_rmse = sqrt(mean((test_mcmd - test_nn).^2))*100;
val_rmse = sqrt(mean((val_mcmd - val_nn).^2))*100;

%% Parity plots for ANN vs. MC/MD simulations 

%color for traning, test, and evaluation data
train_color = [0.9 0.6 0.12];
val_color = [0.5 0.7 0.9];
test_color = [0.5 0.2 0.5];

figure(1), plotregression(output_Mn,y_test)
figure(2), 
plot(train_mcmd*100,train_nn*100,'o','markersize',8,'color',train_color,'markerfacecolor',train_color)
hold on 
plot(val_mcmd*100,val_nn*100,'o','markersize',8,'color',val_color,'markerfacecolor',val_color)
plot(test_mcmd*100,test_nn*100,'o','markersize',8,'color',test_color,'markerfacecolor',test_color)
plot([-100 100],[-100 100],'--','linewidth',1.5,'color',[0.5 0.5 0.5])
axis([0 15 0 15])
xlabel('MC/MD \it{\Gamma}\rm_{Mn} (nm^{-2})')
ylabel('ANN \it{\Gamma}\rm_{Mn} (nm^{-2})')

train_legend = ['Train (' num2str(train_rmse,'%.2f') ' nm^{-2})'];
val_legend = ['Validation (' num2str(val_rmse,'%.2f') ' nm^{-2})'];
test_legend = ['Test (' num2str(test_rmse,'%.2f') ' nm^{-2})'];


legend(train_legend, val_legend, test_legend,'location',[0.39 0.82 0 0])
legend boxoff
xticks([0 5 10 15])
yticks([0 5 10 15])
set(gca,'fontsize',12,'fontweight','normal');
set(gca,'linewidth',1.5)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [1 1 4 4]);


netMn = net;
save netMn
print -dpng -r300 Mn_prediction