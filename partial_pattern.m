function p = partial_pattern(pattern, pattern_index, n_cells)
% This function computes the partial patterns
% inputs : pattern -> pattern in vector form, pattern_index -> index number
% of the pattern we want to select, n_cells = number of cells selected from 
% the pattern

N = sqrt(size(pattern,2));
n_patterns = size(pattern,3);

pattern = pattern(:,:,pattern_index); % selected pattern
% find the active elements in the pattern and select randomly n_cells
% elements from those active elements
active_elements_pattern = find(pattern == 1);
random_selection = active_elements_pattern(randperm(length(active_elements_pattern),n_cells));

% create the partial pattern
p = -ones(1,N^2);
p(random_selection) = 1;
end