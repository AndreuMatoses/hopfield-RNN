function m = mixed_pattern(pattern_A, pattern_B, n_cells_A, n_cells_B)
% This function computes the mixed pattern with 4 cells from pattern 4 and
% 4 cells from pattern 1
% inputs : pattern_A, pattern_B -> patterns in vector form

N = sqrt(size(pattern_A,2));

% find the active elements from each pattern
active_elements_pattern_A = find(pattern_A == 1);
active_elements_pattern_B = find(pattern_B == 1);

% interesection of patterns A and B
A_B_intersection = intersect(active_elements_pattern_A,active_elements_pattern_B);
A_prime = setdiff(active_elements_pattern_A,A_B_intersection);
B_prime = setdiff(active_elements_pattern_B,A_B_intersection);

if length(A_prime)<n_cells_A || length(B_prime)<n_cells_B
    error('not enougth distinct cells');
end
% select randomly n_cells_A elements from the active elements of
% pattern_A
random_selection_A = A_prime(randperm(length(A_prime),n_cells_A)); 
% select randomly n_cells_B elements from the new set
random_selection_B = B_prime(randperm(length(B_prime),n_cells_B));

% create the mixed pattern
m = -ones(1,N^2);
m(random_selection_A) = 1;
m(random_selection_B) = 1;
end