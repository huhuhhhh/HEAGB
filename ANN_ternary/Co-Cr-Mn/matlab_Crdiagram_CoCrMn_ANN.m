clear
clc

load("../ANN_netCr");

n = 100000;

comp_test(:,1) = 0.05+rand(n,1)*0.3; % Co
comp_test(:,2)  = ones(n,1)*0.2; % Ni
comp_test(:,3)  = 0.05+rand(n,1)*0.3; % Cr
comp_test(:,4)  = ones(n,1)*0.2; % Fe
comp_test(:,5)  = 0.6-comp_test(:,1)-comp_test(:,3); % Mn

%for i = 1:1:length(z)
n_test = 0;
for i = 1:1:size(comp_test,1)
    if comp_test(i,5) >= 0.05 && comp_test(i,5) <= 0.35
        n_test = n_test + 1;
        comp_final(n_test,:) = comp_test(i,:);
    end
end

%comp_final_T=ones(size(comp_final,1),6);
data_CoCrMn(:,1)=ones(size(comp_final,1),1)*1000;
data_CoCrMn(:,2:6) = comp_final;



y_CoCrMn_ANN = net(data_CoCrMn');
data_CoCrMn_extract(:,1)=(data_CoCrMn(:,2));
data_CoCrMn_extract(:,2)=(data_CoCrMn(:,4));
data_CoCrMn_extract(:,3)=(data_CoCrMn(:,6));

for i=1:1:size(data_CoCrMn_extract,1)
    data_CoCrMn_norm(i,:) = data_CoCrMn_extract(i,:)/sum(data_CoCrMn_extract(i,:));
end

figure(1)

mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
colorbar;
colormap(mycolormap);

% Plot the ternary axis system
[h,hg,htick] = terplot;
[hcont,ccont,hcb]=tersurf(data_CoCrMn_norm(:,1),data_CoCrMn_norm(:,2),data_CoCrMn_norm(:,3),y_CoCrMn_ANN'*100);
hlabels=terlabel('Co','Cr','Mn');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following modifications are not serious, just to illustrate how to
% use the handles:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8 0.8 0.8],'linewidth',1,'linestyle','--')
set(hg(:,2),'color',[0.8 0.8 0.8],'linewidth',1,'linestyle','--')
set(hg(:,1),'color',[0.8 0.8 0.8],'linewidth',1,'linestyle','--')

%--  Modify the labels
set(hlabels(3),'color','k','fontsize',20)
set(hlabels(2),'color','k','fontsize',20)
set(hlabels(1),'color','k','fontsize',20)

%--  Modify the tick labels
set(htick(:,3),'color','none','linewidth',0.75)
set(htick(:,2),'color','none','linewidth',0.75)
set(htick(:,1),'color','none','linewidth',0.75)

%--  Change the color of the patch
set(h,'facecolor',[1 1 1],'edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','w','ycolor','w')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')

caxis([0 50])
colorbar('off')


set(gca,'fontsize',10,'fontweight','normal');
set(gca,'linewidth',1.0)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [1 1 5 5]);

print -dpng -r300 CoCrMn_diagramCr_ANN