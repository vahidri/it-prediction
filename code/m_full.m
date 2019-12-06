psize = 8;

data_inp = load('data.csv');
predictor = scaling(data_inp(:,1:psize));
response = data_inp(:,psize+1);

rep = 10000;

t_er = zeros(psize,10,'double');

t_param = [-0.526,-0.607,-0.593,-0.123,-0.293,-0.241,-0.237,-0.237;
0.474,0.393,0.407,0.877,0.707,0.759,0.763,0.763;
0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000;
-0.026,0.028,0.029,0.000,-0.010,-0.016,-0.013,-0.005;
0.411,0.162,0.167,0.037,0.174,0.149,0.144,0.139;
-0.035,0.557,0.575,0.557,0.540,0.421,0.504,0.628;
0.474,0.035,0.071,0.009,-0.215,-0.124,-0.012,0.036];

t_param = [rand(7,1) , t_param];
t_param = [t_param; zeros(1, psize+1,'double')];
t_param = [t_param; rand(1, psize+1)];
t_param = t_param';

t_alpha = [.1, .3, .6, .9, 1.2, 1.5 , 1.8 , 1.9, 2, 1.85];

'Gradient Descent details:'
'initial parameters:'
t_param
'learning rates:'
t_alpha

'calculating...'
for i_par = 1:size(t_er,1)
    for j_al =  1:size(t_er,2)
        [p, c, ch, e] = fun(predictor, response, t_param(:,i_par), t_alpha(j_al) , rep);
        t_er(i_par, j_al) = e;
    end
end

'error table:'
t_er
'min RMSE for params:'
min(t_er')

'minimum RMSE is:'
min(min(t_er))


%{

%2.2151
alpha = 1.87
rep = 10000
[p, c, ch, e] = fun(predictor, response, zeros(9,1,'double'), alpha, rep);
p
c
e
%figure;plot(ch)
predictions = testAll(predictor, p);
predictions
'response'
response

%}

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
