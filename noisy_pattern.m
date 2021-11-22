function n = noisy_pattern(pattern,pattern_index,n_cells_A,n_cells_B)
% This function computes the noisy patterns
% inputs : patterns -> patterns in vector form, pattern_index -> index of
% the main pattern, n_cells_A -> number of cells for main pattern,
% n_cells_B -> number of cells for remaining patterns

N = sqrt(size(pattern,2));
n_patterns = size(pattern,3);

pattern_A = pattern(:,:,pattern_index); % main pattern

% find the active elements in pattern A and select randomly n_cells_A
% elements from those active elements
active_elements_pattern_A = find(pattern_A == 1);
random_selection_A = active_elements_pattern_A(randperm(length(active_elements_pattern_A),n_cells_A));

% compute the set of indexes remaining without pattern_index
remaining_index = setdiff(1:n_patterns,pattern_index);

% create a set with the remaining patterns (all patterns without the main
% pattern) and compute all the indexes of the active elements from this set
remaining_set = [];
for i=1:n_patterns-1
    remaining_pattern = pattern(:,:,remaining_index(i));
    active_set = find(remaining_pattern == 1);
    remaining_set = union(remaining_set,active_set); 
end

% remove the elements from the randomly selected active elements of
% pattern_A from the remaining set
remaining_set = setdiff(remaining_set,random_selection_A);

% select reandomly n_cells_B elements from the new remaining set
random_selection_B = remaining_set(randperm(length(remaining_set),n_cells_B));

% create the noisy pattern
n = -ones(1,N^2);
n(random_selection_A) = 1;
n(random_selection_B) = 1;
end