function [ exactPredictionRate ] = epr(predictor, response, parameter)
    pred = testAll(predictor, parameter);
    f = floor(pred);
    r = round(pred);
    c = ceil(pred);

    c_f = 0;
    c_r = 0;
    c_c = 0;
    for i = 1:length(pred)
        if f(i) == response(i)
            c_f = c_f+1;
        end
        if r(i) == response(i)
            c_r = c_r+1;
        end
        if c(i) == response(i)
            c_c = c_c+1;
        end
    end

    exactPredictionRate = max([c_f / length(response), c_r / length(response), c_c / length(response)]);
end