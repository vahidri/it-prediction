function  [ parameters, costHistory ] = gd( x, y, parameters, learningRate, repetition )
dbg = false;
dbg_step = 1000;
%gradient descent implemetation
%   Detailed explanation goes here

% Getting the length of our dataset
m = length(y);

% Creating a matrix of zeros for storing our cost function history
costHistory = typecast(zeros(repetition, 1),'double');
parCount = length(parameters); %should be n+1 for linear regression

% Running gradient descent
for i = 1:repetition
    % Calculating the transpose of our hypothesis
    h = (x * parameters - y)';
    % Updating the parameters
    for j = 1:parCount
        parameters(j) = parameters(j) - learningRate * (1/m) * h * x(:, j);
    end
    
    % Keeping track of the cost function
    costHistory(i) = cost(x, y, parameters);
    
    if dbg
        if mod(i, dbg_step) == 0
            costHistory(i)
        end
    end
end

end

