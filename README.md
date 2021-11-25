# Hopfield-RNN implementation for Square sized patterns
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

## Some output examples
### Plots of Patterns
![Patterns](https://user-images.githubusercontent.com/46297629/143428532-ca719640-1393-4590-87fa-0ae0f3bc1b9f.jpg)

### Synaptic strength matrix (i.e weight matrix)
![image](https://user-images.githubusercontent.com/46297629/143427852-70233fe0-d60c-4697-9735-d5c24fcba5b6.png)

### Pattern complition animation
<img src="https://user-images.githubusercontent.com/46297629/143429375-a093bac9-c983-4250-97e9-15f336718f7a.gif" width="450"> <img src="https://user-images.githubusercontent.com/46297629/143430733-70e8af0e-188b-4b6d-be8d-c171d4f810d3.gif" width="450">

## Fucntions

 - `animation(pattern, time_step, filename)`. This function makes an animation of the simulation
> input : pattern -> pattern in vector form

 - `W = hf_learn(patterns, learning_rule)`. This function implements the leaning rule (Hebbian, Pseudo-inverse).
> inputs : patterns -> in vector form size [1, N, n_patterns], learning rule -> string, "hebbian"

 - `[evolution, iter_to_converge]=hf_update(W,pat0)`. This function updates the neurons following a pseudorandom sequence

inputs : W-> weight matrix NxN, pat0 -> initial pattern (vector)

 - `hopfield_network`. This script is used to run the patterns plots and animations

 - `hopfield_network_mixed_tests`. This script is used to run the mixed patterns animations

 - `hopfield_network_partial_test`. This script is used to run the partial patterns animations

 - `m = mixed_pattern(pattern_A, pattern_B, n_cells_A, n_cells_B)`. This function computes the mixed pattern with 4 cells from pattern 4 and 4 cells from pattern 1
> inputs : pattern_A, pattern_B -> patterns in vector form

 - `n = noisy_pattern(pattern,pattern_index,n_cells_A,n_cells_B)`. This function computes the noisy patterns
> inputs : patterns -> patterns in vector form, pattern_index -> index of the main pattern, n_cells_A -> number of cells for main pattern, n_cells_B -> number of cells for remaining patterns

 - `p = partial_pattern(pattern, pattern_index, n_cells)`. This function computes the partial patterns
> inputs : pattern -> pattern in vector form, pattern_index -> index number of the pattern we want to select, n_cells = number of cells selected from the pattern

 - `v=pattern2matrix(pattern)`. This function transform the vector pattern to matrix pattern
> inputs : pattern -> pattern in vector form

 - `pattern_plot(pattern,names)`. This function plot the different patterns
> inputs : pattern -> pattern in vector form, names -> cell array with chars inside

 - `patterns`. This script computes the basic patterns
