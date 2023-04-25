function linkImg_sub(figureNum,m,n,subfigureNumVec)
%
% Link images axis together

% Check how many figures should be linked together
N = length(subfigureNumVec);

figure(figureNum);
for i = 1:N
    eval(['h',num2str(i),'= subplot(',num2str(m), ',', num2str(n),',', num2str(subfigureNumVec(i)),');']);
%     a(i) = get(eval(['h',num2str(i)]),'CurrentAxes');
    a(i) = eval(['h',num2str(i)]);%get(eval(['h',num2str(i)]),'CurrentAxes');
end

linkaxes(a,'xy');

