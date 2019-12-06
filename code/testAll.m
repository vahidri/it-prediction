function [outy] = test(Obs, param)
% param: vector n+1 by 1
% Obs(observations): matrix m by n
    o = [ones(size(Obs,1),1),Obs];
    outy = o * param;
end