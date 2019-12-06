psize = 8;
data_inp = load('data.csv');
predictor = scaling(data_inp(:,1:psize));
response = data_inp(:,psize+1);

rep = 10000;


alpha = 1.8
rep = 10000
[p, c, ch, e] = fun(predictor, response, zeros(9,1,'double'), alpha, rep);
p
c
e
disp(['Exact-Prediction Rate: ' , num2str(100*epr(predictor,response, p)) ] )
%figure;plot(ch)

%{
%2.2152
alpha = 1.7
rep = 10000

%2.2170
alpha = 1.7
rep = 5000

%2.2179
alpha = 1.5
rep = 5000

%2.2155
alpha = 1.3
rep = 5000

%2.2236
alpha = .9
rep = 5000

%2.2429
alpha = .3
rep = 5000

%}

%figure;plot(ch)
