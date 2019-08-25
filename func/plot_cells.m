% % Brief summary of this function.
% % Detailed explanation of this function.

% Jing Xuan Lim

function plot_cells(cell_indices,neural_response_matrix,title_str)
plot(neural_response_matrix(cell_indices,:)' + (0:length(cell_indices)-1))
xlabel('Time [s]')
ylabel('Cell number')
title(title_str)
end
