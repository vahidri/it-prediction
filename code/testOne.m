function [outy] = testOne (obs, param)
% param: vector n+1 by 1
% obs(1 observation): vector 1 by n

    o = [1,obs];
    outy = o * param;
end