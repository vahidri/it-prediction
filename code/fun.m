function [p, cFin, cHist, er] = fun(pred , resp, param, alpha, rep)
%{
    p: calculated(output) parameter
    cFin: Final Cost
    er: RMSE of observations and prediction by calculated parameters
%}
    x = [ones(size(pred,1),1),pred];
    [p, costHist] = gd(x, resp, param, alpha, rep);
    cHist = costHist;
    cFin = costHist(end);
    er = rmse(testAll(pred,p), resp);
end
