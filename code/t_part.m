trm = 3000;

%%%TRain M
%%% Train 1:x
%%% Test x+1:end

psize = 8;
data_inp = load('data.csv');
%sortrows(data_inp,9);
predictor = scaling(data_inp(:,1:psize));
response = data_inp(:,psize+1);

%%%GD config
rep = 10000;
alpha = 1.5;
param = zeros(psize+1,1);
disp('calculating...')
[p, c, ch, e] = funPart(predictor, response, param, alpha , rep, trm);
disp(['parameters: ' , num2str(p')])
disp("final cost: " + c)
disp(['RMSE for test-set: ',num2str(e)])
disp(['Exact Prediction Rate of test-set: ' , num2str(100*epr(sel(predictor, 1:trm , ':'), response(1:trm), p) ) ] )
disp(['Exact Prediction Rate of all: ' , num2str(100*epr(predictor,response, p) ) ] )
disp(['RMSE of all: ' , num2str(rmse(testAll(predictor,p), response) ) ] )