# Hopfield-RNN
A discrete Hopefield recurrent neural network implementation in MATLAB :
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
