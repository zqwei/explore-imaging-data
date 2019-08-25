% % Brief summary of this function.
% % Detailed explanation of this function.

% By Jing Xuan Lim

function onset = find_change(timeseries, threshold)
t = timeseries(1:end-1) <= threshold;
t_plus_1 = timeseries(2:end) > threshold;

onset = t .* t_plus_1;
end
