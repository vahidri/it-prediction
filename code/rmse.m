function [outy] = rmse(resp, pred)
% Root Mean Square Error
% obs and pred are vectors
outy = 0;
    if (length(resp) ~= length(pred) )
        outy = -1
        return
    end
    %%else
    d = resp - pred;
    d = d .* d;
    outy = sqrt( sum(d) / length(d) );
end