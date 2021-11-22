function [evolution, iter_to_converge]=hf_update(W,pat0)
% W-> weight matrix NxN
% pat0 -> initial pattern (vector)

N=size(W,1);

% pseudorandom order
cell_idx=randperm(N);
% cell_idx=1:N;
iter=1;

change=false(1,N);
state_updates=0;

while true
    
    for i=cell_idx
        Vin=pat0*W(:,i); % influence off all other cells
        pat_prev=pat0;
        if Vin>=0
            pat0(i)=1;
        else
            pat0(i)=-1;
        end
        evolution(:,:,iter)=pat0;
        cell_change=all(pat_prev==pat0);
        if ~cell_change
            state_updates=state_updates+1;
        end
        change=[cell_change change(1:end-1)];
        if all(change)
            fprintf("All neurons were updated without change, iter = %g, state updates = %g \n",iter-N,state_updates)
            iter_to_converge=iter-N;
            break;
        end
        iter=iter+1;
    end
    if all(change)
        break;
    end
end

end