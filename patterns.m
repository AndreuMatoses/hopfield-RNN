
% load kth_logos.mat
% patterns must be a square matrix
pattern_array(:,:,1) = [-1 -1 -1 -1 -1;-1 -1 1 -1 -1;-1 -1 1 -1 -1;-1 -1 1 -1 -1;1 1 1 1 1];
pattern_array(:,:,2) = [1 1 1 1 1;-1 -1 -1 -1 1;-1 -1 -1 -1 1;-1 -1 -1 -1 1;-1 -1 -1 -1 -1];
pattern_array(:,:,3) = [1 -1 -1 -1 -1;1 -1 -1 -1 -1;1 1 1 1 1;1 -1 -1 -1 -1;-1 -1 -1 -1 -1];
pattern_array(:,:,4) = [-1 -1 -1 -1 -1;-1 1 -1 -1 -1;-1 1 -1 1 -1;-1 1 1 1 1;-1 -1 -1 1 -1];
pattern_array(:,:,5) = [-1 -1 1 -1 -1;1 1 1 1 1;-1 -1 -1 -1 -1;1 -1 -1 -1 -1;-1 -1 -1 -1 1];
%   pattern_array(:,:,1) = KTHlogo_120;

% reshape it by columns (so transposed)

% Double resolution

if double_res
    for i=1:size(pattern_array,3)
        B=[1 1;1 1];
        pattern_array2x(:,:,i)=kron(pattern_array(:,:,i),B);
        % change all -1 by -1
    end
else
    pattern_array2x=pattern_array;
end

% Reshape to vector
pattern = reshape(pattern_array2x,[1,size(pattern_array2x,1)*size(pattern_array2x,2), size(pattern_array2x,3)]);


