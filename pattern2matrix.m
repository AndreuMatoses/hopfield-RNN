
function v=pattern2matrix(pattern)
% This function transform the vector pattern to matrix pattern
% inputs:
% pattern -> pattern in vector form

N = sqrt(size(pattern,2)); % pattern matrix dimension
n_patterns = size(pattern,3); % number of patterns
new_size = [N,N,n_patterns];
v = reshape(pattern,new_size);
end