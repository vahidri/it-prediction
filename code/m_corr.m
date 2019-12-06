psize = 8;

data_inp = load('data-val.csv.1');
%s = data_inp(:,1);
%s = s2n(s)

predictor = scaling(data_inp(:,1:psize));
response = data_inp(:,psize+1);

rep = 10000;
%2.2151
alpha = 1.87;
[p, c, ch, e] = fun(predictor, response, zeros(9,1,'double'), alpha, rep);
p;
c;
e;
%figure;plot(ch)
predictions = testAll(predictor, p);
predictions;
'response';
response;

[np, nc, nch, ne] = fun(predictions, response, [2;0.5] , 0.003, 10000);
nc;
ne;
%%{
outy = testAll(predictions, np);

pred = outy;
f = floor(pred);
r = round(pred);
c = ceil(pred);

c_f = 0;
c_r = 0;
c_c = 0;
for i = 1:length(pred)
    if f(i) == resp(i)
        c_f = c_f+1;
    end
    if r(i) == resp(i)
        c_r = c_r+1;
    end
    if c(i) == resp(i)
        c_c = c_c+1;
    end
end

disp(c_f / length(resp))
disp(c_r / length(resp))
disp(c_c / length(resp))
%}