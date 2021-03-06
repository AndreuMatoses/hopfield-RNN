clear all
close all;

% all patterns are square
double_res=false; % choose if use double resolution
run patterns.m
n_patterns=size(pattern,3);
N=size(pattern,2);
pattern_plot(pattern,{})

%% Learning
W_default = hf_learn(pattern,'hebbian');
% W_default = hf_learn(pattern,'pseudo-inverse');

exitatory_scaling=1;
inhibitory_scaling=1;
W=W_default;
W(W>=0)=W(W>=0)*exitatory_scaling;
W(W<0)=W(W<0)*inhibitory_scaling;

figure;
subplot(1,2,2)
h2=heatmap(W); %,'ColorLimits',[-0.15 .2])
colormap cool
title(['Scaled Weights, ex = ', num2str(exitatory_scaling) ,', inh = ',num2str(inhibitory_scaling)])
h2.XDisplayLabels = nan(size(h2.XDisplayData));
h2.YDisplayLabels = nan(size(h2.YDisplayData));

subplot(1,2,1)
h1=heatmap(W_default); %,'ColorLimits',[-0.15 .2])
colormap cool
title('Default Weights')
h1.XDisplayLabels = nan(size(h1.XDisplayData));
h1.YDisplayLabels = nan(size(h1.YDisplayData));

% limits=[min([h1.ColorLimits(1), h2.ColorLimits(1)]), max([h1.ColorLimits(2), h2.ColorLimits(2)])];
% h1.ColorLimits=limits;
% h2.ColorLimits=limits;

%% initial pattern

pat0=partial_pattern(pattern, 4, 4);
% pat0=mixed_pattern(pattern(:,:,1),pattern(:,:,4),4,4);
% pat0=noisy_pattern(pattern,4,7,8-7);
% pat0=pattern(:,:,4);

% pattern_plot(pat0,{'Noisy pattern 1'})

%% Update network
[pat_evolution,iter]=hf_update(W,pat0);

%% Animate results

animation(pat_evolution(:,:,1:iter+2),0,'KTH_animation_240_pseudoinverse');

plot_names=cellstr(num2str([iter-1:iter]','Iteration %g'));
plot_names{end+1}='Initial pattern';
plot_names={plot_names{[end 1:end-1]'}};

final_p=pat_evolution(:,:,iter-1:iter);
final_p(:,:,end+1)=pat0;
final_p=final_p(:,:,[end 1:end-1]);

figure;
pattern_plot(final_p,plot_names);
