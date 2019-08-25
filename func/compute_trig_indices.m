function trig_indices = compute_trig_indices(onset_indices, t_axis)
trig_indices = onset_indices' + ...
               repmat(t_axis, length(onset_indices), 1);
end