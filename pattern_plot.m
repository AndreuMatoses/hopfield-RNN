function pattern_plot(pattern,names)
% This function plot the different patterns
% inputs:
% pattern -> pattern in vector form, names -> cell array with chars inside
% outputs:

N = sqrt(size(pattern,2));
n_patterns = size(pattern,3);
pattern_plot = pattern2matrix(pattern);

if isempty(names)
    for i=1:n_patterns
        names{i}=['Pattern ' num2str(i)];
    end
end

for i=1:n_patterns
    subplot(1,n_patterns,i);
    imagesc(pattern_plot(:,:,i));
    grid on;
    ax = gca;
    ax.GridAlpha = 1;
    ax.GridColor = 	[0 0 0];
    title(names{i});
    set(gca,'xtick',[1.5:N+0.5]);
    set(gca,'ytick',[1.5:N+0.5]);
    set(gca,'xticklabel',{[]});
    set(gca,'yticklabel',{[]});
end

end