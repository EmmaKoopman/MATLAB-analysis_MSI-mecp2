
%% Script to analyse MSI SOA data - Velocity


clearvars
close all
clc

%% Get data and divide trials by condition
run('D:\Emma_Conrad\grab_data_MSI.m')


%% Find velocity for each condition 

% Select which bout types to include

selected_bouttypes = [1 2 3 4 5 6 7 8 9 10 11 12 13] % Use all bouts (all 13) 

% Velocity of 82 db only tap conditions

velocity_lowtap = cell(1,length(trials_lowtap));

for batchID = 1:length(trials_lowtap);
     for wellID_lowtap = 1:num_wells;
        for trialID = 1:length(trials_lowtap{batchID});
            trialID_lowtap = trials_lowtap{batchID}(trialID);

            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_lowtap}{trialID_lowtap};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_lowtap{batchID}{wellID_lowtap}{trialID} = vid_data{batchID}{wellID_lowtap}{trialID_lowtap}(58,:);
            else
                velocity_lowtap{batchID}{wellID_lowtap}{trialID} = NaN(1,1500);
                
           end
        end    
    end        
end


% Velocity of 87 db only tap conditions

velocity_hightap = cell(1,length(trials_hightap));

for batchID = 1:length(trials_hightap);
    for wellID_hightap = 1:num_wells;
        for trialID = 1:length(trials_hightap{batchID});
            trialID_hightap = trials_hightap{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_hightap}{trialID_hightap};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_hightap{batchID}{wellID_hightap}{trialID} = vid_data{batchID}{wellID_hightap}{trialID_hightap}(58,:);
            else
                velocity_hightap{batchID}{wellID_hightap}{trialID} = NaN(1,1500);
                
            end
               
            end
    end        
end

% Velocity of flash conditions
velocity_flash = cell(1,length(trials_flash));

for batchID = 1:length(trials_flash);
    for wellID_flash = 1:num_wells;
        for trialID = 1:length(trials_flash{batchID});
            trialID_flash = trials_flash{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_flash}{trialID_flash};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_flash{batchID}{wellID_flash}{trialID} = vid_data{batchID}{wellID_flash}{trialID_flash}(58,:);
            else
                velocity_flash{batchID}{wellID_flash}{trialID} = NaN(1,1500);
                
            end
        end
    end        
end

% Velocity of MSI 0 SOA conditions - 82 db
 velocity_0SOA_lt = cell(1,length(trials_0SOA_lt));

for batchID = 1:length(trials_0SOA_lt);
    for wellID_0SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_0SOA_lt{batchID});
            trialID_0SOA_lt = trials_0SOA_lt{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = vid_data{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt}(58,:);
            else
                velocity_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = NaN(1,1500);
                
           end

       end
    end        
end

% Velocity of MSI 50 SOA conditions - 82 db

velocity_50SOA_lt = cell(1,length(trials_50SOA_lt));

for batchID = 1:length(trials_50SOA_lt);
    for wellID_50SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_50SOA_lt{batchID});
            trialID_50SOA_lt = trials_50SOA_lt{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = vid_data{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt}(58,:);
            else
                velocity_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = NaN(1,1500);       
            end
        end
    end        
end

% Velocity of MSI 100 SOA conditions - 82 db

velocity_100SOA_lt = cell(1,length(trials_100SOA_lt));


for batchID = 1:length(trials_100SOA_lt);
    for wellID_100SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_100SOA_lt{batchID});
            trialID_100SOA_lt = trials_100SOA_lt{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = vid_data{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt}(58,:);
            else
                velocity_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = NaN(1,1500);
                
            end

        end
    end        
end

% Velocity of MSI 150 SOA conditions - 82 db

velocity_150SOA_lt = cell(1,length(trials_150SOA_lt));

for batchID = 1:length(trials_150SOA_lt);
    for wellID_150SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_150SOA_lt{batchID});
            trialID_150SOA_lt = trials_150SOA_lt{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = vid_data{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt}(58,:);
            else
                velocity_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = NaN(1,1500);       
            end

        end
    end        
end



% Velocity of MSI 0 SOA conditions - 87 db
 velocity_0SOA_ht = cell(1,length(trials_0SOA_ht));

for batchID = 1:length(trials_0SOA_ht);
    for wellID_0SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_0SOA_ht{batchID});
            trialID_0SOA_ht = trials_0SOA_ht{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = vid_data{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht}(58,:);
            else
                velocity_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = NaN(1,1500);       
            end

        end
    end        
end

% Velocity of MSI 50 SOA conditions - 87 db

velocity_50SOA_ht = cell(1,length(trials_50SOA_ht));

for batchID = 1:length(trials_50SOA_ht);
    for wellID_50SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_50SOA_ht{batchID});
            trialID_50SOA_ht = trials_50SOA_ht{batchID}(trialID);
           
           has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive 
                velocity_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = vid_data{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht}(58,:);
            else
                velocity_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = NaN(1,1500);       
            end
        end
    end        
end

% from here

% Velocity of MSI 100 SOA conditions - 87 db

velocity_100SOA_ht = cell(1,length(trials_100SOA_ht));


for batchID = 1:length(trials_100SOA_ht);
    for wellID_100SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_100SOA_ht{batchID});
            trialID_100SOA_ht = trials_100SOA_ht{batchID}(trialID);
           
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = vid_data{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht}(58,:);
            else
                velocity_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = NaN(1,1500);       
            end

        end
    end        
end

% Velocity of MSI 150 SOA conditions - 87 db

velocity_150SOA_ht = cell(1,length(trials_150SOA_ht));

for batchID = 1:length(trials_150SOA_ht);
    for wellID_150SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_150SOA_ht{batchID});
            trialID_150SOA_ht = trials_150SOA_ht{batchID}(trialID);
            
            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    break
                end
            end    

            if has_positive
                velocity_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = vid_data{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht}(58,:);
            else
                velocity_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = NaN(1,1500);       
            end

        end
    end        
end




        
%% Divide velocity per genotype

% % Velocity per genotype for unimodal, 0 SOA, 50 SOA, 100 SOA, and 150 SOA
genotypes = {'wt','het','mut'};
velocity_lowtap_genotyped = cell(length(genotypes),1);
velocity_hightap_genotyped = cell(length(genotypes),1);
velocity_flash_genotyped = cell(length(genotypes),1);
velocity_0SOA_genotyped_lt = cell(length(genotypes),1);
velocity_50SOA_genotyped_lt = cell(length(genotypes),1);
velocity_100SOA_genotyped_lt = cell(length(genotypes),1);
velocity_150SOA_genotyped_lt = cell(length(genotypes),1);
velocity_0SOA_genotyped_ht = cell(length(genotypes),1);
velocity_50SOA_genotyped_ht = cell(length(genotypes),1);
velocity_100SOA_genotyped_ht = cell(length(genotypes),1);
velocity_150SOA_genotyped_ht = cell(length(genotypes),1);

run('D:\Emma_Conrad\genotype.m')

for batchID = 1:length(gene)

    for geneID = 1:length(genotypes)
        clear gene_well
        gene_well = (find(ismember(gene{batchID},genotypes{geneID})));

        for wellID = 1:length(gene_well)

            for trial = 1:6
            
        
                 velocity_lowtap_genotyped{geneID}{batchID}{wellID}(trial,:) = velocity_lowtap{batchID}{gene_well(wellID)}{trial};
                 velocity_hightap_genotyped{geneID}{batchID}{wellID}(trial,:) = velocity_hightap{batchID}{gene_well(wellID)}{trial};
                 velocity_flash_genotyped{geneID}{batchID}{wellID}(trial,:) = velocity_flash{batchID}{gene_well(wellID)}{trial};
                 velocity_0SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = velocity_0SOA_lt{batchID}{gene_well(wellID)}{trial};
                 velocity_50SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = velocity_50SOA_lt{batchID}{gene_well(wellID)}{trial};
                 velocity_100SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = velocity_100SOA_lt{batchID}{gene_well(wellID)}{trial};
                 velocity_150SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = velocity_150SOA_lt{batchID}{gene_well(wellID)}{trial};
                 velocity_0SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = velocity_0SOA_ht{batchID}{gene_well(wellID)}{trial};
                 velocity_50SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = velocity_50SOA_ht{batchID}{gene_well(wellID)}{trial};
                 velocity_100SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = velocity_100SOA_ht{batchID}{gene_well(wellID)}{trial};
                 velocity_150SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = velocity_150SOA_ht{batchID}{gene_well(wellID)}{trial};
            end
        end
    end   
end



%% Transform

for geneID = 1:length(velocity_lowtap_genotyped)

    velocity_lowtap_genotyped{geneID} = velocity_lowtap_genotyped{geneID}.';
    velocity_hightap_genotyped{geneID} = velocity_hightap_genotyped{geneID}.';
    velocity_flash_genotyped{geneID} = velocity_flash_genotyped{geneID}.';
    velocity_0SOA_genotyped_lt{geneID} =  velocity_0SOA_genotyped_lt{geneID}.';
    velocity_50SOA_genotyped_lt{geneID} =  velocity_50SOA_genotyped_lt{geneID}.';
    velocity_100SOA_genotyped_lt{geneID} =  velocity_100SOA_genotyped_lt{geneID}.';
    velocity_150SOA_genotyped_lt{geneID} = velocity_150SOA_genotyped_lt{geneID}.';

    velocity_0SOA_genotyped_ht{geneID} =  velocity_0SOA_genotyped_ht{geneID}.';
    velocity_50SOA_genotyped_ht{geneID} = velocity_50SOA_genotyped_ht{geneID}.';
    velocity_100SOA_genotyped_ht{geneID} =  velocity_100SOA_genotyped_ht{geneID}.';
    velocity_150SOA_genotyped_ht{geneID} = velocity_150SOA_genotyped_ht{geneID}.';


    for batchID = 1:length(velocity_lowtap_genotyped{geneID})

        velocity_lowtap_genotyped{geneID}{batchID} = velocity_lowtap_genotyped{geneID}{batchID}.';
        velocity_hightap_genotyped{geneID}{batchID} = velocity_hightap_genotyped{geneID}{batchID}.';
        velocity_flash_genotyped{geneID}{batchID} = velocity_flash_genotyped{geneID}{batchID}.';
        velocity_0SOA_genotyped_lt{geneID}{batchID} =  velocity_0SOA_genotyped_lt{geneID}{batchID}.';
        velocity_50SOA_genotyped_lt{geneID}{batchID} =  velocity_50SOA_genotyped_lt{geneID}{batchID}.';
        velocity_100SOA_genotyped_lt{geneID}{batchID} =  velocity_100SOA_genotyped_lt{geneID}{batchID}.';
        velocity_150SOA_genotyped_lt{geneID}{batchID} = velocity_150SOA_genotyped_lt{geneID}{batchID}.';
        velocity_0SOA_genotyped_ht{geneID}{batchID} =  velocity_0SOA_genotyped_ht{geneID}{batchID}.';
        velocity_50SOA_genotyped_ht{geneID}{batchID} = velocity_50SOA_genotyped_ht{geneID}{batchID}.';
        velocity_100SOA_genotyped_ht{geneID}{batchID} =  velocity_100SOA_genotyped_ht{geneID}{batchID}.';
        velocity_150SOA_genotyped_ht{geneID}{batchID} = velocity_150SOA_genotyped_ht{geneID}{batchID}.';

    end
end

% Mean velocity unimodal
mean_velocity_lowtap_wt = mean(cell2mat(vertcat(velocity_lowtap_genotyped{1}{:})), 'omitnan'); 
mean_velocity_hightap_wt = mean(cell2mat(vertcat(velocity_hightap_genotyped{1}{:})), 'omitnan');
mean_velocity_flash_wt = mean(cell2mat(vertcat(velocity_flash_genotyped{1}{:})), 'omitnan');

mean_velocity_lowtap_mutant = mean(cell2mat(vertcat(velocity_lowtap_genotyped{3}{:})), 'omitnan');
mean_velocity_hightap_mutant = mean(cell2mat(vertcat(velocity_hightap_genotyped{3}{:})), 'omitnan');
mean_velocity_flash_mutant = mean(cell2mat(vertcat(velocity_flash_genotyped{3}{:})), 'omitnan');

%% Unimodal summation 

SOA = [0 0.05 0.1 0.15];

% Sum all tap trials with flash trials --> get mean and max

v_matrix_lowtap_wt = cell2mat(vertcat(velocity_lowtap_genotyped{1}{:}));
v_matrix_hightap_wt = cell2mat(vertcat(velocity_hightap_genotyped{1}{:}));
v_matrix_flash_wt = cell2mat(vertcat(velocity_flash_genotyped{1}{:}));

v_matrix_lowtap_mutant = cell2mat(vertcat(velocity_lowtap_genotyped{3}{:}));
v_matrix_hightap_mutant = cell2mat(vertcat(velocity_hightap_genotyped{3}{:}));
v_matrix_flash_mutant = cell2mat(vertcat(velocity_flash_genotyped{3}{:}));


% Unimodal summation low tap & flash trials for wt - all SOAs

unimodalsum_lowtap_wt = cell(1,length(SOA));
mean_unimodalsum_lowtap_wt = cell(1,length(SOA));
max_unimodalsum_lowtap_wt = cell(1,length(SOA));

clear unimodalsum_lowtap_wt

for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    lowtap_shifted_wt = zeros(size(v_matrix_lowtap_wt));
    
    if shift_samples > 0
        lowtap_shifted_wt(:, shift_samples+1:end) = ...
            v_matrix_lowtap_wt(:, 1:end-shift_samples); %
    elseif shift_samples < 0
        lowtap_shifted_wt(:, 1:end+shift_samples) = ...
            v_matrix_lowtap_wt(:, 1-shift_samples:end);
    else
        lowtap_shifted_wt = v_matrix_lowtap_wt;
    end

    % --- unimodal summation ---

    unimodalsum_lowtap_wt{i} = lowtap_shifted_wt + v_matrix_flash_wt;

    end    
    

 for i = 1:length(unimodalsum_lowtap_wt) 

        mean_unimodalsum_lowtap_wt{i} = mean(unimodalsum_lowtap_wt{i}, 'omitnan');
        max_unimodalsum_lowtap_wt{i} = max(unimodalsum_lowtap_wt{i},[],2, 'omitnan');   
 end

% Unimodal summation low tap & flash trials for mutant - all SOAs

unimodalsum_lowtap_mutant = cell(1,length(SOA));
mean_unimodalsum_lowtap_mutant = cell(1,length(SOA));
max_unimodalsum_lowtap_mutant = cell(1,length(SOA));

clear unimodalsum_lowtap_mutant
for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    lowtap_shifted_mutant = zeros(size(v_matrix_lowtap_mutant));
    
    if shift_samples > 0
        lowtap_shifted_mutant(:, shift_samples+1:end) = ...
            v_matrix_lowtap_mutant(:, 1:end-shift_samples); %
    elseif shift_samples < 0
        lowtap_shifted_mutant(:, 1:end+shift_samples) = ...
            v_matrix_lowtap_mutant(:, 1-shift_samples:end);
    else
        lowtap_shifted_mutant = v_matrix_lowtap_mutant;
    end

    % --- unimodal summation ---
    unimodalsum_lowtap_mutant{i} = lowtap_shifted_mutant + v_matrix_flash_mutant;
       
end

 for i = 1:length(unimodalsum_lowtap_mutant)
        mean_unimodalsum_lowtap_mutant{i} = mean(unimodalsum_lowtap_mutant{i}, 'omitnan');
        max_unimodalsum_lowtap_mutant{i} = max(unimodalsum_lowtap_mutant{i},[],2, 'omitnan');
 end 

% Unimodal summation high tap & flash trials for wt - all SOAs

clear unimodalsum_hightap_wt
for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    hightap_shifted_wt = zeros(size(v_matrix_hightap_wt));
    
    if shift_samples > 0
        hightap_shifted_wt(:, shift_samples+1:end) = ...
            v_matrix_hightap_wt(:, 1:end-shift_samples); %
    elseif shift_samples < 0
        hightap_shifted_wt(:, 1:end+shift_samples) = ...
            v_matrix_hightap_wt(:, 1-shift_samples:end);
    else
        hightap_shifted_wt = v_matrix_hightap_wt;
    end

    % --- unimodal summation ---
    unimodalsum_hightap_wt{i} = hightap_shifted_wt + v_matrix_flash_wt;
     
end

for i = 1:length(unimodalsum_hightap_wt)
        mean_unimodalsum_hightap_wt{i} = mean(unimodalsum_hightap_wt{i}, 'omitnan');
        max_unimodalsum_hightap_wt{i} = max(unimodalsum_hightap_wt{i},[],2, 'omitnan');
end   

% Unimodal summation high tap & flash trials for mutant - all SOAs

clear unimodalsum_hightap_mutant
for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    hightap_shifted_mutant = zeros(size(v_matrix_hightap_mutant));
    
    if shift_samples > 0
        hightap_shifted_mutant(:, shift_samples+1:end) = ...
            v_matrix_hightap_mutant(:, 1:end-shift_samples); %
    elseif shift_samples < 0
        hightap_shifted_mutant(:, 1:end+shift_samples) = ...
            v_matrix_hightap_mutant(:, 1-shift_samples:end);
    else
        hightap_shifted_mutant = v_matrix_hightap_mutant;
    end

    % --- unimodal summation ---
    unimodalsum_hightap_mutant{i} = hightap_shifted_mutant + v_matrix_flash_mutant;
      
end

 
for j = 1:length(unimodalsum_hightap_mutant)
    mean_unimodalsum_hightap_mutant{j} = mean(unimodalsum_hightap_mutant{j}, 'omitnan');
    max_unimodalsum_hightap_mutant{j} = max(unimodalsum_hightap_mutant{j},[],2, 'omitnan');
end 

%% Mean velocity MSI conditions

% Mean velocity MSI conditions - 82 db
data.mean_velocity_0SOA_lt_wt =  mean(cell2mat(vertcat(velocity_0SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_velocity_0SOA_lt_mutant = mean(cell2mat(vertcat(velocity_0SOA_genotyped_lt{3}{:})),'omitnan');
mean_velocity_0SOA_lt_wt =  mean(cell2mat(vertcat(velocity_0SOA_genotyped_lt{1}{:})),'omitnan');
mean_velocity_0SOA_lt_mutant = mean(cell2mat(vertcat(velocity_0SOA_genotyped_lt{3}{:})),'omitnan');

data.mean_velocity_50SOA_lt_wt =  mean(cell2mat(vertcat(velocity_50SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_velocity_50SOA_lt_mutant = mean(cell2mat(vertcat(velocity_50SOA_genotyped_lt{3}{:})),'omitnan');
mean_velocity_50SOA_lt_wt =  mean(cell2mat(vertcat(velocity_50SOA_genotyped_lt{1}{:})),'omitnan');
mean_velocity_50SOA_lt_mutant = mean(cell2mat(vertcat(velocity_50SOA_genotyped_lt{3}{:})),'omitnan');

data.mean_velocity_100SOA_lt_wt =  mean(cell2mat(vertcat(velocity_100SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_velocity_100SOA_lt_mutant = mean(cell2mat(vertcat(velocity_100SOA_genotyped_lt{3}{:})),'omitnan');
mean_velocity_100SOA_lt_wt =  mean(cell2mat(vertcat(velocity_100SOA_genotyped_lt{1}{:})),'omitnan');
mean_velocity_100SOA_lt_mutant = mean(cell2mat(vertcat(velocity_100SOA_genotyped_lt{3}{:})),'omitnan');

data.mean_velocity_150SOA_lt_wt =  mean(cell2mat(vertcat(velocity_150SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_velocity_150SOA_lt_mutant = mean(cell2mat(vertcat(velocity_150SOA_genotyped_lt{3}{:})),'omitnan');
mean_velocity_150SOA_lt_wt =  mean(cell2mat(vertcat(velocity_150SOA_genotyped_lt{1}{:})),'omitnan');
mean_velocity_150SOA_lt_mutant = mean(cell2mat(vertcat(velocity_150SOA_genotyped_lt{3}{:})),'omitnan');

% Mean velocity MSI conditions - 87 db
data.mean_velocity_0SOA_ht_wt =  mean(cell2mat(vertcat(velocity_0SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_velocity_0SOA_ht_mutant = mean(cell2mat(vertcat(velocity_0SOA_genotyped_ht{3}{:})),'omitnan');
mean_velocity_0SOA_ht_wt =  mean(cell2mat(vertcat(velocity_0SOA_genotyped_ht{1}{:})),'omitnan');
mean_velocity_0SOA_ht_mutant = mean(cell2mat(vertcat(velocity_0SOA_genotyped_ht{3}{:})),'omitnan');

data.mean_velocity_50SOA_ht_wt =  mean(cell2mat(vertcat(velocity_50SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_velocity_50SOA_ht_mutant = mean(cell2mat(vertcat(velocity_50SOA_genotyped_ht{3}{:})),'omitnan');
mean_velocity_50SOA_ht_wt =  mean(cell2mat(vertcat(velocity_50SOA_genotyped_ht{1}{:})),'omitnan');
mean_velocity_50SOA_ht_mutant = mean(cell2mat(vertcat(velocity_50SOA_genotyped_ht{3}{:})),'omitnan');

data.mean_velocity_100SOA_ht_wt =  mean(cell2mat(vertcat(velocity_100SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_velocity_100SOA_ht_mutant = mean(cell2mat(vertcat(velocity_100SOA_genotyped_ht{3}{:})),'omitnan');
mean_velocity_100SOA_ht_wt =  mean(cell2mat(vertcat(velocity_100SOA_genotyped_ht{1}{:})),'omitnan');
mean_velocity_100SOA_ht_mutant = mean(cell2mat(vertcat(velocity_100SOA_genotyped_ht{3}{:})),'omitnan');

data.mean_velocity_150SOA_ht_wt =  mean(cell2mat(vertcat(velocity_150SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_velocity_150SOA_ht_mutant = mean(cell2mat(vertcat(velocity_150SOA_genotyped_ht{3}{:})),'omitnan');
mean_velocity_150SOA_ht_wt =  mean(cell2mat(vertcat(velocity_150SOA_genotyped_ht{1}{:})),'omitnan');
mean_velocity_150SOA_ht_mutant = mean(cell2mat(vertcat(velocity_150SOA_genotyped_ht{3}{:})),'omitnan');

%% Max velocity MSI conditions

clear max_velocity_0SOA_lt_wt
clear max_velocity_0SOA_lt_mutant

% Max velocity MSI conditions - 82 db
max_velocity_0SOA_lt_wt =  max(cell2mat(vertcat(velocity_0SOA_genotyped_lt{1}{:})),[],2);
max_velocity_0SOA_lt_mutant = max(cell2mat(vertcat(velocity_0SOA_genotyped_lt{3}{:})),[],2);

max_velocity_50SOA_lt_wt =  max(cell2mat(vertcat(velocity_50SOA_genotyped_lt{1}{:})),[],2);
max_velocity_50SOA_lt_mutant = max(cell2mat(vertcat(velocity_50SOA_genotyped_lt{3}{:})),[],2);

max_velocity_100SOA_lt_wt =  max(cell2mat(vertcat(velocity_100SOA_genotyped_lt{1}{:})),[],2);
max_velocity_100SOA_lt_mutant = max(cell2mat(vertcat(velocity_100SOA_genotyped_lt{3}{:})),[],2);

max_velocity_150SOA_lt_wt =  max(cell2mat(vertcat(velocity_150SOA_genotyped_lt{1}{:})),[],2);
max_velocity_150SOA_lt_mutant = max(cell2mat(vertcat(velocity_150SOA_genotyped_lt{3}{:})),[],2);

% Max velocity MSI conditions - 87 db
max_velocity_0SOA_ht_wt =  max(cell2mat(vertcat(velocity_0SOA_genotyped_ht{1}{:})),[],2);
max_velocity_0SOA_ht_mutant = max(cell2mat(vertcat(velocity_0SOA_genotyped_ht{3}{:})),[],2);

max_velocity_50SOA_ht_wt =  max(cell2mat(vertcat(velocity_50SOA_genotyped_ht{1}{:})),[],2);
max_velocity_50SOA_ht_mutant = max(cell2mat(vertcat(velocity_50SOA_genotyped_ht{3}{:})),[],2);

max_velocity_100SOA_ht_wt =  max(cell2mat(vertcat(velocity_100SOA_genotyped_ht{1}{:})),[],2);
max_velocity_100SOA_ht_mutant = max(cell2mat(vertcat(velocity_100SOA_genotyped_ht{3}{:})),[],2);

max_velocity_150SOA_ht_wt =  max(cell2mat(vertcat(velocity_150SOA_genotyped_ht{1}{:})),[],2);
max_velocity_150SOA_ht_mutant = max(cell2mat(vertcat(velocity_150SOA_genotyped_ht{3}{:})),[],2);

%% Normalisation unimodal summation

start_baseline = 1;  % Frames with baseline values
stop_baseline = 700;

% 82 db wt

mean_unimodalsum_lowtap_wt_norm = cell(1,length(SOA));

for i = 1:length(SOA)
    fieldname = sprintf('mean_velocity_%dSOA_lt_wt', SOA(i)*1000);
    current_lt_wt = data.(fieldname);

    diff_norm_lt_wt{i} = mean(mean_unimodalsum_lowtap_wt{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_lt_wt(start_baseline:stop_baseline), 'omitnan');
    mean_unimodalsum_lowtap_wt_norm{i} = mean_unimodalsum_lowtap_wt{i} - diff_norm_lt_wt{i};
end


% 87 db wt

mean_unimodalsum_hightap_wt_norm = cell(1,length(SOA));

for i = 1:length(SOA)
    fieldname = sprintf('mean_velocity_%dSOA_ht_wt', SOA(i)*1000);
    current_ht_wt = data.(fieldname);

    diff_norm_ht_wt{i} = mean(mean_unimodalsum_hightap_wt{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_ht_wt(start_baseline:stop_baseline), 'omitnan');
    mean_unimodalsum_hightap_wt_norm{i} = mean_unimodalsum_hightap_wt{i} - diff_norm_ht_wt{i};
end

% 82 db mutant

mean_unimodalsum_lowtap_mutant_norm = cell(1,length(SOA));


for i = 1:length(SOA)
    fieldname = sprintf('mean_velocity_%dSOA_lt_mutant', SOA(i)*1000);
    current_lt_mut = data.(fieldname);


    diff_norm_lt_mut{i} = mean(mean_unimodalsum_lowtap_mutant{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_lt_mut(start_baseline:stop_baseline), 'omitnan');
    mean_unimodalsum_lowtap_mutant_norm{i} = mean_unimodalsum_lowtap_mutant{i} - diff_norm_lt_mut{i};
end

% 87 db mutant

mean_unimodalsum_hightap_mutant_norm = cell(1,length(SOA));


for i = 1:length(SOA)
    fieldname = sprintf('mean_velocity_%dSOA_ht_mutant', SOA(i)*1000);
    current_ht_mut = data.(fieldname);


    diff_norm_ht_mut{i} = mean(mean_unimodalsum_hightap_mutant{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_ht_mut(start_baseline:stop_baseline), 'omitnan');
    mean_unimodalsum_hightap_mutant_norm{i} = mean_unimodalsum_hightap_mutant{i} - diff_norm_ht_mut{i};
end


%% Plotting velocity over time MSI for 82 db stimulus
recording_duration = 6; % seconds
x = linspace(-3,3,1500);

% Plot unimodal velocity for mutant and wt
figure('Name', 'Velocity: 82 db tap stimulus') % 82 db


subplot(2,5,1)
plot(x,mean_velocity_lowtap_wt, 'b')
hold on
plot(x,mean_velocity_flash_wt,'r')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt')
xline(0, '--k')
legend('82 db tap', 'Flash')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;

hold on

subplot(2,5,6)
plot(x,mean_velocity_lowtap_mutant,'b')
hold on
plot(x,mean_velocity_flash_mutant,'r')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant')
xline(0, '--k')
legend('82 db tap', 'Flash')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 0 ms with unimodal summation for wt & mutant
subplot(2,5,2)
plot(x,mean_velocity_0SOA_lt_wt,'m')
hold on
plot(x,mean_unimodalsum_lowtap_wt_norm{1},'Color', '#FF8800') 
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 0 SOA ')
xline(0, '--k')
legend('0 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,7)
plot(x,mean_velocity_0SOA_lt_mutant,'m')
hold on
plot(x,mean_unimodalsum_lowtap_mutant_norm{1},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 0 SOA')
xline(0, '--k')
legend('0 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 50 ms with unimodal summation for wt & mutant
subplot(2,5,3)
plot(x,mean_velocity_50SOA_lt_wt,'m')
hold on
plot(x,mean_unimodalsum_lowtap_wt_norm{2},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 50 SOA')
xline([0], '--k')
xline(0.05, '--k')
legend('50 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,8)
plot(x,mean_velocity_50SOA_lt_mutant,'m')
hold on
plot(x,mean_unimodalsum_lowtap_mutant_norm{2},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 50 SOA')
xline([0], '--k')
xline(0.05, '--k')
legend('50 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 100 ms with unimodal summation for wt & mutant
subplot(2,5,4)
plot(x,mean_velocity_100SOA_lt_wt,'m')
hold on
plot(x,mean_unimodalsum_lowtap_wt_norm{3},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 100 SOA')
xline([0], '--k')
xline(0.1, '--k')
legend('100 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,9)
plot(x,mean_velocity_100SOA_lt_mutant,'m')
hold on
plot(x,mean_unimodalsum_lowtap_mutant_norm{3},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 100 SOA')
xline([0], '--k')
xline(0.1, '--k')
legend('100 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 150 ms with unimodal summation for wt & mutant
subplot(2,5,5)
plot(x,mean_velocity_150SOA_lt_wt,'m')
hold on
plot(x,mean_unimodalsum_lowtap_wt_norm{4},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 150 SOA')
xline([0], '--k')
xline(0.15, '--k')
legend('150 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,10)
plot(x,mean_velocity_150SOA_lt_mutant,'m')
hold on
plot(x,mean_unimodalsum_lowtap_mutant_norm{4},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 150 SOA')
xline([0], '--k')
xline(0.15, '--k')
legend('150 SOA', 'Sum (tap + flash)')
ylim([0,60])
xlim([-0.2,0.5])
lgd.FontSize = 4;


%% Plotting velocity over time MSI for 87 db stimulus

% Plot unimodal velocity for mutant and wt
figure('Name', 'Velocity: 87 db tap stimulus') % 87 db


subplot(2,5,1)
plot(x,mean_velocity_hightap_wt,'b')
hold on
plot(x,mean_velocity_flash_wt,'r')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt')
xline([0], '--k')
legend('87 db tap', 'Flash', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;

hold on

subplot(2,5,6)
plot(x,mean_velocity_hightap_mutant,'b')
hold on
plot(x,mean_velocity_flash_mutant,'r')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant')
xline([0], '--k')
legend('87 db tap', 'Flash','Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 0 ms with unimodal summation for wt & mutant
subplot(2,5,2)
plot(x,mean_velocity_0SOA_ht_wt,'m')
hold on
plot(x,mean_unimodalsum_hightap_wt_norm{1},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 0 SOA')
xline([0], '--k')
legend('0 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,7)
plot(x,mean_velocity_0SOA_ht_mutant,'m')
hold on
plot(x,mean_unimodalsum_hightap_mutant_norm{1},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 0 SOA')
xline([0], '--k')
legend('0 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 50 ms with unimodal summation for wt & mutant
subplot(2,5,3)
plot(x,mean_velocity_50SOA_ht_wt,'m')
hold on
plot(x,mean_unimodalsum_hightap_wt_norm{2},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 50 SOA')
xline([0], '--k')
xline(0.05, '--k')
legend('50 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,8)
plot(x,mean_velocity_50SOA_ht_mutant,'m')
hold on
plot(x,mean_unimodalsum_hightap_mutant_norm{2},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 50 SOA')
xline([0], '--k')
xline(0.05, '--k')
legend('50 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 100 ms with unimodal summation for wt & mutant
subplot(2,5,4)
plot(x,mean_velocity_100SOA_ht_wt,'m')
hold on
plot(x,mean_unimodalsum_hightap_wt_norm{3},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 100 SOA')
xline([0], '--k')
xline(0.1, '--k')
legend('100 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,9)
plot(x,mean_velocity_100SOA_ht_mutant,'m')
hold on
plot(x,mean_unimodalsum_hightap_mutant_norm{3},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 100 SOA')
xline([0], '--k')
xline(0.1, '--k')
legend('100 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot velocity MSI 150 ms with unimodal summation for wt & mutant
subplot(2,5,5)
plot(x,mean_velocity_150SOA_ht_wt,'m')
hold on
plot(x,mean_unimodalsum_hightap_wt_norm{4},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Wt: 150 SOA')
xline([0], '--k')
xline(0.15, '--k')
legend('150 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,10)
plot(x,mean_velocity_150SOA_ht_mutant,'m')
hold on
plot(x,mean_unimodalsum_hightap_mutant_norm{4},'Color', '#FF8800')
ylabel('Speed (mm/s)')
xlabel('Time since stimulus onset (s)')
title('Mutant: 150 SOA')
xline([0], '--k')
xline(0.15, '--k')
legend('150 SOA', 'Sum (tap + flash)', 'Onset stimulus')
ylim([0,80])
xlim([-0.2,0.5])
lgd.FontSize = 4;


%% Bar graphs AUC low tap
% Area under the curve
% Get the area under the graph for tap and flash seperately and sum that for the bar graph --> compare to SOAs

% Low tap experiments area under curve (auc)

start_interval_auc = zeros(1,length(SOA));
stop_interval_auc = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval_auc(i) = 750 + (frame_rate * SOA(i))
    stop_interval_auc(i) = 900 + (frame_rate * SOA(i)) 
end

for i = 1:length(SOA)
    current_name_MSI_lt_wt = ['mean_velocity_' num2str(SOA(i)*1000) 'SOA_lt_wt'];
    current_MSI_lt_wt = eval(current_name_MSI_lt_wt);
    current_MSI_lt_wt = current_MSI_lt_wt(start_interval_auc(i):stop_interval_auc(i))
    current_name_MSI_lt_mut = ['mean_velocity_' num2str(SOA(i)*1000) 'SOA_lt_mutant'];
    current_MSI_lt_mut = eval(current_name_MSI_lt_mut);
    current_MSI_lt_mut = current_MSI_lt_mut(start_interval_auc(i):stop_interval_auc(i))

    current_unimodalsum_wt = mean_unimodalsum_lowtap_wt_norm{i}(start_interval_auc(i):stop_interval_auc(i))
    current_unimodalsum_mut = mean_unimodalsum_lowtap_mutant_norm{i}(start_interval_auc(i):stop_interval_auc(i))

    MSI_wt_clean = ~isnan(current_MSI_lt_wt)
    MSI_mut_clean =  ~isnan(current_MSI_lt_mut)
    unimodal_wt_clean = ~isnan(current_unimodalsum_wt)
    unimodal_mut_clean = ~isnan(current_unimodalsum_mut)

    auc_MSI_wt_lt{i} = trapz(x(MSI_wt_clean), current_MSI_lt_wt(MSI_wt_clean));
    auc_unisum_wt_lt{i} = trapz(x(unimodal_wt_clean),current_unimodalsum_wt(unimodal_wt_clean));
    auc_MSI_mut_lt{i} = trapz(x(MSI_mut_clean), current_MSI_lt_mut(MSI_mut_clean));
    auc_unisum_mut_lt{i} = trapz(x(unimodal_mut_clean), current_unimodalsum_mut(unimodal_mut_clean));

end    


figure('Name', 'Bar graphs AUC velocity 82 db')

subplot(2,4,1)
x_bar = categorical({'Sum (tap + flash)' , '0 SOA'});    
bar(x_bar, [auc_unisum_wt_lt{1} auc_MSI_wt_lt{1}])
title('AUC wt: 0 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,2)
x_bar = categorical({'Sum (tap + flash)', '50 SOA'});    
bar(x_bar, [auc_unisum_wt_lt{2} auc_MSI_wt_lt{2}])
title('AUC wt: 50 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,3)
x_bar = categorical({'Sum (tap + flash)', '100 SOA'});    
bar(x_bar, [auc_unisum_wt_lt{3} auc_MSI_wt_lt{3}])
title('AUC wt: 100 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,4)
x_bar = categorical({'Sum (tap + flash)', '150 SOA'});    
bar(x_bar, [auc_unisum_wt_lt{4} auc_MSI_wt_lt{4}])
title('AUC wt: 150 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,5)
x_bar = categorical({'Sum (tap + flash)', '0 SOA'});    
bar(x_bar, [auc_unisum_mut_lt{1} auc_MSI_mut_lt{1}])
title('AUC mutant: 0 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,6)
x_bar = categorical({'Sum (tap + flash)', '50 SOA'});    
bar(x_bar, [auc_unisum_mut_lt{2} auc_MSI_mut_lt{2}])
title('AUC mutant: 50 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,7)
x_bar = categorical({'Sum (tap + flash)', '100 SOA'});    
bar(x_bar, [auc_unisum_mut_lt{3} auc_MSI_mut_lt{3}])
title('AUC mutant: 100 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,8)
x_bar = categorical({'Sum (tap + flash)', '150 SOA'});    
bar(x_bar, [auc_unisum_mut_lt{4} auc_MSI_mut_lt{4}])
title('AUC mutant: 150 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

%% Bar graphs AUC high tap

% Area under the curve 
% Get the area under the graph for tap and flash seperately and sum that for the bar graph --> compare to SOAs

% High tap experiments area under curve (auc)


for i = 1:length(SOA)
    current_name_MSI_ht_wt = ['mean_velocity_' num2str(SOA(i)*1000) 'SOA_ht_wt'];
    current_MSI_ht_wt = eval(current_name_MSI_ht_wt);
    current_MSI_ht_wt = current_MSI_ht_wt(start_interval_auc(i):stop_interval_auc(i))
    current_name_MSI_ht_mut = ['mean_velocity_' num2str(SOA(i)*1000) 'SOA_ht_mutant'];
    current_MSI_ht_mut = eval(current_name_MSI_ht_mut);
    current_MSI_ht_mut = current_MSI_ht_mut(start_interval_auc(i):stop_interval_auc(i))

    current_unimodalsum_wt = mean_unimodalsum_hightap_wt_norm{i}(start_interval_auc(i):stop_interval_auc(i))
    current_unimodalsum_mut = mean_unimodalsum_hightap_mutant_norm{i}(start_interval_auc(i):stop_interval_auc(i))

    MSI_wt_clean = ~isnan(current_MSI_ht_wt)
    MSI_mut_clean =  ~isnan(current_MSI_ht_mut)
    unimodal_wt_clean = ~isnan(current_unimodalsum_wt)
    unimodal_mut_clean = ~isnan(current_unimodalsum_mut)

    auc_MSI_wt_ht{i} = trapz(x(MSI_wt_clean), current_MSI_ht_wt(MSI_wt_clean));
    auc_unisum_wt_ht{i} = trapz(x(unimodal_wt_clean),current_unimodalsum_wt(unimodal_wt_clean));
    auc_MSI_mut_ht{i} = trapz(x(MSI_mut_clean), current_MSI_ht_mut(MSI_mut_clean));
    auc_unisum_mut_ht{i} = trapz(x(unimodal_mut_clean), current_unimodalsum_mut(unimodal_mut_clean));

end    


figure('Name', 'Bar graphs AUC velocity 87 db')

subplot(2,4,1)
x_bar = categorical({'Sum (tap + flash)' , '0 SOA'});    
bar(x_bar, [auc_unisum_wt_ht{1} auc_MSI_wt_ht{1}])
title('AUC wt: 0 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,2)
x_bar = categorical({'Sum (tap + flash)', '50 SOA'});    
bar(x_bar, [auc_unisum_wt_ht{2} auc_MSI_wt_ht{2}])
title('AUC wt: 50 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,3)
x_bar = categorical({'Sum (tap + flash)', '100 SOA'});    
bar(x_bar, [auc_unisum_wt_ht{3} auc_MSI_wt_ht{3}])
title('AUC wt: 100 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,4)
x_bar = categorical({'Sum (tap + flash)', '150 SOA'});    
bar(x_bar, [auc_unisum_wt_ht{4} auc_MSI_wt_ht{4}])
title('AUC wt: 150 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,5)
x_bar = categorical({'Sum (tap + flash)', '0 SOA'});    
bar(x_bar, [auc_unisum_mut_ht{1} auc_MSI_mut_ht{1}])
title('AUC mutant: 0 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,6)
x_bar = categorical({'Sum (tap + flash)', '50 SOA'});    
bar(x_bar, [auc_unisum_mut_ht{2} auc_MSI_mut_ht{2}])
title('AUC mutant: 50 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,7)
x_bar = categorical({'Sum (tap + flash)', '100 SOA'});    
bar(x_bar, [auc_unisum_mut_ht{3} auc_MSI_mut_ht{3}])
title('AUC mutant: 100 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')

subplot(2,4,8)
x_bar = categorical({'Sum (tap + flash)', '150 SOA'});    
bar(x_bar, [auc_unisum_mut_ht{4} auc_MSI_mut_ht{4}])
title('AUC mutant: 150 SOA')
ylim([0,7])
ylabel('Cummulative sum velocity')


%%%% Mean velocity per fish

% 82 db tap

start_interval_avg = zeros(1,length(SOA));
stop_interval_avg = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval_avg(i) = 750 + (frame_rate * SOA(i))
    stop_interval_avg(i) = 800 + (frame_rate * SOA(i)) 
end


for i = 1:length(SOA)
    current_name_MSI = ['velocity_' num2str(SOA(i)*1000) 'SOA_genotyped_lt'];
    current_MSI = eval(current_name_MSI);
    
    % wt
    mat_velocity_lt_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    mean_velocity_lt_wt_trial = mean(mat_velocity_lt_wt(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_lt_wt_fish{i} = mean(reshape(mean_velocity_lt_wt_trial,6,[]),1,'omitnan');

    mean_velocity_lowtap_wt_trial = mean(v_matrix_lowtap_wt(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_lowtap_wt_fish{i} = mean(reshape(mean_velocity_lowtap_wt_trial,6,[]),1,'omitnan');

    mean_velocity_unimodal_lt_wt_trial =  mean(unimodalsum_lowtap_wt{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_lt_wt_fish{i} = (mean(reshape(mean_velocity_unimodal_lt_wt_trial,6,[]),1,'omitnan')) - diff_norm_lt_wt{i};

    fishdata_vel_lt_wt{i} = [mean_velocity_unimodal_lt_wt_fish{i}' mean_velocity_lt_wt_fish{i}'];

    % mutant

    mat_velocity_lt_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    mean_velocity_lt_mut_trial = mean(mat_velocity_lt_mut(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_lt_mut_fish{i} = mean(reshape(mean_velocity_lt_mut_trial,6,[]),1,'omitnan');

    mean_velocity_lowtap_mut_trial = mean(v_matrix_lowtap_mutant(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_lowtap_mut_fish{i} = mean(reshape(mean_velocity_lowtap_mut_trial,6,[]),1,'omitnan');
    
    mean_velocity_unimodal_lt_mut_trial =  mean(unimodalsum_lowtap_mutant{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_lt_mut_fish{i} = (mean(reshape(mean_velocity_unimodal_lt_mut_trial,6,[]),1,'omitnan')) - diff_norm_lt_mut{i};

    fishdata_vel_lt_mut{i} = [mean_velocity_unimodal_lt_mut_fish{i}' mean_velocity_lt_mut_fish{i}'];

end    

% 87 db tap


for i = 1:length(SOA)
    current_name_MSI = ['velocity_' num2str(SOA(i)*1000) 'SOA_genotyped_ht'];
    current_MSI = eval(current_name_MSI);
    
    % wt

    mat_velocity_ht_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    mean_velocity_ht_wt_trial = mean(mat_velocity_ht_wt(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_ht_wt_fish{i} = mean(reshape(mean_velocity_ht_wt_trial,6,[]),1,'omitnan');

    mean_velocity_hightap_wt_trial = mean(v_matrix_hightap_wt(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_hightap_wt_fish{i} = mean(reshape(mean_velocity_hightap_wt_trial,6,[]),1,'omitnan');
    
    mean_velocity_unimodal_ht_wt_trial =  mean(unimodalsum_hightap_wt{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_ht_wt_fish{i} = (mean(reshape(mean_velocity_unimodal_ht_wt_trial,6,[]),1,'omitnan')) - diff_norm_ht_wt{i};

    fishdata_vel_ht_wt{i} = [mean_velocity_unimodal_ht_wt_fish{i}' mean_velocity_ht_wt_fish{i}'];

    % mutant

    mat_velocity_ht_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    mean_velocity_ht_mut_trial = mean(mat_velocity_ht_mut(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_ht_mut_fish{i} = mean(reshape(mean_velocity_ht_mut_trial,6,[]),1,'omitnan');

    mean_velocity_hightap_mut_trial = mean(v_matrix_hightap_mutant(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_hightap_mut_fish{i} = mean(reshape(mean_velocity_hightap_mut_trial,6,[]),1,'omitnan');
    
    mean_velocity_unimodal_ht_mut_trial =  mean(unimodalsum_hightap_mutant{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_ht_mut_fish{i} = (mean(reshape(mean_velocity_unimodal_ht_mut_trial,6,[]),1,'omitnan')) - diff_norm_ht_mut{i};

    fishdata_vel_ht_mut{i} = [mean_velocity_unimodal_ht_mut_fish{i}' mean_velocity_ht_mut_fish{i}'];

end    

%% Max velocity per fish

% 82 db tap


for i = 1:length(SOA)
    current_name_MSI = ['velocity_' num2str(SOA(i)*1000) 'SOA_genotyped_lt'];
    current_MSI = eval(current_name_MSI);
    
    % wt
    mat_velocity_lt_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    max_velocity_lt_wt_trial = max(mat_velocity_lt_wt,[],2);
    max_velocity_lt_wt_fish{i} = mean(reshape(max_velocity_lt_wt_trial,6,[]),1,'omitnan');

    max_velocity_unimodal_lt_wt_trial =  max(unimodalsum_lowtap_wt{i},[],2);
    max_velocity_unimodal_lt_wt_fish{i} = (mean(reshape(max_velocity_unimodal_lt_wt_trial,6,[]),1,'omitnan')) - diff_norm_lt_wt{i};

    fishdata_maxvel_lt_wt{i} = [max_velocity_unimodal_lt_wt_fish{i}' max_velocity_lt_wt_fish{i}'];

    % mutant

    mat_velocity_lt_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    max_velocity_lt_mut_trial = max(mat_velocity_lt_mut,[],2);
    max_velocity_lt_mut_fish{i} = mean(reshape(max_velocity_lt_mut_trial,6,[]),1,'omitnan');

    %max_velocity_lowtap_mut_trial = max(v_matrix_lowtap_mutant(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    %max_velocity_lowtap_mut_fish{i} = max(reshape(max_velocity_lowtap_mut_trial,6,[]),1,'omitnan');
    
    max_velocity_unimodal_lt_mut_trial =  max(unimodalsum_lowtap_mutant{i},[],2);
    max_velocity_unimodal_lt_mut_fish{i} = (mean(reshape(max_velocity_unimodal_lt_mut_trial,6,[]),1,'omitnan')) - diff_norm_lt_mut{i};

    fishdata_maxvel_lt_mut{i} = [max_velocity_unimodal_lt_mut_fish{i}' max_velocity_lt_mut_fish{i}'];

end    

% 87 db tap


for i = 1:length(SOA)
    current_name_MSI = ['velocity_' num2str(SOA(i)*1000) 'SOA_genotyped_ht'];
    current_MSI = eval(current_name_MSI);
    
    % wt

    mat_velocity_ht_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    max_velocity_ht_wt_trial = max(mat_velocity_ht_wt,[],2);
    max_velocity_ht_wt_fish{i} = mean(reshape(max_velocity_ht_wt_trial,6,[]),1,'omitnan');
    
    max_velocity_unimodal_ht_wt_trial =  max(unimodalsum_hightap_wt{i},[],2,'omitnan');
    max_velocity_unimodal_ht_wt_fish{i} = (mean(reshape(max_velocity_unimodal_ht_wt_trial,6,[]),1,'omitnan')) - diff_norm_ht_wt{i};

    fishdata_maxvel_ht_wt{i} = [max_velocity_unimodal_ht_wt_fish{i}' max_velocity_ht_wt_fish{i}'];

    % mutant

    mat_velocity_ht_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    max_velocity_ht_mut_trial = max(mat_velocity_ht_mut,[],2);
    max_velocity_ht_mut_fish{i} = mean(reshape(max_velocity_ht_mut_trial,6,[]),1,'omitnan');
    
    max_velocity_unimodal_ht_mut_trial =  max(unimodalsum_hightap_mutant{i},[],2);
    max_velocity_unimodal_ht_mut_fish{i} = (mean(reshape(max_velocity_unimodal_ht_mut_trial,6,[]),1,'omitnan')) - diff_norm_ht_mut{i};

    fishdata_maxvel_ht_mut{i} = [max_velocity_unimodal_ht_mut_fish{i}' max_velocity_ht_mut_fish{i}'];

end    

%% Scatter graphs max velocity wild type versus mutant

% Maximum velocity

function plotScatterSd(wt, mut, ylims, plotTitle)

wt = wt(~isnan(wt));
mut = mut(~isnan(mut));

mean_wt = mean(wt);
mean_mut = mean(mut);

sd_wt = std(wt);
sd_mut = std(mut);

hold on

scatter(1 + 0.08*randn(size(wt)), wt, ...
    30, [0 0 1], 'filled','MarkerFaceAlpha',0.3,...
    'MarkerEdgeAlpha',0.3);

scatter(2 + 0.08*randn(size(mut)), mut, ...
    30, [1 0 0], 'filled','MarkerFaceAlpha',0.3,...
    'MarkerEdgeAlpha',0.3);

errorbar(1, mean_wt, sd_wt, ...
    'b', 'LineWidth', 1.5, 'CapSize', 10);

errorbar(2, mean_mut, sd_mut, ...
    'r', 'LineWidth', 1.5, 'CapSize', 10);

plot([0.85 1.15],[mean_wt mean_wt],'b','LineWidth',2);
plot([1.85 2.15],[mean_mut mean_mut],'r','LineWidth',2);

xlim([0.5 2.5])
ylim(ylims)

xticks([1 2])
xticklabels({'Wild type','mecp2'})

ylabel('maximum velocity (mm/s)')
title(plotTitle)

box on
end

figure('Name', 'Bar graphs max velocity wt vs mutant 82 db')

subplot(2,4,1)
plotScatterSd( ...
    max_velocity_lt_wt_fish{1}, ...
    max_velocity_lt_mut_fish{1}, ...
    [0 180], ...
    '82 db: 0 SOA')

subplot(2,4,2)
plotScatterSd( ...
    max_velocity_lt_wt_fish{2}, ...
    max_velocity_lt_mut_fish{2}, ...
    [0 180], ...
    '82 db: 50 SOA')

subplot(2,4,3)
plotScatterSd( ...
    max_velocity_lt_wt_fish{3}, ...
    max_velocity_lt_mut_fish{3}, ...
    [0 180], ...
    '82 db: 100 SOA')

subplot(2,4,4)
plotScatterSd( ...
    max_velocity_lt_wt_fish{4}, ...
    max_velocity_lt_mut_fish{4}, ...
    [0 180], ...
    '82 db: 150 SOA')


subplot(2,4,5)
plotScatterSd( ...
    max_velocity_ht_wt_fish{1}, ...
    max_velocity_ht_mut_fish{1}, ...
    [0 200], ...
    '87 db: 0 SOA')

subplot(2,4,6)
plotScatterSd( ...
    max_velocity_ht_wt_fish{2}, ...
    max_velocity_ht_mut_fish{2}, ...
    [0 200], ...
    '87 db: 50 SOA')

subplot(2,4,7)
plotScatterSd( ...
    max_velocity_ht_wt_fish{3}, ...
    max_velocity_ht_mut_fish{3}, ...
    [0 200], ...
    '87 db: 100 SOA')

subplot(2,4,8)
plotScatterSd( ...
    max_velocity_ht_wt_fish{4}, ...
    max_velocity_ht_mut_fish{4}, ...
    [0 200], ...
    '87 db: 150 SOA')


%% Statistical tests max velocity
% Normalise before statistical tests

% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

% Maximum speed
% Test one-sided t-test --> is MSI higher? --> Right-tailed
% Test with average because average speed per fish and trial can be
% included. AUC is just 1 number.Not good for statiscical tests

ttest_maxvel_lt = zeros(1,length(SOA));
ttest_maxvel_ht = zeros(1,length(SOA));

for i = 1: length(SOA)
    [~,ttest_maxvel_lt(:,i)]= ttest2(max_velocity_lt_wt_fish{i}, max_velocity_lt_mut_fish{i}, 'Tail','left')
    [~,ttest_maxvel_ht(:,i)]= ttest2(max_velocity_ht_wt_fish{i}, max_velocity_ht_mut_fish{i},'Tail','left')
end


%% Mean velocity per fish


  mean_velocity_lt_wt_trial = cell(1,size(SOA,2));
  mean_velocity_lowtap_wt_trial = cell(1,size(SOA,2));
  mean_velocity_flash_wt_trial = cell(1,size(SOA,2));
  mean_velocity_unimodal_lt_wt_trial = cell(1,size(SOA,2));
  mean_velocity_lt_mut_trial = cell(1,size(SOA,2));
  mean_velocity_lowtap_mut_trial = cell(1,size(SOA,2));
  mean_velocity_flash_mut_trial = cell(1,size(SOA,2));
  mean_velocity_unimodal_lt_mut_trial = cell(1,size(SOA,2));

  mean_velocity_ht_wt_trial = cell(1,size(SOA,2));
  mean_velocity_hightap_wt_trial = cell(1,size(SOA,2));
  mean_velocity_flash_wt_trial = cell(1,size(SOA,2));
  mean_velocity_unimodal_ht_wt_trial = cell(1,size(SOA,2));
  mean_velocity_ht_mut_trial = cell(1,size(SOA,2));
  mean_velocity_hightap_mut_trial = cell(1,size(SOA,2));
  mean_velocity_flash_mut_trial = cell(1,size(SOA,2));
  mean_velocity_unimodal_ht_mut_trial = cell(1,size(SOA,2));

% 82 db tap

start_interval_avg = zeros(1,length(SOA));
stop_interval_avg = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval_avg(i) = 750 + (frame_rate * SOA(i))
    stop_interval_avg(i) = 800 + (frame_rate * SOA(i)) 
end


for i = 1:length(SOA)
    current_name_MSI = ['velocity_' num2str(SOA(i)*1000) 'SOA_genotyped_lt'];
    current_MSI = eval(current_name_MSI);
    
    % wt
    mat_velocity_lt_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    mean_velocity_lt_wt_trial{i} = mean(mat_velocity_lt_wt(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_lt_wt_fish{i} = mean(reshape(mean_velocity_lt_wt_trial{i},6,[]),1,'omitnan');

    mean_velocity_lowtap_wt_trial{i} = mean(v_matrix_lowtap_wt(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_lowtap_wt_fish{i} = mean(reshape(mean_velocity_lowtap_wt_trial{i},6,[]),1,'omitnan');
    mean_velocity_flash_wt_trial{i} = mean(v_matrix_flash_wt(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_flash_wt_fish{i} = mean(reshape(mean_velocity_flash_wt_trial{i},6,[]),1,'omitnan');

    mean_velocity_unimodal_lt_wt_trial{i} =  mean(unimodalsum_lowtap_wt{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_lt_wt_fish{i} = (mean(reshape(mean_velocity_unimodal_lt_wt_trial{i},6,[]),1,'omitnan')) - diff_norm_lt_wt{i};

    fishdata_vel_lt_wt{i} = [mean_velocity_unimodal_lt_wt_fish{i}' mean_velocity_lt_wt_fish{i}'];

    % mutant

    mat_velocity_lt_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    mean_velocity_lt_mut_trial{i} = mean(mat_velocity_lt_mut(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_lt_mut_fish{i} = mean(reshape(mean_velocity_lt_mut_trial{i},6,[]),1,'omitnan');

    mean_velocity_lowtap_mut_trial{i} = mean(v_matrix_lowtap_mutant(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_lowtap_mut_fish{i} = mean(reshape(mean_velocity_lowtap_mut_trial{i},6,[]),1,'omitnan');
    mean_velocity_flash_mut_trial{i} = mean(v_matrix_flash_mutant(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_flash_mut_fish{i} = mean(reshape(mean_velocity_flash_mut_trial{i},6,[]),1,'omitnan');
   
    mean_velocity_unimodal_lt_mut_trial{i} =  mean(unimodalsum_lowtap_mutant{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_lt_mut_fish{i} = (mean(reshape(mean_velocity_unimodal_lt_mut_trial{i},6,[]),1,'omitnan')) - diff_norm_lt_mut{i};

    fishdata_vel_lt_mut{i} = [mean_velocity_unimodal_lt_mut_fish{i}' mean_velocity_lt_mut_fish{i}'];

end    

% 87 db tap


for i = 1:length(SOA)
    current_name_MSI = ['velocity_' num2str(SOA(i)*1000) 'SOA_genotyped_ht'];
    current_MSI = eval(current_name_MSI);
    
    % wt

    mat_velocity_ht_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    mean_velocity_ht_wt_trial{i} = mean(mat_velocity_ht_wt(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_ht_wt_fish{i} = mean(reshape(mean_velocity_ht_wt_trial{i},6,[]),1,'omitnan');

    mean_velocity_hightap_wt_trial{i} = mean(v_matrix_hightap_wt(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_hightap_wt_fish{i} = mean(reshape(mean_velocity_hightap_wt_trial{i},6,[]),1,'omitnan');
    
    mean_velocity_unimodal_ht_wt_trial{i} =  mean(unimodalsum_hightap_wt{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_ht_wt_fish{i} = (mean(reshape(mean_velocity_unimodal_ht_wt_trial{i},6,[]),1,'omitnan')) - diff_norm_ht_wt{i};

    fishdata_vel_ht_wt{i} = [mean_velocity_unimodal_ht_wt_fish{i}' mean_velocity_ht_wt_fish{i}'];

    % mutant

    mat_velocity_ht_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    mean_velocity_ht_mut_trial{i} = mean(mat_velocity_ht_mut(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_ht_mut_fish{i} = mean(reshape(mean_velocity_ht_mut_trial{i},6,[]),1,'omitnan');

    mean_velocity_hightap_mut_trial{i} = mean(v_matrix_hightap_mutant(:,start_interval_avg(1):stop_interval_avg(1)),2,'omitnan');
    mean_velocity_hightap_mut_fish{i} = mean(reshape(mean_velocity_hightap_mut_trial{i},6,[]),1,'omitnan');
    
    mean_velocity_unimodal_ht_mut_trial{i} =  mean(unimodalsum_hightap_mutant{i}(:,start_interval_avg(i):stop_interval_avg(i)),2,'omitnan');
    mean_velocity_unimodal_ht_mut_fish{i} = (mean(reshape(mean_velocity_unimodal_ht_mut_trial{i},6,[]),1,'omitnan')) - diff_norm_ht_mut{i};

    fishdata_vel_ht_mut{i} = [mean_velocity_unimodal_ht_mut_fish{i}' mean_velocity_ht_mut_fish{i}'];

end    


%% Bar graphs average speed low tap experiments

% Use average of the mean

% For the statistics and bar graphs only take interval after stimulus onset

start_interval_avg = zeros(1,length(SOA));
stop_interval_avg = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval_avg(i) = 750 + (frame_rate * SOA(i))
    stop_interval_avg(i) = 800 + (frame_rate * SOA(i)) 
end

figure('Name', 'Bar graphs average velocity 82 db')

subplot(2,4,1)

mean_MSI_lt_wt_0 = mean(mean_velocity_lt_wt_fish{1}, 'omitnan');
sem_MSI_lt_wt_0 =  std(mean_velocity_lt_wt_fish{1}, 'omitnan')/sqrt(length(mean_velocity_lt_wt_fish{1}));
mean_unimodalsum_lt_wt_0 = mean(mean_velocity_unimodal_lt_wt_fish{1}, 'omitnan');
sem_unimodalsum_lt_wt_0 = std(mean_velocity_unimodal_lt_wt_fish{1}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_wt_fish{1}));

x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_wt_0, sem_unimodalsum_lt_wt_0, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_wt_0, sem_MSI_lt_wt_0 , 'LineWidth', 1, 'color','m');
hold on
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_wt_fish{1}, 'omitnan') mean(mean_velocity_lt_wt_fish{1}, 'omitnan')]);
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0];
b.CData(2,:) = [1 0 1];
hold on
title('wt: 0 SOA');
ylim([0,25]);
ylabel('mean distance (mm)');
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '0SOA'});

subplot(2,4,2)

mean_MSI_lt_wt_50 = mean(mean_velocity_lt_wt_fish{2}, 'omitnan');
sem_MSI_lt_wt_50 =  std(mean_velocity_lt_wt_fish{2}, 'omitnan')/sqrt(length(mean_velocity_lt_wt_fish{2}));
mean_unimodalsum_lt_wt_50 = mean(mean_velocity_unimodal_lt_wt_fish{2}, 'omitnan');
sem_unimodalsum_lt_wt_50 = std(mean_velocity_unimodal_lt_wt_fish{2}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_wt_fish{2}));

x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_wt_50, sem_unimodalsum_lt_wt_50, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_wt_50, sem_MSI_lt_wt_50 , 'LineWidth', 1, 'color','m');
hold on
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_wt_fish{2}, 'omitnan') mean(mean_velocity_lt_wt_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 50 SOA')
ylim([0,25])
ylabel('mean distance (mm)');
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '50SOA'});

subplot(2,4,3)
mean_MSI_lt_wt_100 = mean(mean_velocity_lt_wt_fish{3}, 'omitnan');
sem_MSI_lt_wt_100 =  std(mean_velocity_lt_wt_fish{3}, 'omitnan')/sqrt(length(mean_velocity_lt_wt_fish{3}));
mean_unimodalsum_lt_wt_100 = mean(mean_velocity_unimodal_lt_wt_fish{3}, 'omitnan');
sem_unimodalsum_lt_wt_100 = std(mean_velocity_unimodal_lt_wt_fish{3}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_wt_fish{3}));

x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_wt_100, sem_unimodalsum_lt_wt_100, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_wt_100, sem_MSI_lt_wt_100 , 'LineWidth', 1, 'color','m');
hold on  
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_wt_fish{3}, 'omitnan') mean(mean_velocity_lt_wt_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 100 SOA')
ylim([0,25])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '100SOA'});

subplot(2,4,4)
mean_MSI_lt_wt_150 = mean(mean_velocity_lt_wt_fish{4}, 'omitnan');
sem_MSI_lt_wt_150 =  std(mean_velocity_lt_wt_fish{4}, 'omitnan')/sqrt(length(mean_velocity_lt_wt_fish{4}));
mean_unimodalsum_lt_wt_150 = mean(mean_velocity_unimodal_lt_wt_fish{4}, 'omitnan');
sem_unimodalsum_lt_wt_150 = std(mean_velocity_unimodal_lt_wt_fish{4}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_wt_fish{4}));

x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_wt_150, sem_unimodalsum_lt_wt_150, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_wt_150, sem_MSI_lt_wt_150 , 'LineWidth', 1, 'color','m');
hold on  
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_wt_fish{4}, 'omitnan') mean(mean_velocity_lt_wt_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 150 SOA')
ylim([0,25])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '150SOA'});

subplot(2,4,5)
mean_MSI_lt_mut_0 = mean(mean_velocity_lt_mut_fish{1}, 'omitnan');
sem_MSI_lt_mut_0 =  std(mean_velocity_lt_mut_fish{1}, 'omitnan')/sqrt(length(mean_velocity_lt_mut_fish{1}));
mean_unimodalsum_lt_mut_0 = mean(mean_velocity_unimodal_lt_mut_fish{1}, 'omitnan');
sem_unimodalsum_lt_mut_0 = std(mean_velocity_unimodal_lt_mut_fish{1}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_mut_fish{1}));
x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_mut_0, sem_unimodalsum_lt_mut_0, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_mut_0, sem_MSI_lt_mut_0 , 'LineWidth', 1, 'color','m');
hold on  
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_mut_fish{1}, 'omitnan') mean(mean_velocity_lt_mut_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 0 SOA')
ylim([0,25])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '0SOA'});

subplot(2,4,6)
mean_MSI_lt_mut_50 = mean(mean_velocity_lt_mut_fish{2}, 'omitnan');
sem_MSI_lt_mut_50 =  std(mean_velocity_lt_mut_fish{2}, 'omitnan')/sqrt(length(mean_velocity_lt_mut_fish{2}));
mean_unimodalsum_lt_mut_50 = mean(mean_velocity_unimodal_lt_mut_fish{2}, 'omitnan');
sem_unimodalsum_lt_mut_50 = std(mean_velocity_unimodal_lt_mut_fish{2}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_mut_fish{2}));
x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_mut_50, sem_unimodalsum_lt_mut_50, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_mut_50, sem_MSI_lt_mut_50 , 'LineWidth', 1, 'color','m');
hold on    
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_mut_fish{2}, 'omitnan') mean(mean_velocity_lt_mut_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 50 SOA')
ylim([0,25])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '50SOA'});

subplot(2,4,7)
mean_MSI_lt_mut_100 = mean(mean_velocity_lt_mut_fish{3}, 'omitnan');
sem_MSI_lt_mut_100 =  std(mean_velocity_lt_mut_fish{3}, 'omitnan')/sqrt(length(mean_velocity_lt_mut_fish{3}));
mean_unimodalsum_lt_mut_100 = mean(mean_velocity_unimodal_lt_mut_fish{3}, 'omitnan');
sem_unimodalsum_lt_mut_100 = std(mean_velocity_unimodal_lt_mut_fish{3}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_mut_fish{3}));
x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_mut_100, sem_unimodalsum_lt_mut_100, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_mut_100, sem_MSI_lt_mut_100 , 'LineWidth', 1, 'color','m');
hold on        
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_mut_fish{3}, 'omitnan') mean(mean_velocity_lt_mut_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 100 SOA')
ylim([0,25])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '100SOA'});

subplot(2,4,8)
mean_MSI_lt_mut_150 = mean(mean_velocity_lt_mut_fish{4}, 'omitnan');
sem_MSI_lt_mut_150 =  std(mean_velocity_lt_mut_fish{4}, 'omitnan')/sqrt(length(mean_velocity_lt_mut_fish{4}));
mean_unimodalsum_lt_mut_150 = mean(mean_velocity_unimodal_lt_mut_fish{4}, 'omitnan');
sem_unimodalsum_lt_mut_150 = std(mean_velocity_unimodal_lt_mut_fish{4}, 'omitnan')/sqrt(length(mean_velocity_unimodal_lt_mut_fish{4}));
x_bar = [1 2]; 
hold on
errorbar(1,mean_unimodalsum_lt_mut_150, sem_unimodalsum_lt_mut_150, 'LineWidth', 1, 'color','#FF8800');
errorbar(2,mean_MSI_lt_mut_150, sem_MSI_lt_mut_150 , 'LineWidth', 1, 'color','m');
hold on         
b = bar(x_bar, [mean(mean_velocity_unimodal_lt_mut_fish{4}, 'omitnan') mean(mean_velocity_lt_mut_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 150 SOA')
ylim([0,25])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '150SOA'});

%% Bar graphs average speed high tap experiments

% Use average of the mean

% For the statistics and bar graphs only take interval after stimulus onset

figure('Name', 'Bar graphs average velocity 87 db')

subplot(2,4,1)

mean_MSI_ht_wt_0 = mean(mean_velocity_ht_wt_fish{1}, 'omitnan');
sem_MSI_ht_wt_0 = std(mean_velocity_ht_wt_fish{1}, 'omitnan')/sqrt(length(mean_velocity_ht_wt_fish{1}));
mean_unimodalsum_ht_wt_0 = mean(mean_velocity_unimodal_ht_wt_fish{1}, 'omitnan');
sem_unimodalsum_ht_wt_0 = std(mean_velocity_unimodal_ht_wt_fish{1}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_wt_fish{1}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_wt_0, sem_unimodalsum_ht_wt_0, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_wt_0, sem_MSI_ht_wt_0, 'LineWidth', 1, 'color','m');
hold on
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_wt_fish{1}, 'omitnan') mean(mean_velocity_ht_wt_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 0 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '0SOA'})

subplot(2,4,2)

mean_MSI_ht_wt_50 = mean(mean_velocity_ht_wt_fish{2}, 'omitnan');
sem_MSI_ht_wt_50 = std(mean_velocity_ht_wt_fish{2}, 'omitnan')/sqrt(length(mean_velocity_ht_wt_fish{2}));
mean_unimodalsum_ht_wt_50 = mean(mean_velocity_unimodal_ht_wt_fish{2}, 'omitnan');
sem_unimodalsum_ht_wt_50 = std(mean_velocity_unimodal_ht_wt_fish{2}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_wt_fish{2}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_wt_50, sem_unimodalsum_ht_wt_50, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_wt_50, sem_MSI_ht_wt_50, 'LineWidth', 1, 'color','m');
hold on
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_wt_fish{2}, 'omitnan') mean(mean_velocity_ht_wt_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 50 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '50SOA'})

subplot(2,4,3)
mean_MSI_ht_wt_100 = mean(mean_velocity_ht_wt_fish{3}, 'omitnan');
sem_MSI_ht_wt_100 = std(mean_velocity_ht_wt_fish{3}, 'omitnan')/sqrt(length(mean_velocity_ht_wt_fish{3}));
mean_unimodalsum_ht_wt_100 = mean(mean_velocity_unimodal_ht_wt_fish{3}, 'omitnan');
sem_unimodalsum_ht_wt_100 = std(mean_velocity_unimodal_ht_wt_fish{3}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_wt_fish{3}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_wt_100, sem_unimodalsum_ht_wt_100, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_wt_100, sem_MSI_ht_wt_100, 'LineWidth', 1, 'color','m');
hold on
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_wt_fish{3}, 'omitnan') mean(mean_velocity_ht_wt_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 100 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '100SOA'})

subplot(2,4,4)
mean_MSI_ht_wt_150 = mean(mean_velocity_ht_wt_fish{4}, 'omitnan');
sem_MSI_ht_wt_150 = std(mean_velocity_ht_wt_fish{4}, 'omitnan')/sqrt(length(mean_velocity_ht_wt_fish{4}));
mean_unimodalsum_ht_wt_150 = mean(mean_velocity_unimodal_ht_wt_fish{4}, 'omitnan');
sem_unimodalsum_ht_wt_150 = std(mean_velocity_unimodal_ht_wt_fish{4}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_wt_fish{4}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_wt_150, sem_unimodalsum_ht_wt_150, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_wt_150, sem_MSI_ht_wt_150, 'LineWidth', 1, 'color','m');
hold on  
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_wt_fish{4}, 'omitnan') mean(mean_velocity_ht_wt_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('wt: 150 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '150SOA'})

subplot(2,4,5)
mean_MSI_ht_mut_0 = mean(mean_velocity_ht_mut_fish{1}, 'omitnan');
sem_MSI_ht_mut_0 = std(mean_velocity_ht_mut_fish{1}, 'omitnan')/sqrt(length(mean_velocity_ht_mut_fish{1}));
mean_unimodalsum_ht_mut_0 = mean(mean_velocity_unimodal_ht_mut_fish{1}, 'omitnan');
sem_unimodalsum_ht_mut_0 = std(mean_velocity_unimodal_ht_mut_fish{1}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_mut_fish{1}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_mut_0, sem_unimodalsum_ht_mut_0, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_mut_0, sem_MSI_ht_mut_0, 'LineWidth', 1, 'color','m');
hold on  
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_mut_fish{1}, 'omitnan') mean(mean_velocity_ht_mut_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 0 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '0SOA'})

subplot(2,4,6)
mean_MSI_ht_mut_50 = mean(mean_velocity_ht_mut_fish{2}, 'omitnan');
sem_MSI_ht_mut_50 = std(mean_velocity_ht_mut_fish{2}, 'omitnan')/sqrt(length(mean_velocity_ht_mut_fish{2}));
mean_unimodalsum_ht_mut_50 = mean(mean_velocity_unimodal_ht_mut_fish{2}, 'omitnan');
sem_unimodalsum_ht_mut_50 = std(mean_velocity_unimodal_ht_mut_fish{2}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_mut_fish{2}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_mut_50, sem_unimodalsum_ht_mut_50, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_mut_50, sem_MSI_ht_mut_50, 'LineWidth', 1, 'color','m');
hold on     
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_mut_fish{2}, 'omitnan') mean(mean_velocity_ht_mut_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 50 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '50SOA'})

subplot(2,4,7)
mean_MSI_ht_mut_100 = mean(mean_velocity_ht_mut_fish{3}, 'omitnan');
sem_MSI_ht_mut_100 = std(mean_velocity_ht_mut_fish{3}, 'omitnan')/sqrt(length(mean_velocity_ht_mut_fish{3}));
mean_unimodalsum_ht_mut_100 = mean(mean_velocity_unimodal_ht_mut_fish{3}, 'omitnan');
sem_unimodalsum_ht_mut_100 = std(mean_velocity_unimodal_ht_mut_fish{3}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_mut_fish{3}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_mut_100, sem_unimodalsum_ht_mut_100, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_mut_100, sem_MSI_ht_mut_100, 'LineWidth', 1, 'color','m');
hold on     
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_mut_fish{3}, 'omitnan') mean(mean_velocity_ht_mut_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 100 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '100SOA'})

subplot(2,4,8)
mean_MSI_ht_mut_150 = mean(mean_velocity_ht_mut_fish{4}, 'omitnan');
sem_MSI_ht_mut_150 = std(mean_velocity_ht_mut_fish{4}, 'omitnan')/sqrt(length(mean_velocity_ht_mut_fish{4}));
mean_unimodalsum_ht_mut_150 = mean(mean_velocity_unimodal_ht_mut_fish{4}, 'omitnan');
sem_unimodalsum_ht_mut_150 = std(mean_velocity_unimodal_ht_mut_fish{4}, 'omitnan')/sqrt(length(mean_velocity_unimodal_ht_mut_fish{4}));
x_bar = [1 2]; 
hold on
errorbar(1, mean_unimodalsum_ht_mut_150, sem_unimodalsum_ht_mut_150, 'LineWidth', 1, 'color','#FF8800');
errorbar(2, mean_MSI_ht_mut_150, sem_MSI_ht_mut_150, 'LineWidth', 1, 'color','m');
hold on     
b = bar(x_bar, [mean(mean_velocity_unimodal_ht_mut_fish{4}, 'omitnan') mean(mean_velocity_ht_mut_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1.0 0.5333 0.0]
b.CData(2,:) = [1 0 1]
title('mutant: 150 SOA')
ylim([0,30])
ylabel('mean distance (mm)')
xticks(x_bar);
xticklabels({'Sum (tap + flash)', '150SOA'})



%% Statistical tests mean velocity

% Normalise before statistical tests

% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

% Average speed

ttest_velocity_lt_wt = zeros(1,length(SOA));
ttest_velocity_lt_mut = zeros(1,length(SOA));
ttest_velocity_ht_wt = zeros(1,length(SOA));
ttest_velocity_ht_mut = zeros(1,length(SOA));

for i = 1: length(SOA)
    [~,ttest_velocity_lt_wt(:,i)]= ttest(mean_velocity_lt_wt_fish{i}, mean_velocity_unimodal_lt_wt_fish{i})
    [~,ttest_velocity_lt_mut(:,i)]= ttest(mean_velocity_lt_mut_fish{i}, mean_velocity_unimodal_lt_mut_fish{i})
    [~,ttest_velocity_ht_wt(:,i)]= ttest(mean_velocity_ht_wt_fish{i}, mean_velocity_unimodal_ht_wt_fish{i})
    [~,ttest_velocity_ht_mut(:,i)]= ttest(mean_velocity_ht_mut_fish{i}, mean_velocity_unimodal_ht_mut_fish{i})
end

%% Statistical test difference between lowtap and hightap for higher MSI at 50 SOA

meanDiff_lowtap_50 = mean_velocity_lt_wt_fish{2} - mean_velocity_unimodal_lt_wt_fish{2};
meanDiff_hightap_50 = mean_velocity_ht_wt_fish{2} - mean_velocity_unimodal_ht_wt_fish{2};

[~,ttest_diffMSI_50] = ttest(meanDiff_lowtap_50, meanDiff_hightap_50)

%% MSI Interactive index (ii) 

% ii = (CM - SMmax)/SMmax * 100
% CM = mean response evoked by MSI, SMmax = mean response evoked by tap (highest unimodal response evoking)

num_fish_wt = size(mean_velocity_hightap_wt_fish{1},2);
num_fish_mut = size(mean_velocity_hightap_mut_fish{1},2);


ii_vel_lt_wt = zeros(1,length(SOA));
ii_vel_ht_wt = zeros(1,length(SOA));
ii_vel_lt_mut = zeros(1,length(SOA));
ii_vel_ht_mut = zeros(1,length(SOA));

ii_vel_lt_wt_sem = zeros(1,length(SOA));
ii_vel_ht_wt_sem =zeros(1,length(SOA));
ii_vel_lt_mut_sem = zeros(1,length(SOA));
ii_vel_ht_mut_sem = zeros(1,length(SOA));

ii_vel_lt_wt_stats = zeros(num_fish_wt,length(SOA));
ii_vel_ht_wt_stats = zeros(num_fish_wt,length(SOA));
ii_vel_lt_mut_stats = zeros(num_fish_mut,length(SOA));
ii_vel_ht_mut_stats = zeros(num_fish_mut,length(SOA));



for i = 1:length(SOA)   

    % Low tap wt  
    CM_lt_wt = mean(mean_velocity_lt_wt_fish{i}, 'omitnan');
    SMmax_lt_wt = mean(mean_velocity_lowtap_wt_fish{i},'omitnan');
    CM_lt_wt_sem =  std(mean_velocity_lt_wt_fish{i}, 'omitnan')/sqrt(length(mean_velocity_lt_wt_fish{i}));
    SMmax_lt_wt_sem =  std(mean_velocity_lowtap_wt_fish{i},'omitnan')/sqrt(length(mean_velocity_lowtap_wt_fish{i}));

    ii_vel_lt_wt(i) = ((CM_lt_wt-SMmax_lt_wt)*100)./SMmax_lt_wt;
    ii_vel_lt_wt_sem(i) = ((CM_lt_wt_sem-SMmax_lt_wt_sem)*100)./SMmax_lt_wt_sem;

    ii_vel_lt_wt_stats(:,i) = ((mean_velocity_lt_wt_fish{i} - mean_velocity_lowtap_wt_fish{i})*100)./mean_velocity_lowtap_wt_fish{i};
    
    % Low tap mutant
    CM_lt_mut = mean(mean_velocity_lt_mut_fish{i},'omitnan');
    SMmax_lt_mut = mean(mean_velocity_lowtap_mut_fish{i},'omitnan');
    CM_lt_mut_sem =  std(mean_velocity_lt_mut_fish{i}, 'omitnan')/sqrt(length(mean_velocity_lt_mut_fish{i}));
    SMmax_lt_mut_sem =  std(mean_velocity_lowtap_mut_fish{i}, 'omitnan')/sqrt(length(mean_velocity_lowtap_mut_fish{i}));
   
    ii_vel_lt_mut(i) = ((CM_lt_mut-SMmax_lt_mut)*100)./SMmax_lt_mut;
    ii_vel_lt_mut_sem(i) = ((CM_lt_mut_sem-SMmax_lt_mut_sem)*100)./SMmax_lt_mut_sem;

    ii_vel_lt_mut_stats(:,i) = ((mean_velocity_lt_mut_fish{i} - mean_velocity_lowtap_mut_fish{i})*100)./mean_velocity_lowtap_mut_fish{i};

    % High tap wt
    CM_ht_wt = mean(mean_velocity_ht_wt_fish{i},'omitnan');
    SMmax_ht_wt = mean(mean_velocity_hightap_wt_fish{i},'omitnan');    
    CM_ht_wt_sem =  std(mean_velocity_ht_wt_fish{i}, 'omitnan')/sqrt(length(mean_velocity_ht_wt_fish{i}));
    SMmax_ht_wt_sem =  std(mean_velocity_hightap_wt_fish{i}, 'omitnan')/sqrt(length(mean_velocity_hightap_wt_fish{i}));

    ii_vel_ht_wt(i) = ((CM_ht_wt-SMmax_ht_wt)*100)./SMmax_ht_wt;
    ii_vel_ht_wt_sem(i) = (( CM_ht_wt_sem-SMmax_ht_wt_sem)*100)./SMmax_ht_wt_sem;

    ii_vel_ht_wt_stats(:,i) = ((mean_velocity_ht_wt_fish{i} - mean_velocity_hightap_wt_fish{i})*100)./mean_velocity_hightap_wt_fish{i};

    % High tap mutant
    CM_ht_mut = mean(mean_velocity_ht_mut_fish{i}, 'omitnan');
    SMmax_ht_mut = mean(mean_velocity_hightap_mut_fish{i},'omitnan');    
    CM_ht_mut_sem =  std(mean_velocity_ht_mut_fish{i}, 'omitnan')/sqrt(length(mean_velocity_ht_mut_fish{i}));
    SMmax_ht_mut_sem =  std(mean_velocity_hightap_mut_fish{i}, 'omitnan')/sqrt(length(mean_velocity_hightap_mut_fish{i}));

    ii_vel_ht_mut(i) = ((CM_ht_mut-SMmax_ht_mut)*100)./SMmax_ht_mut;
    ii_vel_ht_mut_sem(i) = (( CM_ht_mut_sem-SMmax_ht_mut_sem)*100)./SMmax_ht_mut_sem;

    ii_vel_ht_mut_stats(:,i) = ((mean_velocity_ht_mut_fish{i} - mean_velocity_hightap_mut_fish{i})*100)./mean_velocity_hightap_mut_fish{i};


end

%------------ Plot mean interactive index of all conditions----------

figure('Name', 'Multisensory interactive index - velocity');

offset = 5
x = (SOA * 1000) - offset;  

subplot(2,1,1)

errorbar((SOA*1000) - offset, ii_vel_lt_wt, ii_vel_lt_wt_sem , 'o', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, ii_vel_lt_mut, ii_vel_lt_mut_sem,'o', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA (ms)')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-20,60])
yline([0], '--k')
title('82 db')
legend('wild-type 82 db', 'mutant 82 db')

subplot(2,1,2)


errorbar((SOA*1000) - offset, ii_vel_ht_wt, ii_vel_ht_wt_sem,'^', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, ii_vel_ht_mut, ii_vel_ht_mut_sem,'^', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-20,60])
yline([0], '--k')
title('87 db')
legend('wild-type 87 db', 'mutant 87 db')

%% Violin plots for interactive index

% ------------------------- Plot violin plots 87 db --------------------

data_ht = [
    ii_vel_ht_wt(:);
    ii_vel_ht_mut(:)];

% Number of samples per matrix

n_ht_wt = numel(ii_vel_ht_wt);
n_ht_mut = numel(ii_vel_ht_mut);


% SOA labels for each matrix (x-axis groups)

soa_ht_wt = repmat( ...
    categorical({'0 SOA','50 SOA','100 SOA','150 SOA'},soa_order), ...
    size(ii_vel_ht_wt,1), 1);

soa_ht_mut = repmat( ...
    categorical({'0 SOA','50 SOA','100 SOA','150 SOA'},soa_order), ...
    size(ii_vel_ht_mut,1), 1);

% Combine SOA labels
soa_labels_ht = [
    soa_ht_wt(:);
    soa_ht_mut(:)
];

soa_labels_ht = categorical(soa_labels_ht, soa_order, 'Ordinal', true);

% Condition labels (color groups)
cond_labels_ht = [
    repmat(categorical("wild-type 87 db"),  n_ht_wt,1);
    repmat(categorical("mutant 87 db"), n_ht_mut,1)];

subplot(2,1,2)
hold on
ax = gca;  % lock current axes
ax.ColorOrder = [0 0.4470 0.7410; 0.8500 0 0];       
ax.NextPlot = 'replacechildren';

v = violinplot(soa_labels_ht, data_ht, GroupByColor=cond_labels_ht);
ylabel('ii (%)')
yline(0,'--k');
ylim([-300 600])
title ('Interactive index velocity 87 db')
h1_ht = line(ax, nan, nan, 'LineWidth', 2, ...
    'Color', [0 0.4470 0.7410]);

h2_ht = line(ax, nan, nan, 'LineWidth', 2, ...
    'Color', [ 0.8500 0 0]);

legend(ax, [h1_ht h2_ht], ...
    {'wild-type', 'mutant'}, ...
    'Location', 'best')
box off

set(gca,'LineWidth',1.2,'FontSize',8)

%------------ Plot mean interactive index of all conditions----------

figure('Name', 'Multisensory interactive index - velocity');

offset = 5
x = (SOA * 1000) - offset;  

subplot(2,1,1)

ii_vel_lt_wt(~isfinite(ii_vel_lt_wt)) = NaN;
mean_ii_vel_lt_wt = mean(ii_vel_lt_wt,1,'omitnan');
sem_ii_vel_lt_wt =  std(ii_vel_lt_wt, 'omitnan')/sqrt(length(ii_vel_lt_wt));

ii_vel_lt_mut(~isfinite(ii_vel_lt_mut)) = NaN;
mean_ii_vel_lt_mut = mean(ii_vel_lt_mut,1,'omitnan');
sem_ii_vel_lt_mut =  std(ii_vel_lt_mut, 'omitnan')/sqrt(length(ii_vel_lt_mut));

errorbar((SOA*1000) - offset, mean_ii_vel_lt_wt, sem_ii_vel_lt_wt , 'o', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, mean_ii_vel_lt_mut, sem_ii_vel_lt_mut,'o', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-100,800])
yline([0], '--k')
title('82 db')
legend('wild-type 82 db', 'mutant 82 db')

subplot(2,1,2)

ii_vel_ht_wt(~isfinite(ii_vel_ht_wt)) = NaN;
mean_ii_vel_ht_wt = mean(ii_vel_ht_wt,1,'omitnan');
sem_ii_vel_ht_wt =  std(ii_vel_ht_wt, 'omitnan')/sqrt(length(ii_vel_ht_wt));

ii_vel_ht_mut(~isfinite(ii_vel_ht_mut)) = NaN;
mean_ii_vel_ht_mut = mean(ii_vel_ht_mut,1,'omitnan');
sem_ii_vel_ht_mut =  std(ii_vel_ht_mut, 'omitnan')/sqrt(length(ii_vel_ht_mut));

errorbar((SOA*1000) - offset, mean_ii_vel_ht_wt, sem_ii_vel_ht_wt,'^', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, mean_ii_vel_ht_mut, sem_ii_vel_ht_mut,'^', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-100,800])
yline([0], '--k')
title('87 db')
legend('wild-type 87 db', 'mutant 87 db')

%% Linear mixed model ii

WT = ii_vel_lt_wt_stats(:,3);
MUT = ii_vel_lt_mut_stats(:,3);

Response = [WT(:); MUT(:)];

Genotype = [ ...
    repmat("WT",length(WT),1);
    repmat("MUT",length(MUT),1)];

WTanimal = repelem((1:95)',6);
MUTanimal = repelem((96:168)',6);

AnimalID = [WTanimal; MUTanimal];

tbl = table(Response,Genotype,AnimalID);

lme = fitlme(tbl,...
    'Response ~ Genotype + (1|AnimalID)');

lme.Coefficients

%% Statistics interactive index
% Difference between mutant and wildtype for each SOA (t-test)

ranksum_vel_lt = zeros(1,length(SOA));
ranksum_vel_ht = zeros(1,length(SOA));

for i = 1: length(SOA)
    ranksum_vel_lt(i)= ranksum(ii_vel_lt_wt_stats(:,i), ii_vel_lt_mut_stats(:,i))
    ranksum_vel_ht(i)= ranksum(ii_vel_ht_wt_stats(:,i),ii_vel_ht_mut_stats(:,i))
end

%% Difference from 0 interactive index 

signrank_vel_lt_wt_ii = zeros(1,length(SOA));
signrank_vel_ht_wt_ii = zeros(1,length(SOA));
signrank_vel_lt_mut_ii = zeros(1,length(SOA));
signrank_vel_ht_mut_ii = zeros(1,length(SOA));

for i = 1: length(SOA)
    signrank_vel_lt_wt_ii(i)= signrank(ii_vel_lt_wt_stats(:,i))
    signrank_vel_ht_wt_ii(i)= signrank(ii_vel_ht_wt_stats(:,i))
    signrank_vel_lt_mut_ii(i)= signrank(ii_vel_lt_mut_stats(:,i))
    signrank_vel_ht_mut_ii(i)= signrank(ii_vel_ht_mut_stats(:,i))
    
end
%% ANOVA interactive index

ii_vel_lt_wt_clean = rmmissing(ii_vel_lt_wt_stats);
ii_vel_lt_mut_clean= rmmissing(ii_vel_lt_mut_stats);
ii_vel_ht_wt_clean= rmmissing(ii_vel_ht_wt_stats);
ii_vel_ht_mut_clean= rmmissing(ii_vel_ht_mut_stats);

 Difference between the SOAs for both the wt and mutant (one-way ANOVA)

group_labels = {'0 SOA', '50 SOA', '100 SOA' ,'150 SOA'}

[p_anov_vel_lt_wt,tbl_anov_vel_lt_wt,stats_anov_vel_lt_wt] = anova1(ii_vel_lt_wt_clean,group_labels)
[p_anov_vel_lt_mut,tbl_anov_vel_lt_mut,stats_anov_vel_lt_mut] = anova1(ii_vel_lt_mut_clean,group_labels)
[p_anov_vel_ht_wt,tbl_anov_vel_ht_wt,stats_anov_vel_ht_wt] = anova1(ii_vel_ht_wt_clean,group_labels)
[p_anov_vel_ht_mut,tbl_anov_vel_ht_mut,stats_anov_vel_ht_mut] = anova1(ii_vel_ht_mut_clean,group_labels)

signrank_SOA_050 = signrank(ii_vel_ht_mut_stats(:,1), ii_vel_ht_mut_stats(:,2))

% Post-hoc tests for the anova tests that were significant

[c_lt_wt, m_lt_wt] = multcompare(stats_anov_vel_lt_wt)


% Test difference between 82 db and 87 db, singranktests. Compare for each SOA the ii
% between lowtap and hightap

singrank_vel_lt = zeros(1,length(SOA));
singrank_vel_ht = zeros(1,length(SOA));

for i = 1: length(SOA)
    singrank_vel_wt(i)= ranksum(ii_vel_lt_wt_stats(:,i), ii_vel_ht_wt_stats(:,i))
    singrank_vel_mut(i)= ranksum(ii_vel_lt_mut_stats(:,i),ii_vel_ht_mut_stats(:,i))
end


%% MSI Multisensory index (MI)

% MI = VA - (V+A)
% VA = multisensory response, V = response to visual stimulus, A = response to auditory stimulus
% MI > 0 = supralinear
% MI < 0 = sublinear


MI_vel_lt_wt = zeros(1,length(SOA));
MI_vel_ht_wt = zeros(1,length(SOA));
MI_vel_lt_mut = zeros(1,length(SOA));
MI_vel_ht_mut = zeros(1,length(SOA));

MI_vel_lt_wt_sem = zeros(1,length(SOA));
MI_vel_ht_wt_sem =zeros(1,length(SOA));
MI_vel_lt_mut_sem = zeros(1,length(SOA));
MI_vel_ht_mut_sem = zeros(1,length(SOA));

MI_vel_lt_wt_stats = zeros(num_fish_wt,length(SOA));
MI_vel_ht_wt_stats = zeros(num_fish_wt,length(SOA));
MI_vel_lt_mut_stats = zeros(num_fish_mut,length(SOA));
MI_vel_ht_mut_stats = zeros(num_fish_mut,length(SOA));



for i = 1:length(SOA)   

    % Low tap wt  
    VA_lt_wt = mean(mean_velocity_lt_wt_fish{i}, 'omitnan');
    A_lt_wt = mean(mean_velocity_lowtap_wt_fish{i},'omitnan');
    V_lt_wt = mean(mean_velocity_flash_wt_fish{i},'omitnan');

    VA_lt_wt_sem =  std(mean_velocity_lt_wt_fish{i}, 'omitnan')/sqrt(length(mean_velocity_lt_wt_fish{i}));
    A_lt_wt_sem =  std(mean_velocity_lowtap_wt_fish{i},'omitnan')/sqrt(length(mean_velocity_lowtap_wt_fish{i}));
    V_lt_wt_sem = std(mean_velocity_flash_wt_fish{i},'omitnan')/sqrt(length(mean_velocity_flash_wt_fish{i}));

    MI_vel_lt_wt(i) = VA_lt_wt - (V_lt_wt + A_lt_wt);
    MI_vel_lt_wt_sem(i) = VA_lt_wt_sem - (V_lt_wt_sem + A_lt_wt_sem);

    MI_vel_lt_wt_stats(:,i) = mean_velocity_lt_wt_fish{i} - (mean_velocity_flash_wt_fish{i} + mean_velocity_lowtap_wt_fish{i});

    
    % Low tap mutant
    VA_lt_mut = mean(mean_velocity_lt_mut_fish{i}, 'omitnan');
    A_lt_mut = mean(mean_velocity_lowtap_mut_fish{i},'omitnan');
    V_lt_mut = mean(mean_velocity_flash_mut_fish{i},'omitnan');

    VA_lt_mut_sem =  std(mean_velocity_lt_mut_fish{i}, 'omitnan')/sqrt(length(mean_velocity_lt_mut_fish{i}));
    A_lt_mut_sem =  std(mean_velocity_lowtap_mut_fish{i},'omitnan')/sqrt(length(mean_velocity_lowtap_mut_fish{i}));
    V_lt_mut_sem = std(mean_velocity_flash_mut_fish{i},'omitnan')/sqrt(length(mean_velocity_flash_mut_fish{i}));

    MI_vel_lt_mut(i) = VA_lt_mut - (V_lt_mut + A_lt_mut);
    MI_vel_lt_mut_sem(i) = VA_lt_mut_sem - (V_lt_mut_sem + A_lt_mut_sem);

    MI_vel_lt_mut_stats(:,i) = mean_velocity_lt_mut_fish{i} - (mean_velocity_flash_mut_fish{i} + mean_velocity_lowtap_mut_fish{i});

    % High tap wt
    VA_ht_wt = mean(mean_velocity_ht_wt_fish{i}, 'omitnan');
    A_ht_wt = mean(mean_velocity_hightap_wt_fish{i},'omitnan');
    V_ht_wt = mean(mean_velocity_flash_wt_fish{i},'omitnan');

    VA_ht_wt_sem =  std(mean_velocity_ht_wt_fish{i}, 'omitnan')/sqrt(length(mean_velocity_ht_wt_fish{i}));
    A_ht_wt_sem =  std(mean_velocity_hightap_wt_fish{i},'omitnan')/sqrt(length(mean_velocity_hightap_wt_fish{i}));
    V_ht_wt_sem = std(mean_velocity_flash_wt_fish{i},'omitnan')/sqrt(length(mean_velocity_flash_wt_fish{i}));

    MI_vel_ht_wt(i) = VA_ht_wt - (V_ht_wt + A_ht_wt);
    MI_vel_ht_wt_sem(i) = VA_ht_wt_sem - (V_ht_wt_sem + A_ht_wt_sem);

    MI_vel_ht_wt_stats(:,i) = mean_velocity_ht_wt_fish{i} - (mean_velocity_flash_wt_fish{i} + mean_velocity_hightap_wt_fish{i});

    % High tap mutant
    VA_ht_mut = mean(mean_velocity_ht_mut_fish{i}, 'omitnan');
    A_ht_mut = mean(mean_velocity_hightap_mut_fish{i},'omitnan');
    V_ht_mut = mean(mean_velocity_flash_mut_fish{i},'omitnan');

    VA_ht_mut_sem =  std(mean_velocity_ht_mut_fish{i}, 'omitnan')/sqrt(length(mean_velocity_ht_mut_fish{i}));
    A_ht_mut_sem =  std(mean_velocity_hightap_mut_fish{i},'omitnan')/sqrt(length(mean_velocity_hightap_mut_fish{i}));
    V_ht_mut_sem = std(mean_velocity_flash_mut_fish{i},'omitnan')/sqrt(length(mean_velocity_flash_mut_fish{i}));

    MI_vel_ht_mut(i) = VA_ht_mut - (V_ht_mut + A_ht_mut);
    MI_vel_ht_mut_sem(i) = VA_ht_mut_sem - (V_ht_mut_sem + A_ht_mut_sem);

    MI_vel_ht_mut_stats(:,i) = mean_velocity_ht_mut_fish{i} - (mean_velocity_flash_mut_fish{i} + mean_velocity_hightap_mut_fish{i});


end

%------------ Plot mean MI of all conditions----------

figure('Name', 'Multisensory index - velocity');

offset = 5
x = (SOA * 1000) - offset;  

subplot(2,1,1)

errorbar((SOA*1000) - offset, MI_vel_lt_wt, MI_vel_lt_wt_sem , 'o', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, MI_vel_lt_mut, MI_vel_lt_mut_sem,'o', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA (ms)')
ylabel('Multisensory index (mm)')
xlim([-50,200])
ylim([-4,4])
yline([0], '--k')
title('82 db')
legend('wild-type 82 db', 'mutant 82 db')

subplot(2,1,2)


errorbar((SOA*1000) - offset, MI_vel_ht_wt, MI_vel_ht_wt_sem,'^', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, MI_vel_ht_mut, MI_vel_ht_mut_sem,'^', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA')
ylabel('Multisensory index (mm)')
xlim([-50,200])
ylim([-4,4])
yline([0], '--k')
title('87 db')
legend('wild-type 87 db', 'mutant 87 db')


%% Statistics MI
% Difference between mutant and wildtype for each SOA (t-test)
% Data is normaly distibuted (checked with lillie test)

%Linear mixed model MI

WT = MI_vel_ht_wt_stats(:,4);
MUT = MI_vel_ht_mut_stats(:,4);

Response = [WT(:); MUT(:)];

Genotype = [ ...
    repmat("WT",length(WT),1);
    repmat("MUT",length(MUT),1)];

WTanimal = repelem((1:95)',6);
MUTanimal = repelem((96:168)',6);

AnimalID = [WTanimal; MUTanimal];

tbl = table(Response,Genotype,AnimalID);

lme = fitlme(tbl,...
    'Response ~ Genotype + (1|AnimalID)');

lme.Coefficients


% Difference between MI and 0 for wt and mutant each SOA:
% using ttest(x) it will test wthether the mean is significantly different from zero

ttest_vel_lt_wt_MI = zeros(1,length(SOA));
ttest_vel_ht_wt_MI = zeros(1,length(SOA));
ttest_vel_lt_mut_MI = zeros(1,length(SOA));
ttest_vel_ht_mut_MI = zeros(1,length(SOA));

for i = 1: length(SOA)
    [~,ttest_vel_lt_wt_MI(i)]= ttest(MI_vel_lt_wt_stats(:,i))
    [~,ttest_vel_ht_wt_MI(i)]= ttest(MI_vel_ht_wt_stats(:,i))
    [~,ttest_vel_lt_mut_MI(i)]= ttest(MI_vel_lt_mut_stats(:,i))
    [~,ttest_vel_ht_mut_MI(i)]= ttest(MI_vel_ht_mut_stats(:,i))
    
end


% Difference between the SOAs for both the wt and mutant (one-way ANOVA)


MI_vel_lt_wt_clean = rmmissing(MI_vel_lt_wt_stats);
MI_vel_lt_mut_clean= rmmissing(MI_vel_lt_mut_stats);
MI_vel_ht_wt_clean= rmmissing(MI_vel_ht_wt_stats);
MI_vel_ht_mut_clean= rmmissing(MI_vel_ht_mut_stats);



group_labels = {'0 SOA', '50 SOA', '100 SOA' ,'150 SOA'}

[p_anov_vel_lt_wt,tbl_anov_vel_lt_wt,stats_anov_vel_lt_wt] = anova1(MI_vel_lt_wt_clean,group_labels)
[p_anov_vel_lt_mut,tbl_anov_vel_lt_mut,stats_anov_vel_lt_mut] = anova1(MI_vel_lt_mut_clean,group_labels)
[p_anov_vel_ht_wt,tbl_anov_vel_ht_wt,stats_anov_vel_ht_wt] = anova1(MI_vel_ht_wt_clean,group_labels)
[p_anov_vel_ht_mut,tbl_anov_vel_ht_mut,stats_anov_vel_ht_mut] = anova1(MI_vel_ht_mut_clean,group_labels)


signrank_SOA_050 = signrank(MI_vel_lt_mut_stats(:,1), MI_vel_lt_mut_stats(:,4))

% Post-hoc tests for the anova tests that were significant
[c_lt_wt, m_lt_wt] = multcompare(stats_anov_vel_lt_wt)

% This gives s ignificant difference between 0 SOA and 50 SOA in MI, which
% makes sense! It also gives a significant difference between 50 and 100
% SOA. 


% Test between 82 db and 87 db, singranktests. Compare for each SOA the MI
% between lowtap and hightap


singrank_vel_wt_MI = zeros(1,length(SOA));
singrank_vel_mut_MI = zeros(1,length(SOA));

for i = 1: length(SOA)
    singrank_vel_wt_MI(i)= ranksum(MI_vel_lt_wt_stats(:,i), MI_vel_ht_wt_stats(:,i))
    singrank_vel_mut_MI(i)= ranksum(MI_vel_lt_mut_stats(:,i),MI_vel_ht_mut_stats(:,i))
end

%% Projection plot 82 db

% figure with 4 plots, one for each SOA --> 2 figures (82 db & 87 db)

figure('Name', 'Projection plot velocity: 82 db')

% Identity line --> points above the line have higher velocity for multisensory than
% unimodal (shows MSI). Calculate distances of each point to the identity
% line

% 0 SOA
subplot(2,2,1)

scatter(fishdata_vel_lt_wt{1}(:,1),fishdata_vel_lt_wt{1}(:,2),'b')
hold on
scatter(fishdata_vel_lt_mut{1}(:,1),fishdata_vel_lt_mut{1}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('0 SOA')
xlabel('Sum (tap + flash)')
xlim([-2 40])
ylim([-2 40])
ylabel('MSI')
legend('wild-type', 'mutant')

% 50 SOA
subplot(2,2,2)

scatter(fishdata_vel_lt_wt{2}(:,1),fishdata_vel_lt_wt{2}(:,2),'b')
hold on
scatter(fishdata_vel_lt_mut{2}(:,1),fishdata_vel_lt_mut{2}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('50 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
xlim([-2 40])
ylim([-2 40])
legend('wild-type', 'mutant')

% 100 SOA
subplot(2,2,3)

scatter(fishdata_vel_lt_wt{3}(:,1),fishdata_vel_lt_wt{3}(:,2),'b')
hold on
scatter(fishdata_vel_lt_mut{3}(:,1),fishdata_vel_lt_mut{3}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('100 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
xlim([-2 40])
ylim([-2 40])
legend('wild-type', 'mutant')

% 150 SOA
subplot(2,2,4)

scatter(fishdata_vel_lt_wt{4}(:,1),fishdata_vel_lt_wt{4}(:,2),'b')
hold on
scatter(fishdata_vel_lt_mut{4}(:,1),fishdata_vel_lt_mut{4}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('150 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
xlim([-2 40])
ylim([-2 40])
legend('wild-type', 'mutant')

%-------------------------------------------------------------------------%
% Compare the distributions of the distances between points and reference
% line between wt and mutants

for i = 1:length(SOA)

    % Coordinates
    x_lt_wt = fishdata_vel_lt_wt{i}(:,1);
    y_lt_wt = fishdata_vel_lt_wt{i}(:,2);

    x_lt_mut = fishdata_vel_lt_mut{i}(:,1);
    y_lt_mut = fishdata_vel_lt_mut{i}(:,2);
    % Line coefficients: Ax + By + C = 0
    A = 1;
    B = -1;
    C = 0;

    % Perpendicular distance
    distanceLine_lt_wt{i} = (A*x_lt_wt + B*y_lt_wt + C) ./ sqrt(A^2 + B^2);
    distanceLine_lt_mut{i} = (A*x_lt_mut + B*y_lt_mut + C) ./ sqrt(A^2 + B^2);
end

% Curve showing how distances are distributed
figure('Name', 'Distribution distances from line velocity: 82 db')

subplot(2,2,1)

% Points above the reference line will be positive distances --> MSI

[f_0SOA_lt_wt, xi_0SOA_lt_wt] = ksdensity(distanceLine_lt_wt{1});
[f_0SOA_lt_mut, xi_0SOA_lt_mut] = ksdensity(distanceLine_lt_mut{1});

plot( xi_0SOA_lt_wt,f_0SOA_lt_wt,'b')
hold on
plot( xi_0SOA_lt_mut,f_0SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('0 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

subplot(2,2,2)

[f_50SOA_lt_wt, xi_50SOA_lt_wt] = ksdensity(distanceLine_lt_wt{2});
[f_50SOA_lt_mut, xi_50SOA_lt_mut] = ksdensity(distanceLine_lt_mut{2});

plot( xi_50SOA_lt_wt,f_50SOA_lt_wt,'b')
hold on
plot( xi_50SOA_lt_mut,f_50SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('50 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

subplot(2,2,3)

[f_100SOA_lt_wt, xi_100SOA_lt_wt] = ksdensity(distanceLine_lt_wt{3});
[f_100SOA_lt_mut, xi_100SOA_lt_mut] = ksdensity(distanceLine_lt_mut{3});

plot( xi_100SOA_lt_wt,f_100SOA_lt_wt,'b')
hold on
plot( xi_100SOA_lt_mut,f_100SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('100 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

subplot(2,2,4)

[f_150SOA_lt_wt, xi_150SOA_lt_wt] = ksdensity(distanceLine_lt_wt{4});
[f_150SOA_lt_mut, xi_150SOA_lt_mut] = ksdensity(distanceLine_lt_mut{4});

plot(xi_150SOA_lt_wt,f_150SOA_lt_wt,'b')
hold on 
plot(xi_150SOA_lt_mut,f_150SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('150 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off
%% Projection plot 87 db

figure('Name', 'Projection plot velocity 87 db')

% Identity line --> points above the line have higher velocity for multisensory than
% unimodal (shows MSI). Calculate distances of each point to the identity
% line

% 0 SOA
subplot(2,2,1)

scatter(fishdata_vel_ht_wt{1}(:,1),fishdata_vel_ht_wt{1}(:,2),'b')
hold on
scatter(fishdata_vel_ht_mut{1}(:,1),fishdata_vel_ht_mut{1}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('0 SOA')
xlabel('Sum (tap + flash)')
xlim([-5 70])
ylim([-5 70])
ylabel('MSI')
legend('wild-type', 'mutant')

% 50 SOA
subplot(2,2,2)

scatter(fishdata_vel_ht_wt{2}(:,1),fishdata_vel_ht_wt{2}(:,2),'b')
hold on
scatter(fishdata_vel_ht_mut{2}(:,1),fishdata_vel_ht_mut{2}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('50 SOA')
xlabel('Sum (tap + flash)')
xlim([-5 70])
ylim([-5 70])
ylabel('MSI')
legend('wild-type', 'mutant')

% 100 SOA
subplot(2,2,3)

scatter(fishdata_vel_ht_wt{3}(:,1),fishdata_vel_ht_wt{3}(:,2),'b')
hold on
scatter(fishdata_vel_ht_mut{3}(:,1),fishdata_vel_ht_mut{3}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('100 SOA')
xlabel('Sum (tap + flash)')
xlim([-5 70])
ylim([-5 70])
ylabel('MSI')
legend('wild-type', 'mutant')

% 150 SOA
subplot(2,2,4)

scatter(fishdata_vel_ht_wt{4}(:,1),fishdata_vel_ht_wt{4}(:,2),'b')
hold on
scatter(fishdata_vel_ht_mut{4}(:,1),fishdata_vel_ht_mut{4}(:,2),'r')
identityline = xlim;
plot(identityline,identityline,'--k')
title('150 SOA')
xlabel('Sum (tap + flash)')
xlim([-5 70])
ylim([-5 70])
ylabel('MSI')
legend('wild-type', 'mutant')

%-------------------------------------------------------------------------%
% Compare the distributions of the distances between points and reference
% line between wt and mutants

for i = 1:length(SOA)

    % Coordinates
    x_ht_wt = fishdata_vel_ht_wt{i}(:,1);
    y_ht_wt = fishdata_vel_ht_wt{i}(:,2);

    x_ht_mut = fishdata_vel_ht_mut{i}(:,1);
    y_ht_mut = fishdata_vel_ht_mut{i}(:,2);
    % Line coefficients: Ax + By + C = 0
    A = 1;
    B = -1;
    C = 0;

    % Perpendicular distance
    distanceLine_ht_wt{i} = (A*x_ht_wt + B*y_ht_wt + C) ./ sqrt(A^2 + B^2);
    distanceLine_ht_mut{i} = (A*x_ht_mut + B*y_ht_mut + C) ./ sqrt(A^2 + B^2);
end

% Curve showing how distances are distributed
figure('Name', 'Distribution distances from line velocity: 87 db')

subplot(2,2,1)

[f_0SOA_ht_wt, xi_0SOA_ht_wt] = ksdensity(distanceLine_ht_wt{1});
[f_0SOA_ht_mut, xi_0SOA_ht_mut] = ksdensity(distanceLine_ht_mut{1});

plot( xi_0SOA_ht_wt,f_0SOA_ht_wt,'b')
hold on
plot( xi_0SOA_ht_mut,f_0SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('0 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

subplot(2,2,2)

[f_50SOA_ht_wt, xi_50SOA_ht_wt] = ksdensity(distanceLine_ht_wt{2});
[f_50SOA_ht_mut, xi_50SOA_ht_mut] = ksdensity(distanceLine_ht_mut{2});

plot( xi_50SOA_ht_wt,f_50SOA_ht_wt,'b')
hold on
plot( xi_50SOA_ht_mut,f_50SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('50 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

subplot(2,2,3)

[f_100SOA_ht_wt, xi_100SOA_ht_wt] = ksdensity(distanceLine_ht_wt{3});
[f_100SOA_ht_mut, xi_100SOA_ht_mut] = ksdensity(distanceLine_ht_mut{3});

plot( xi_100SOA_ht_wt,f_100SOA_ht_wt,'b')
hold on
plot( xi_100SOA_ht_mut,f_100SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('100 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

subplot(2,2,4)

[f_150SOA_ht_wt, xi_150SOA_ht_wt] = ksdensity(distanceLine_ht_wt{4});
[f_150SOA_ht_mut, xi_150SOA_ht_mut] = ksdensity(distanceLine_ht_mut{4});

plot(xi_150SOA_ht_wt,f_150SOA_ht_wt,'b')
hold on 
plot(xi_150SOA_ht_mut,f_150SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('150 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-25 25])
ylim([-0.01 0.08])
box off

%% Statistical tests differences in distribution

% Calculate statistics for difference in distribution wt vs mutant for all
% SOAs
% Ranksum used because here wt's are compared to mutants, two independent
% groups with different sample sizes. 
% Ranksum is good for independent groups with unequal sample sizes

ttest_distr_lt = zeros(1,length(SOA));
ttest_distr_ht = zeros(1,length(SOA));

% Lillie test showed data is distributed normally

for i = 1: length(SOA)
    [~,ttest_distr_lt(:,i)] = ttest2(distanceLine_lt_wt{i}, distanceLine_lt_mut{i})
    [~,ttest_distr_ht(:,i)] = ttest2(distanceLine_ht_wt{i}, distanceLine_ht_mut{i})
end

