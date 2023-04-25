function [] = maxfig(fig_no)

figure(fig_no);
s=get(0,'ScreenSize'); set(gcf,'Position',[s]+[5 45 -5 -125]);