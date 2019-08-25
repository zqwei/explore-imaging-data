function onset = find_onset(timeseries, first_value, second_value)
t = timeseries(1:end-1) == first_value;
t_plus_1 = timeseries(2:end) == second_value;

onset = t .* t_plus_1;
end