function [p, cFin, cHist, er] = funParter(pred , resp, param, alpha, rep, n)
%{
this PARTIALLY calculates the gd for a given observation dataset,
    learning from first n observations (from 1 to n)
    testing on the rest (from n+1 to the end)

the rest is like 'fun.m'
    p: calculated(output) parameter
    cFin: Final Cost
    er: RMSE of observations and prediction by calculated parameters
%}

%%% n is the test index
    x = [ones(size(pred,1),1),pred];
    [p, costHist] = gd(sel(x, 1:n, ':'), resp(1:n), param, alpha, rep);
    
    cHist = costHist;
    cFin = costHist(end);
    er = rmse(testAll(sel(pred, n+1:length(pred), ':') ,p), resp(n+1:end) );
end
