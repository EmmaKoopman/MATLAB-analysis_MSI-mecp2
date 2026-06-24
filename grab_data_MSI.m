%% Load and read megabouts data and meta data files of behavioural experiments

clearvars
close all
clc

%addpath(genpath('/Users/emmakoopman/Documents/MATLAB/C/toolbox/dlc_analysis'));
%% Load Data

mega_bouts_dir = 'D:\Emma_Conrad\Data\megabouts';
mat_file_dir = 'D:\Emma_Conrad\Data\mat_files';

mb_files = dir(fullfile(mega_bouts_dir,'*.h5'));
mat_files = dir(fullfile(mat_file_dir,'*.mat'));

    
%% Useful parameters 

% General Parameters 
thr = 0.9;                              % Threshold for rejecting poor tracking confidence
frame_rate = 250;                       % Frame rate: so all calculation is converted into seconds (e.g. pixel/s or mm/s)
smooth_val = 5;                         % Size of sliding average window. Values must be odd numbered
pxl_resolution=0.0800;                  % mm per pixel: so all calculations can be converted into mm (eg. mm/f or mm/s)
frame_resolution=[254 254];             % Size of video
tolerance = 0.015;                      % Tolerance used to remove noise
num_tail_seg = 10;                       % Number of tail segment used for MTC Calculations

% Parameters for bout detection
smooth_window = 5;                      % Size of smoothing window
min_peak_seperation = 0.1667;           % Minimium peak seperation in seconds
min_peak_prominence = 0.01;             % Minimium peak prominence (au)
bout_window_start = 60;                 % Size of window to look back to determine start of bout
bout_window_end = 100;                  % Size of window to look forward to determine end of bout (distance)
num_repeats = 7;                        % Number of frames of non-movement to determine fish is no longer moving
std_limit = 4;                          % Factor of standard deviation to define tail velocity noise



%% Load and read the mat file and reading the megabouts data belonging to each batch, trial, and well

dlcName = 'MBO_MSI_SOA_MULTI_MECP2_-Batch-';
coreName = 'MSI_SOA_MULTI_MECP2_-Batch-';

num_trials = 66;

which_session = [17:64];
num_sessions = length(which_session);
num_wells = 7;

rootDataDirectory = 'D:\Emma_Conrad\Data';
matDirectory = [rootDataDirectory '/mat_files'];
dlcDirectory = [rootDataDirectory '/megabouts'];
addpath('D:\Projects\new_functions\');
addpath('D:\Projects\2025_FMR1_MSI\');
body_parts = ["swim_bladder" "tail_1" "tail_2" "tail_3" "tail_4" "tail_5" "tail_6" "tail_7" "tail_8" "tail_9" "tail_10" "R_eye_top" "R_eye_bottom" "L_eye_top" "L_eye_bottom"];
params = ["x" "y" "prob"];
data_dir = dir(rootDataDirectory);

mat_data = cell(1,num_sessions);
vid_data = cell(1,num_sessions);

for session = 1:num_sessions
    disp(['Loading session:' num2str(which_session(session))])
    % Load MAT Files
    current_name = [coreName num2str(which_session(session)) '-'];
    current_file = dir([fullfile(matDirectory, current_name) '*mat']);
    load(fullfile(matDirectory, current_file.name));
    mat_data{session} = myData.allData;
    
    % Load h5 Files
    for wellID = 1:num_wells
        for trial = 1:num_trials
            current_h5_name = [dlcName num2str(which_session(session)) '-Trial-' num2str(trial) '--'];
            current_h5 = dir([fullfile(dlcDirectory,current_h5_name) '*h5']);
            date_name = current_h5(1).name(strfind(current_h5(1).name,'2026'):strfind(current_h5(1).name,'_well')-1);

            actual_h5_name = [current_h5_name date_name '_well_' num2str(wellID)];
            actual_h5 = dir([fullfile(dlcDirectory,actual_h5_name) '*h5']);
            vid_data{session}{wellID}{trial} = h5read([actual_h5.folder '/' actual_h5.name],'/dlc_calcualtions');
            mb_class{session}{wellID}{trial} = h5read([actual_h5.folder '/' actual_h5.name],'/bout_classification');  
            cal_bout_onset{session}{wellID}{trial} = h5read([actual_h5.folder '/' actual_h5.name],'/bout_onsets');
            cal_bout_offset{session}{wellID}{trial} = h5read([actual_h5.folder '/' actual_h5.name],'/bout_offsets');
            cal_bout_class{session}{wellID}{trial} = h5read([actual_h5.folder '/' actual_h5.name], '/classified_bouts')+1;
        end
    end
end
bout_names = ["Approach Swim" "Slow 1" "Slow 2" "Short Capture Swim" "Long Capture Swim" "Burst Swim" "J-Turn" "High-angle Turn" "Routine Turn" "Spot-Avoidance" "O-Bend" "LLC" "SLC"]; 

%% The heading labels of the dlc calculations megabouts data (mb_data) for indexing 

heading_label = {'head_x','head_y','head_angle',...
        'tail_angle_0','tail_angle_1','tail_angle_2','tail_angle_3','tail_angle_4','tail_angle_5','tail_angle_6','tail_angle_7','tail_angle_8',...
        'tail_1_x', 'tail_1_y', 'tail_1_p',...
        'tail_2_x', 'tail_2_y', 'tail_2_p',...
        'tail_3_x', 'tail_3_y', 'tail_3_p',...
        'tail_4_x', 'tail_4_y', 'tail_4_p',...
        'tail_5_x', 'tail_5_y', 'tail_5_p',...
        'tail_6_x', 'tail_6_y', 'tail_6_p',...
        'tail_7_x', 'tail_7_y', 'tail_7_p',...
        'tail_8_x', 'tail_8_y', 'tail_8_p',...
        'tail_9_x', 'tail_9_y', 'tail_9_p',...
        'tail_10_x', 'tail_10_y', 'tail_10_p',...
        'R_eye_top_x','R_eye_top_y','R_eye_top_p',...
        'R_eye_bottom_x','R_eye_bottom_y','R_eye_bottom_p',...
        'L_eye_top_x','L_eye_top_y','L_eye_top_p',...
        'L_eye_bottom_x','L_eye_bottom_y','L_eye_bottom_p',...
        'fps','mm_per_unit',...
        'distance_mm','velocity','acceleration','jerk','distance_from_center','normalized_from_center_x','normalized_from_center_y',...
        'delta_heading','abs_heading','mtc','mean_tail_vel','mean_tail_acc','bout_start','bout_end'};

%% Assign bout types to trials

trials_bouttype = cell(1,length(bout_names));


for i = 1:length(bout_names)
    for batchID = 1:num_sessions
        for wellID = 1:7
            for trialID = 1:66

            bout_types{i}{batchID}{wellID}{trialID} = cal_bout_onset{batchID}{wellID}{trialID}(find(cal_bout_class{batchID}{wellID}{trialID} == i));

            end
        end
    end    
end    

bout_names = ["Approach Swim" "Slow 1" "Slow 2" "Short Capture Swim" "Long Capture Swim" "Burst Swim" "J-Turn" "High-angle Turn" "Routine Turn" "Spot-Avoidance" "O-Bend" "LLC" "SLC"];
   

%% Find trials belonging to each condition

% finding the 82 db tap trials in each batch
trials_lowtap = cell(1,num_sessions);

for batchID = 1:num_sessions;
    trials_lowtap{batchID} = find((mat_data{batchID}(:,2)== 0.6 | mat_data{batchID}(:,2)== 0.56)  & (mat_data{batchID}(:,3)==1 | mat_data{batchID}(:,3)==0.96));   
end

% finding the 87 db tap trials in each batch (p50)
trials_hightap = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_hightap{batchID} = find(mat_data{batchID}(:,2)== 1  & (mat_data{batchID}(:,3)==1 | mat_data{batchID}(:,3)==0.96));
end

% finding the flash trials in each batch

trials_flash = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_flash{batchID} = find(mat_data{batchID}(:,2)==0 & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 0 SOA in each batch - 82 db
trials_0SOA_lt = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_0SOA_lt{batchID} = find(mat_data{batchID}(:,4)== 0 & (mat_data{batchID}(:,2)== 0.6 | mat_data{batchID}(:,2)== 0.56)  & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 50 SOA in each batch - 82 db
trials_50SOA_lt = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_50SOA_lt{batchID} = find(mat_data{batchID}(:,4)== 0.0500 & (mat_data{batchID}(:,2)== 0.6 | mat_data{batchID}(:,2)== 0.56)  & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 100 SOA in each batch - 82 db
trials_100SOA_lt = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_100SOA_lt{batchID} = find(mat_data{batchID}(:,4)== 0.1000 & (mat_data{batchID}(:,2)== 0.6 | mat_data{batchID}(:,2)== 0.56)  & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 150 SOA in each batch - 82 db
trials_150SOA_lt = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_150SOA_lt{batchID} = find(mat_data{batchID}(:,4)== 0.1500 & (mat_data{batchID}(:,2)== 0.6 | mat_data{batchID}(:,2)== 0.56)  & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 0 SOA in each batch - 87 db
trials_0SOA_ht = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_0SOA_ht{batchID} = find(mat_data{batchID}(:,4)== 0 & mat_data{batchID}(:,2)== 1 & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 50 SOA in each batch - 87 db
trials_50SOA_ht = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_50SOA_ht{batchID} = find(mat_data{batchID}(:,4)== 0.0500 & mat_data{batchID}(:,2)== 1  & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 100 SOA in each batch - 87 db
trials_100SOA_ht = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_100SOA_ht{batchID} = find(mat_data{batchID}(:,4)== 0.1000 & mat_data{batchID}(:,2)== 1 & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end

% finding the MSI 150 SOA in each batch - 87 db
trials_150SOA_ht = cell(1,num_sessions);


for batchID = 1:num_sessions;
    trials_150SOA_ht{batchID} = find(mat_data{batchID}(:,4)== 0.1500 & mat_data{batchID}(:,2)== 1 & (mat_data{batchID}(:,3)==0.14 | mat_data{batchID}(:,3)==0.31));
end


