function clear_background_figure(ax,fh)
% clear_background_figure(gca,gcf)
% Set figure property to clear background
%% Example
% x = -1:0.05:1;
% y = -1:0.05:1;
% [X,Y]= meshgrid(x,y);
% surf(X,Y,X.^2-Y.^2)
% clear_background_figure(gca,gcf)
daspect([1,1,1]);
%　透明化設定
% ax =gca;
ax.XTickLabel= [];ax.YTickLabel= [];ax.ZTickLabel= [];
ax.XTick= [];ax.YTick= [];ax.ZTick= [];
ax.XAxis.Visible = 'off';ax.YAxis.Visible = 'off';ax.ZAxis.Visible = 'off'
ax.Color = 'none';

% fh = gcf;
fh.Color = 'none';
fh.InvertHardcopy='off';
print -dmeta -painters

fprintf("1. Edit> 'Copy Option'\n" + ...
    "2. Set 'clip board format' to 'Meta file'\n" +...
    "3. Select 'Copy Figure'\n");
end
