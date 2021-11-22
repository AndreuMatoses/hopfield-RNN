function animation(pattern,time_step,filename)
% This function makes an animation of the simulation
% input : pattern -> pattern in vector form

n_patterns = size(pattern,3);

fig = figure;
set(gcf, 'color', 'w');
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 3;

for j=1:n_patterns
    % save the plots
    pattern_plot(pattern(:,:,j),{sprintf('Iteration %d', j)});
    ax = gca;
    ax.FontSize = 20;
    ax.LineWidth = 3;
    drawnow
    frame = getframe(fig);
    im{j} = frame2im(frame);
end
close;

% figure;
% for idx = 1:n_patterns
%     subplot(ceil(n_patterns/3),3,idx)
%     imshow(im{idx});
% end
% figure;
% imshow(im{end});

gif_folder='animation';
filename = fullfile(gif_folder,[filename '.gif']); % Specify the output file name
for idx = 1:n_patterns
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',time_step);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',time_step);
    end
end
fprintf('Gif *%s* created\n',filename)

end