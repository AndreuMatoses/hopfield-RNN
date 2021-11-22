# Hopfield-RNN
A discrete Hopefield recurrent neural network implementation in MATLAB for square sized binary pattersn :
- A cell can have a value of 1 (activated) or -1 (deactivated)
- All cells are connected to each other (except itself). The synaptic strength of the connections needs to be calculated to make the network recognize an “attractor” state
  - Using Hebbian learning rule
  - Other possibilities: Pseudo-inverse method
- Cells are updated in a pseudorandom sequence
- From a given initial state (pattern), the network should converge to the closest attractor state (patterns used to train)

## Algorithm
Patterns to remember are selected and stored in vector form (Vector of N neurons)

Weight matrix [N x N] is calculated from the stored patterns
- Hebbian learning rule 

  ![image](https://user-images.githubusercontent.com/92515278/142888955-46002085-5c70-41f6-8067-ea632acef662.png)

- Pseudo-inverse method 

  ![image](https://user-images.githubusercontent.com/92515278/142889018-75fc5887-a4a1-419f-8cc3-18e8a43b951a.png)
  
Initial pattern (Noisy, Partial, Mixed, …) is calculated with desired specifications
Neurons are updated starting from the initial pattern sequentially following random but constant update order, until the last N updates do not create any change (convergence)

![image](https://user-images.githubusercontent.com/92515278/142889258-0cc0686d-9638-42dc-b15e-afd5e97d6406.png)

### Function `animation(pattern, time_step, filename)`

This function makes an animation of the simulation

input : pattern -> pattern in vector form

### Function `W = hf_learn(patterns, learning_rule)`

This function implements the leaning rule (Hebbian, Pseudo-inverse)

inputs : patterns -> in vector form size [1, N, n_patterns], learning rule -> string, "hebbian"

### Function `[evolution, iter_to_converge]=hf_update(W,pat0)`

This function updates the neurons

inputs : W-> weight matrix NxN, pat0 -> initial pattern (vector)

### `hopfield_network`

This script is used to run the patterns plots and animations

### `hopfield_network_mixed_tests`

This script is used to run the mixed patterns animations

### `hopfield_network_partial_test`

This script is used to run the partial patterns animations

### Function `m = mixed_pattern(pattern_A, pattern_B, n_cells_A, n_cells_B)`

This function computes the mixed pattern with 4 cells from pattern 4 and 4 cells from pattern 1

inputs : pattern_A, pattern_B -> patterns in vector form

### Function `n = noisy_pattern(pattern,pattern_index,n_cells_A,n_cells_B)`

This function computes the noisy patterns

inputs : patterns -> patterns in vector form, pattern_index -> index of the main pattern, n_cells_A -> number of cells for main pattern, n_cells_B -> number of cells for remaining patterns

### Function `p = partial_pattern(pattern, pattern_index, n_cells)`

This function computes the partial patterns

inputs : pattern -> pattern in vector form, pattern_index -> index number of the pattern we want to select, n_cells = number of cells selected from the pattern

### Function `v=pattern2matrix(pattern)`

This function transform the vector pattern to matrix pattern

inputs : pattern -> pattern in vector form

### Function `pattern_plot(pattern,names)`
This function plot the different patterns

inputs : pattern -> pattern in vector form, names -> cell array with chars inside

### `patterns`

This script computes the basic patterns
