function W = hf_learn(patterns,learning_rule)
% patterns -> in vector form size [1, N, n_patterns]
% learning rule -> string, "hebbian",

N=size(patterns,2);
n_patterns=size(patterns,3);

W=zeros(N);

if learning_rule == "hebbian"
    for i=1:N
        for j=1:N
            if j~=i % same neuron conexion is 0
                for k=1:n_patterns
                    x = patterns(1,:,k);
                    W(i,j)=W(i,j) + 1/N*x(i)*x(j); % + 1 if x(i)=x(j), -1 else
                end
            end
        end
    end
elseif learning_rule == "pseudo-inverse"
    % importnant that all patterns are linearly independent
%     X=zeros(1:N,n_patterns);
    for i=1:n_patterns
        X(:,i)=patterns(1,:,i)';
    end
%     W=X*(X'*inv(X))*X'
    W=X*pinv(X);
    
else
    error('No learning specified')
end


end