function m = mixed_pattern(pattern_A, pattern_B, n_cells_A, n_cells_B)
% This function computes the mixed pattern with 4 cells from pattern 4 and
% 4 cells from pattern 1
% inputs : pattern_A, pattern_B -> patterns in vector form

N = sqrt(size(pattern_A,2));

% find the active elements from each pattern
active_elements_pattern_A = find(pattern_A == 1);
active_elements_pattern_B = find(pattern_B == 1);

% select randomly n_cells_A elements from the active elements of
% pattern_A
random_selection_A = active_elements_pattern_A(randperm(length(active_elements_pattern_A),n_cells_A));
% remove elements that are already taken from A selection in active set of
% pattern B
remove_B = setdiff(active_elements_pattern_B,random_selection_A); 
% select randomly n_cells_B elements from the new set
random_selection_B = remove_B(randperm(length(remove_B),n_cells_B));

% create the mixed pattern
m = -ones(1,N^2);
m(random_selection_A) = 1;
m(random_selection_B) = 1;
end