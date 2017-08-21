clear all; close all;

root_dir='D:\Takashi\JHUsample\single';

load(fullfile(root_dir,'behavioral_variables.mat'));
load(fullfile(root_dir,'selected_neural_data.mat'));
load(fullfile(root_dir,'colortable.mat'));

% ---Behavioral data structure---
% "swim_power"              -> Swimming power of fish
% "forward_stimli"          -> Forward movement of visual stimuli
% "backward_stimli"         -> Backward movement of visual stimuli

% ---Neural data structure---
% "neural_response_matrix"  -> 2D matrix(neuron number, time)
% "neural_position_XYZ"     -> 2D matrix(neuron number, location of cell)
% "Volume"                  -> Averaged 3D volume of imaging

% ---Colormap---
% "blue_red"                -> Colormap which change like blue-white-red


% Getting the dimension of the volume
dim=size(Volume);  

% Getting the number of cells
cellnum=size(neural_response_matrix,1);

% Getting the number of timepoints
T_max=size(neural_response_matrix,2);

%% Plot behavioral variables

% Plot swim power
figure(2)
subplot(3,1,1);plot(swim_power)

% Plot forward visual stimuli (Exercise)

subplot(3,1,2);


% Plot backward visual stimuli (Exercise)

subplot(3,1,3);



%% Plot neural activity

figure(1);
subplot(3,1,1);plot(neural_response_matrix(1:10,:)')

% Plot activity of next 10 cells (Exercise)

subplot(3,1,2);


% Plot activity of all cells (Exercise)

subplot(3,1,3);


%% Show brain volume

% Top projection view
Volume_XY=sum(Volume,3);

% Side projection view
Volume_XZ=sum(Volume,2);

% Show top and side views
figure(3)

subplot(1,2,1);imagesc(Volume_XY);
subplot(1,2,2);imagesc(squeeze(Volume_XZ));
colormap('gray')

%% Show cell locations

cell_map=zeros(dim(1),dim(2),dim(3),'single');
for c=1:cellnum
    cell_map(neural_position_XYZ(c,:))=1;
end

% Top projection view (Exercise)



% Side projection view (Exercise)



% Show top and side views (Exercise)




%% Z-score (normalize) behavioral variable

% Z-score the swim power
swim_power_norm=(swim_power-mean(swim_power))/std(swim_power);


% Z-score the forward stimuli (Exercise)


% Z-score the backward stimuli (Exercise)



%% Z-score (normalize) neural responses (Exercise)
% use loop over neurons
% use mean() and std() 

neural_response_matrix_norm=zeros(cellnum, T_max);






%% Calculate correlations between swim power and neural responses

% Code 1: Calculate correlation by multiiplying each elements

correlation_neuron_swim = zeros(cellnum,1);

for n = 1:cellnum
    for t = 1:T_max
        correlation_neuron_swim(n) = correlation_neuron_swim(n) + neural_response_matrix_norm(n,t) * swim_power_norm(t);
    end
end

% Code 2: calculate correlation by using vector multiplication (Exercise)
% Use the following command to simplify code 1 to remove loop over t:
% sum()     -> sums over vector
% .*        -> element-wise multiplication between vectors




% Code 3: calculate correlation by using matrix multiplication (Exercise)
% Use matrix multiplication to simply code 2 to remove loop over neurons





%% Calculate correlations between forward/backward visual stimuli (Exercise)


correlation_neuron_forward = zeros(cellnum,1);






correlation_neuron_backward = zeros(cellnum,1);






%% Create correlation map across the whole brain (Exercise)

% Mimic the code used in "Show Cell locations" above.
% Insert correlation values instead of 1

% Show correlation map to swim power 




% Show correlation map to forward stimuli 




% Show correlation map to backward stimuli 





%% Use multivariate regression to neural responses (Exercise)
% use regress funciton


% prepare regressor vector, including intercept

regressor=[swim_power_norm; forward_stimuli_norm; backward_stimuli_norm; ones(1,1200)]';

% calculate beta for each regressor
betas=zeros(cellnum,4);



% Show regression map to swim power 




% Show regression map to forward stimuli 




% Show regression map to backward stimuli 




%% Do Principal Component Analysis (PCA) and show maps for each component (Advanced exercise)




%% Do Non-Negative Matrix Factorization (NNMF) and show maps for each component (Advanced exercise)


