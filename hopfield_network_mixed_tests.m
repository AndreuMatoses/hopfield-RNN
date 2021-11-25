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

limits=[min([h1.ColorLimits(1), h2.ColorLimits(1)]), max([h1.ColorLimits(2), h2.ColorLimits(2)])];
% h1.ColorLimits=limits;
% h2.ColorLimits=limits;

%% initial pattern
n_cells=8;
accuracy_tableA=zeros(n_patterns,n_patterns);
accuracy_tableB=accuracy_tableA;
accuracy_table=accuracy_tableA;
iter_table=accuracy_tableA;
episodes=2000;
for n_patA=1:n_patterns
    for n_patB=1:n_patterns
        if n_patA ~= n_patB
        for episode=1:episodes
            
            %             pat0=partial_pattern(pattern, n_pat, n_cell);
            pat0=mixed_pattern(pattern(:,:,n_patA),pattern(:,:,n_patB),4,4);
            % pat0=noisy_pattern(pattern,4,7,8-7);
            % pat0=pattern(:,:,4);
            
            % pattern_plot(pat0,{'Noisy pattern 1'})
            
            %% Update network
            [pat_evolution,iter]=hf_update(W,pat0);
            
            %             if all(pat_evolution(:,:,end)==pattern(:,:,n_patA))
            %                 accuracy_tableA(n_patA,n_patB)=accuracy_tableA(n_patA,n_patB)+1/episodes;
            %                 iter_table(n_patA,n_patB)=iter_table(n_patA,n_patB)+iter;
            %             end
            %             if all(pat_evolution(:,:,end)==pattern(:,:,n_patB))
            %                 accuracy_tableB(n_patA,n_patB)=accuracy_tableB(n_patA,n_patB)+1/episodes;
            %                 iter_table(n_patA,n_patB)=iter_table(n_patA,n_patB)+iter;
            % end
            if all(pat_evolution(:,:,end)==pattern(:,:,n_patA)) || all(pat_evolution(:,:,end)==pattern(:,:,n_patB))
                accuracy_table(n_patA,n_patB)=accuracy_table(n_patA,n_patB)+1/episodes;
                iter_table(n_patA,n_patB)=iter_table(n_patA,n_patB)+iter;
            end
            if all(pat_evolution(:,:,end)==pattern(:,:,n_patA))
                accuracy_tableA(n_patA,n_patB)=accuracy_tableA(n_patA,n_patB)+1/episodes;
            end
            if all(pat_evolution(:,:,end)==pattern(:,:,n_patB))
                accuracy_tableB(n_patA,n_patB)=accuracy_tableB(n_patA,n_patB)+1/episodes;
            end
        end
        end
        
    end
end
% accuracy_table=accuracy_tableA+accuracy_tableB;
PAifAorB = accuracy_tableA./accuracy_table;
iter_table=iter_table./accuracy_table./episodes;

%% Animate results
animation(pat_evolution(:,:,1:iter+2),0.01,'1 cell completion');

plot_names=cellstr(num2str([iter-1:iter]','Iteration %g'));
plot_names{end+1}='Initial pattern';
plot_names={plot_names{[end 1:end-1]'}};

final_p=pat_evolution(:,:,iter-1:iter);
final_p(:,:,end+1)=pat0;
final_p=final_p(:,:,[end 1:end-1]);

figure;
pattern_plot(final_p,plot_names);



%% extra plots
% figure;
% n=1:100;
% C=n./(2*log2(n));
% plot(n,C)