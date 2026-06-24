%% Script to analyse MSI SOA data - Distance travelled
% By me :)

clearvars
close all
clc

%% Get data and divide trials by condition

run('D:\Emma_Conrad\grab_data_MSI.m')

%% Find distance travelled for each condition

% Select bout types to include

selected_bouttypes = [1 2 3 4 5 6 7 8 9 10 11 12 13]

% Distance of 82 db only tap conditions

distance_lowtap = cell(1,length(trials_lowtap));

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
                distance_lowtap{batchID}{wellID_lowtap}{trialID} = vid_data{batchID}{wellID_lowtap}{trialID_lowtap}(57,:);
            else
                distance_lowtap{batchID}{wellID_lowtap}{trialID} = NaN(1,1500);
                
            end
        end    
    end        
end



% Distance of 87 db only tap conditions

distance_hightap = cell(1,length(trials_hightap));

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
                distance_hightap{batchID}{wellID_hightap}{trialID} = vid_data{batchID}{wellID_hightap}{trialID_hightap}(57,:);
            else
                distance_hightap{batchID}{wellID_hightap}{trialID} = NaN(1,1500);
                
            end
               
            end
    end        
end

% Distance of flash conditions
distance_flash = cell(1,length(trials_flash));

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
                distance_flash{batchID}{wellID_flash}{trialID} = vid_data{batchID}{wellID_flash}{trialID_flash}(57,:);
            else
                distance_flash{batchID}{wellID_flash}{trialID} = NaN(1,1500);
                
            end
        end
    end        
end

% Distance of MSI 0 SOA conditions - 82 db
 distance_0SOA_lt = cell(1,length(trials_0SOA_lt));

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
                distance_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = vid_data{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt}(57,:);
            else
                distance_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = NaN(1,1500);
                
            end

       end
    end        
end

% Distance of MSI 50 SOA conditions - 82 db

distance_50SOA_lt = cell(1,length(trials_50SOA_lt));

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
                distance_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = vid_data{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt}(57,:);
            else
                distance_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = NaN(1,1500);       
            end
        end
    end        
end

% Distance of MSI 100 SOA conditions - 82 db

distance_100SOA_lt = cell(1,length(trials_100SOA_lt));


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
                distance_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = vid_data{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt}(57,:);
            else
                distance_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = NaN(1,1500);
                
            end

        end
    end        
end

% Distance of MSI 150 SOA conditions - 82 db

distance_150SOA_lt = cell(1,length(trials_150SOA_lt));

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
                distance_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = vid_data{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt}(57,:);
            else
                distance_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = NaN(1,1500);
            
            end

        end
    end        
end



% Distance of MSI 0 SOA conditions - 87 db
 distance_0SOA_ht = cell(1,length(trials_0SOA_ht));

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
                distance_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = vid_data{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht}(57,:);
            else
                distance_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = NaN(1,1500);       
            end

        end
    end        
end

% Distance of MSI 50 SOA conditions - 87 db

distance_50SOA_ht = cell(1,length(trials_50SOA_ht));

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
                distance_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = vid_data{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht}(57,:);
            else
                distance_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = NaN(1,1500);       
            end
        end
    end        
end


% Distance of MSI 100 SOA conditions - 87 db

distance_100SOA_ht = cell(1,length(trials_100SOA_ht));


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
                distance_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = vid_data{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht}(57,:);
            else
                distance_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = NaN(1,1500);       
            end

        end
    end        
end

% Distance of MSI 150 SOA conditions - 87 db

distance_150SOA_ht = cell(1,length(trials_150SOA_ht));

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
                distance_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = vid_data{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht}(57,:);
            else
                distance_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = NaN(1,1500);       
            end

        end
    end        
end

%% Distance travelled for different conditions per genotype

% % distance per genotype for unimodal, 0 SOA, 50 SOA, 100 SOA, and 150 SOA
genotypes = {'wt','het','mut'};
distance_lowtap_genotyped = cell(length(genotypes),1);
distance_hightap_genotyped = cell(length(genotypes),1);
distance_flash_genotyped = cell(length(genotypes),1);
distance_0SOA_genotyped_lt = cell(length(genotypes),1);
distance_50SOA_genotyped_lt = cell(length(genotypes),1);
distance_100SOA_genotyped_lt = cell(length(genotypes),1);
distance_150SOA_genotyped_lt = cell(length(genotypes),1);
distance_0SOA_genotyped_ht = cell(length(genotypes),1);
distance_50SOA_genotyped_ht = cell(length(genotypes),1);
distance_100SOA_genotyped_ht = cell(length(genotypes),1);
distance_150SOA_genotyped_ht = cell(length(genotypes),1);

run('D:\Emma_Conrad\genotype.m');


for batchID = 1:length(gene)

    for geneID = 1:length(genotypes)
        clear gene_well
        gene_well = (find(ismember(gene{batchID},genotypes{geneID})));

        for wellID = 1:length(gene_well)

            for trial = 1:6
            
                 distance_lowtap_genotyped{geneID}{batchID}{wellID}(trial,:) = distance_lowtap{batchID}{gene_well(wellID)}{trial};
                 distance_hightap_genotyped{geneID}{batchID}{wellID}(trial,:) = distance_hightap{batchID}{gene_well(wellID)}{trial};
                 distance_flash_genotyped{geneID}{batchID}{wellID}(trial,:) = distance_flash{batchID}{gene_well(wellID)}{trial};
                 distance_0SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = distance_0SOA_lt{batchID}{gene_well(wellID)}{trial};
                 distance_50SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = distance_50SOA_lt{batchID}{gene_well(wellID)}{trial};
                 distance_100SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = distance_100SOA_lt{batchID}{gene_well(wellID)}{trial};
                 distance_150SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = distance_150SOA_lt{batchID}{gene_well(wellID)}{trial};
                 distance_0SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = distance_0SOA_ht{batchID}{gene_well(wellID)}{trial};
                 distance_50SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = distance_50SOA_ht{batchID}{gene_well(wellID)}{trial};
                 distance_100SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = distance_100SOA_ht{batchID}{gene_well(wellID)}{trial};
                 distance_150SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = distance_150SOA_ht{batchID}{gene_well(wellID)}{trial};
            end
        end
    end   
end

%% Transform

for geneID = 1:length(distance_lowtap_genotyped)

    distance_lowtap_genotyped{geneID} = distance_lowtap_genotyped{geneID}.';
    distance_hightap_genotyped{geneID} = distance_hightap_genotyped{geneID}.';
    distance_flash_genotyped{geneID} = distance_flash_genotyped{geneID}.';
    distance_0SOA_genotyped_lt{geneID} =  distance_0SOA_genotyped_lt{geneID}.';
    distance_50SOA_genotyped_lt{geneID} =  distance_50SOA_genotyped_lt{geneID}.';
    distance_100SOA_genotyped_lt{geneID} =  distance_100SOA_genotyped_lt{geneID}.';
    distance_150SOA_genotyped_lt{geneID} = distance_150SOA_genotyped_lt{geneID}.';
    distance_0SOA_genotyped_ht{geneID} =  distance_0SOA_genotyped_ht{geneID}.';
    distance_50SOA_genotyped_ht{geneID} = distance_50SOA_genotyped_ht{geneID}.';
    distance_100SOA_genotyped_ht{geneID} =  distance_100SOA_genotyped_ht{geneID}.';
    distance_150SOA_genotyped_ht{geneID} = distance_150SOA_genotyped_ht{geneID}.';


    for batchID = 1:length(distance_lowtap_genotyped{geneID})

        distance_lowtap_genotyped{geneID}{batchID} = distance_lowtap_genotyped{geneID}{batchID}.';
        distance_hightap_genotyped{geneID}{batchID} = distance_hightap_genotyped{geneID}{batchID}.';
        distance_flash_genotyped{geneID}{batchID} = distance_flash_genotyped{geneID}{batchID}.';
        distance_0SOA_genotyped_lt{geneID}{batchID} =  distance_0SOA_genotyped_lt{geneID}{batchID}.';
        distance_50SOA_genotyped_lt{geneID}{batchID} =  distance_50SOA_genotyped_lt{geneID}{batchID}.';
        distance_100SOA_genotyped_lt{geneID}{batchID} =  distance_100SOA_genotyped_lt{geneID}{batchID}.';
        distance_150SOA_genotyped_lt{geneID}{batchID} = distance_150SOA_genotyped_lt{geneID}{batchID}.';
        distance_0SOA_genotyped_ht{geneID}{batchID} =  distance_0SOA_genotyped_ht{geneID}{batchID}.';
        distance_50SOA_genotyped_ht{geneID}{batchID} = distance_50SOA_genotyped_ht{geneID}{batchID}.';
        distance_100SOA_genotyped_ht{geneID}{batchID} =  distance_100SOA_genotyped_ht{geneID}{batchID}.';
        distance_150SOA_genotyped_ht{geneID}{batchID} = distance_150SOA_genotyped_ht{geneID}{batchID}.';

    end
end

% Mean distance travelled over time unimodal
mean_distance_lowtap_wt = mean(cell2mat(vertcat(distance_lowtap_genotyped{1}{:})), 'omitnan'); 
mean_distance_hightap_wt = mean(cell2mat(vertcat(distance_hightap_genotyped{1}{:})), 'omitnan');
mean_distance_flash_wt = mean(cell2mat(vertcat(distance_flash_genotyped{1}{:})), 'omitnan');

mean_distance_lowtap_mutant = mean(cell2mat(vertcat(distance_lowtap_genotyped{3}{:})), 'omitnan');
mean_distance_hightap_mutant = mean(cell2mat(vertcat(distance_hightap_genotyped{3}{:})), 'omitnan');
mean_distance_flash_mutant = mean(cell2mat(vertcat(distance_flash_genotyped{3}{:})), 'omitnan');

%% Unimodal summation 

SOA = [0 0.05 0.1 0.15];

% Sum all tap trials with flash trials --> get mean and max

d_matrix_lowtap_wt = cell2mat(vertcat(distance_lowtap_genotyped{1}{:}));
d_matrix_hightap_wt = cell2mat(vertcat(distance_hightap_genotyped{1}{:}));
d_matrix_flash_wt = cell2mat(vertcat(distance_flash_genotyped{1}{:}));

d_matrix_lowtap_mutant = cell2mat(vertcat(distance_lowtap_genotyped{3}{:}));
d_matrix_hightap_mutant = cell2mat(vertcat(distance_hightap_genotyped{3}{:}));
d_matrix_flash_mutant = cell2mat(vertcat(distance_flash_genotyped{3}{:}));


% Unimodal summation low tap & flash trials for wt - all SOAs

d_unimodalsum_lowtap_wt = cell(1,length(SOA));
d_mean_unimodalsum_lowtap_wt = cell(1,length(SOA));
d_max_unimodalsum_lowtap_wt = cell(1,length(SOA));

for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    lowtap_shifted_wt = zeros(size(d_matrix_lowtap_wt));
    
    if shift_samples > 0
        lowtap_shifted_wt(:, shift_samples+1:end) = ...
            d_matrix_lowtap_wt(:, 1:end-shift_samples); %
    
    else
        lowtap_shifted_wt = d_matrix_lowtap_wt;
    end

    % --- unimodal summation ---

    d_unimodalsum_lowtap_wt{i} = lowtap_shifted_wt + d_matrix_flash_wt;

    end    
    

 for i = 1:length(d_unimodalsum_lowtap_wt) 

        d_mean_unimodalsum_lowtap_wt{i} = mean(d_unimodalsum_lowtap_wt{i}, 'omitnan');
        d_max_unimodalsum_lowtap_wt{i} = max(d_unimodalsum_lowtap_wt{i},[],2, 'omitnan');   
 end

% Unimodal summation low tap & flash trials for mutant - all SOAs

d_unimodalsum_lowtap_mutant = cell(1,length(SOA));
d_mean_unimodalsum_lowtap_mutant = cell(1,length(SOA));
d_max_unimodalsum_lowtap_mutant = cell(1,length(SOA));


for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    lowtap_shifted_mutant = zeros(size(d_matrix_lowtap_mutant));
    
    if shift_samples > 0
        lowtap_shifted_mutant(:, shift_samples+1:end) = ...
            d_matrix_lowtap_mutant(:, 1:end-shift_samples); %

    else
        lowtap_shifted_mutant = d_matrix_lowtap_mutant;
    end

    % --- unimodal summation ---
    d_unimodalsum_lowtap_mutant{i} = lowtap_shifted_mutant + d_matrix_flash_mutant;
       
end

 for i = 1:length(d_unimodalsum_lowtap_mutant)
        d_mean_unimodalsum_lowtap_mutant{i} = mean(d_unimodalsum_lowtap_mutant{i}, 'omitnan');
        d_max_unimodalsum_lowtap_mutant{i} = max(d_unimodalsum_lowtap_mutant{i},[],2, 'omitnan');
 end 

% Unimodal summation high tap & flash trials for wt - all SOAs


for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    hightap_shifted_wt = zeros(size(d_matrix_hightap_wt));
    
    if shift_samples > 0
        hightap_shifted_wt(:, shift_samples+1:end) = ...
            d_matrix_hightap_wt(:, 1:end-shift_samples); %

    else
        hightap_shifted_wt = d_matrix_hightap_wt;
    end

    % --- unimodal summation ---
    d_unimodalsum_hightap_wt{i} = hightap_shifted_wt + d_matrix_flash_wt;
     
end

for i = 1:length(d_unimodalsum_hightap_wt)
        d_mean_unimodalsum_hightap_wt{i} = mean(d_unimodalsum_hightap_wt{i}, 'omitnan');
        d_max_unimodalsum_hightap_wt{i} = max(d_unimodalsum_hightap_wt{i},[],2, 'omitnan');
end   

% Unimodal summation high tap & flash trials for mutant - all SOAs

clear d_unimodalsum_hightap_mutant
for i = 1:length(SOA);

    shift_samples = round(SOA(i) * frame_rate);

    % --- Shift tap trace ---

    hightap_shifted_mutant = zeros(size(d_matrix_hightap_mutant));
    
    if shift_samples > 0
        hightap_shifted_mutant(:, shift_samples+1:end) = ...
            d_matrix_hightap_mutant(:, 1:end-shift_samples); %

    else
        hightap_shifted_mutant = d_matrix_hightap_mutant;
    end

    % --- unimodal summation ---
    d_unimodalsum_hightap_mutant{i} = hightap_shifted_mutant + d_matrix_flash_mutant;
      
end

 
for j = 1:length(d_unimodalsum_hightap_mutant)
    d_mean_unimodalsum_hightap_mutant{j} = mean(d_unimodalsum_hightap_mutant{j}, 'omitnan');
    d_max_unimodalsum_hightap_mutant{j} = max(d_unimodalsum_hightap_mutant{j},[],2, 'omitnan');
end 

%% Mean distance travelled for MSI conditions

% Mean distance MSI conditions - 82 db
data.mean_distance_0SOA_lt_wt =  mean(cell2mat(vertcat(distance_0SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_distance_0SOA_lt_mutant = mean(cell2mat(vertcat(distance_0SOA_genotyped_lt{3}{:})),'omitnan');
mean_distance_0SOA_lt_wt =  mean(cell2mat(vertcat(distance_0SOA_genotyped_lt{1}{:})),'omitnan');
mean_distance_0SOA_lt_mutant = mean(cell2mat(vertcat(distance_0SOA_genotyped_lt{3}{:})),'omitnan');

data.mean_distance_50SOA_lt_wt =  mean(cell2mat(vertcat(distance_50SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_distance_50SOA_lt_mutant = mean(cell2mat(vertcat(distance_50SOA_genotyped_lt{3}{:})),'omitnan');
mean_distance_50SOA_lt_wt =  mean(cell2mat(vertcat(distance_50SOA_genotyped_lt{1}{:})),'omitnan');
mean_distance_50SOA_lt_mutant = mean(cell2mat(vertcat(distance_50SOA_genotyped_lt{3}{:})),'omitnan');

data.mean_distance_100SOA_lt_wt =  mean(cell2mat(vertcat(distance_100SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_distance_100SOA_lt_mutant = mean(cell2mat(vertcat(distance_100SOA_genotyped_lt{3}{:})),'omitnan');
mean_distance_100SOA_lt_wt =  mean(cell2mat(vertcat(distance_100SOA_genotyped_lt{1}{:})),'omitnan');
mean_distance_100SOA_lt_mutant = mean(cell2mat(vertcat(distance_100SOA_genotyped_lt{3}{:})),'omitnan');

data.mean_distance_150SOA_lt_wt =  mean(cell2mat(vertcat(distance_150SOA_genotyped_lt{1}{:})),'omitnan');
data.mean_distance_150SOA_lt_mutant = mean(cell2mat(vertcat(distance_150SOA_genotyped_lt{3}{:})),'omitnan');
mean_distance_150SOA_lt_wt =  mean(cell2mat(vertcat(distance_150SOA_genotyped_lt{1}{:})),'omitnan');
mean_distance_150SOA_lt_mutant = mean(cell2mat(vertcat(distance_150SOA_genotyped_lt{3}{:})),'omitnan');

% Mean distance MSI conditions - 87 db
data.mean_distance_0SOA_ht_wt =  mean(cell2mat(vertcat(distance_0SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_distance_0SOA_ht_mutant = mean(cell2mat(vertcat(distance_0SOA_genotyped_ht{3}{:})),'omitnan');
mean_distance_0SOA_ht_wt =  mean(cell2mat(vertcat(distance_0SOA_genotyped_ht{1}{:})),'omitnan');
mean_distance_0SOA_ht_mutant = mean(cell2mat(vertcat(distance_0SOA_genotyped_ht{3}{:})),'omitnan');

data.mean_distance_50SOA_ht_wt =  mean(cell2mat(vertcat(distance_50SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_distance_50SOA_ht_mutant = mean(cell2mat(vertcat(distance_50SOA_genotyped_ht{3}{:})),'omitnan');
mean_distance_50SOA_ht_wt =  mean(cell2mat(vertcat(distance_50SOA_genotyped_ht{1}{:})),'omitnan');
mean_distance_50SOA_ht_mutant = mean(cell2mat(vertcat(distance_50SOA_genotyped_ht{3}{:})),'omitnan');

data.mean_distance_100SOA_ht_wt =  mean(cell2mat(vertcat(distance_100SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_distance_100SOA_ht_mutant = mean(cell2mat(vertcat(distance_100SOA_genotyped_ht{3}{:})),'omitnan');
mean_distance_100SOA_ht_wt =  mean(cell2mat(vertcat(distance_100SOA_genotyped_ht{1}{:})),'omitnan');
mean_distance_100SOA_ht_mutant = mean(cell2mat(vertcat(distance_100SOA_genotyped_ht{3}{:})),'omitnan');

data.mean_distance_150SOA_ht_wt =  mean(cell2mat(vertcat(distance_150SOA_genotyped_ht{1}{:})),'omitnan');
data.mean_distance_150SOA_ht_mutant = mean(cell2mat(vertcat(distance_150SOA_genotyped_ht{3}{:})),'omitnan');
mean_distance_150SOA_ht_wt =  mean(cell2mat(vertcat(distance_150SOA_genotyped_ht{1}{:})),'omitnan');
mean_distance_150SOA_ht_mutant = mean(cell2mat(vertcat(distance_150SOA_genotyped_ht{3}{:})),'omitnan');

%% Normalisation unimodal summation

start_baseline = 1;  % Frames with baseline values
stop_baseline = 700;

% 82 db wt

d_mean_unimodalsum_lowtap_wt_norm = cell(1,length(SOA));
diff_norm_lt_wt = cell(1,length(SOA));

for i = 1:length(SOA)
    fieldname = sprintf('mean_distance_%dSOA_lt_wt', SOA(i)*1000);
    current_lt_wt = data.(fieldname);

    diff_norm_lt_wt{i} = mean(d_mean_unimodalsum_lowtap_wt{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_lt_wt(start_baseline:stop_baseline), 'omitnan');
    d_mean_unimodalsum_lowtap_wt_norm{i} = d_mean_unimodalsum_lowtap_wt{i} - diff_norm_lt_wt{i};
end


% 87 db wt

d_mean_unimodalsum_hightap_wt_norm = cell(1,length(SOA));
diff_norm_ht_wt = cell(1,length(SOA));

for i = 1:length(SOA)
    fieldname = sprintf('mean_distance_%dSOA_ht_wt', SOA(i)*1000);
    current_ht_wt = data.(fieldname);

    diff_norm_ht_wt{i} = mean(d_mean_unimodalsum_hightap_wt{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_ht_wt(start_baseline:stop_baseline), 'omitnan');
    d_mean_unimodalsum_hightap_wt_norm{i} = d_mean_unimodalsum_hightap_wt{i} - diff_norm_ht_wt{i};
end

% 82 db mutant

d_mean_unimodalsum_lowtap_mutant_norm = cell(1,length(SOA));
diff_norm_lt_mut = cell(1,length(SOA));

for i = 1:length(SOA)
    fieldname = sprintf('mean_distance_%dSOA_lt_mutant', SOA(i)*1000);
    current_lt_mut = data.(fieldname);


    diff_norm_lt_mut{i} = mean(d_mean_unimodalsum_lowtap_mutant{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_lt_mut(start_baseline:stop_baseline), 'omitnan');
    d_mean_unimodalsum_lowtap_mutant_norm{i} = d_mean_unimodalsum_lowtap_mutant{i} - diff_norm_lt_mut{i};
end

% 87 db mutant

d_mean_unimodalsum_hightap_mutant_norm = cell(1,length(SOA));
diff_norm_ht_mut = cell(1,length(SOA));

for i = 1:length(SOA)
    fieldname = sprintf('mean_distance_%dSOA_ht_mutant', SOA(i)*1000);
    current_ht_mut = data.(fieldname);


    diff_norm_ht_mut{i} = mean(d_mean_unimodalsum_hightap_mutant{i}(start_baseline:stop_baseline), 'omitnan') - mean(current_ht_mut(start_baseline:stop_baseline), 'omitnan');
    d_mean_unimodalsum_hightap_mutant_norm{i} = d_mean_unimodalsum_hightap_mutant{i} - diff_norm_ht_mut{i};
end

%% Plotting distance travelled over time MSI for 82 db stimulus
recording_duration = 6; % seconds
x = linspace(-3,3,1500);

% Plot unimodal distance for mutant and wt
figure('Name', 'Distance travelled: 82 db tap stimulus') % 82 db


subplot(2,5,1)
plot(x,mean_distance_lowtap_wt)
hold on
plot(x,mean_distance_flash_wt)
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('Distance travelled over time wt')
xline(0, '--r')
legend('82 db tap', 'Flash', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;

hold on

subplot(2,5,6)
plot(x,mean_distance_lowtap_mutant)
hold on
plot(x,mean_distance_flash_mutant)
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('Distance travelled over time mutant')
xline(0, '--r')
legend('82 db tap', 'Flash', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 0 ms with unimodal summation for wt & mutant
subplot(2,5,2)
plot(x,mean_distance_0SOA_lt_wt)
hold on
plot(x,d_mean_unimodalsum_lowtap_wt_norm{1}) 
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 0 SOA ')
xline(0, '--r')
legend('0 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,7)
plot(x,mean_distance_0SOA_lt_mutant)
hold on
plot(x,d_mean_unimodalsum_lowtap_mutant_norm{1})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 0 SOA')
xline(0, '--r')
legend('0 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 50 ms with unimodal summation for wt & mutant
subplot(2,5,3)
plot(x,mean_distance_50SOA_lt_wt)
hold on
plot(x,d_mean_unimodalsum_lowtap_wt_norm{2})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 50 SOA')
xline([0], '--r')
legend('50 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,8)
plot(x,mean_distance_50SOA_lt_mutant)
hold on
plot(x,d_mean_unimodalsum_lowtap_mutant_norm{2})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 50 SOA')
xline([0], '--r')
legend('50 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 100 ms with unimodal summation for wt & mutant
subplot(2,5,4)
plot(x,mean_distance_100SOA_lt_wt)
hold on
plot(x,d_mean_unimodalsum_lowtap_wt_norm{3})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 100 SOA')
xline([0], '--r')
legend('100 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,9)
plot(x,mean_distance_100SOA_lt_mutant)
hold on
plot(x,d_mean_unimodalsum_lowtap_mutant_norm{3})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 100 SOA')
xline([0], '--r')
legend('100 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 150 ms with unimodal summation for wt & mutant
subplot(2,5,5)
plot(x,mean_distance_150SOA_lt_wt)
hold on
plot(x,d_mean_unimodalsum_lowtap_wt_norm{4})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 150 SOA')
xline([0], '--r')
legend('150 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,10)
plot(x,mean_distance_150SOA_lt_mutant)
hold on
plot(x,d_mean_unimodalsum_lowtap_mutant_norm{4})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 150 SOA')
xline([0], '--r')
legend('150 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;

%% Plotting Distance travelled over time MSI for 87 db stimulus

% Plot unimodal distance travelled for mutant and wt
figure('Name', 'distance travelled: 87 db tap stimulus') % 87 db


subplot(2,5,1)
plot(x,mean_distance_hightap_wt)
hold on
plot(x,mean_distance_flash_wt)
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt')
xline([0], '--r')
legend('87 db tap', 'Flash', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;

hold on

subplot(2,5,6)
plot(x,mean_distance_hightap_mutant)
hold on
plot(x,mean_distance_flash_mutant)
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant')
xline([0], '--r')
legend('87 db tap', 'Flash','Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 0 ms with unimodal summation for wt & mutant
subplot(2,5,2)
plot(x,mean_distance_0SOA_ht_wt)
hold on
plot(x,d_mean_unimodalsum_hightap_wt_norm{1})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 0 SOA')
xline([0], '--r')
legend('0 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,7)
plot(x,mean_distance_0SOA_ht_mutant)
hold on
plot(x,d_mean_unimodalsum_hightap_mutant_norm{1})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 0 SOA')
xline([0], '--r')
legend('0 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 50 ms with unimodal summation for wt & mutant
subplot(2,5,3)
plot(x,mean_distance_50SOA_ht_wt)
hold on
plot(x,d_mean_unimodalsum_hightap_wt_norm{2})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 50 SOA')
xline([0], '--r')
legend('50 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,8)
plot(x,mean_distance_50SOA_ht_mutant)
hold on
plot(x,d_mean_unimodalsum_hightap_mutant_norm{2})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 50 SOA')
xline([0], '--r')
legend('50 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 100 ms with unimodal summation for wt & mutant
subplot(2,5,4)
plot(x,mean_distance_100SOA_ht_wt)
hold on
plot(x,d_mean_unimodalsum_hightap_wt_norm{3})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 100 SOA')
xline([0], '--r')
legend('100 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,9)
plot(x,mean_distance_100SOA_ht_mutant)
hold on
plot(x,d_mean_unimodalsum_hightap_mutant_norm{3})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time mutant: 100 SOA')
xline([0], '--r')
legend('100 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


% Plot distance MSI 150 ms with unimodal summation for wt & mutant
subplot(2,5,5)
plot(x,mean_distance_150SOA_ht_wt)
hold on
plot(x,d_mean_unimodalsum_hightap_wt_norm{4})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance travelled over time wt: 150 SOA')
xline([0], '--r')
legend('150 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;


subplot(2,5,10)
plot(x,mean_distance_150SOA_ht_mutant)
hold on
plot(x,d_mean_unimodalsum_hightap_mutant_norm{4})
ylabel('Distance (mm)')
xlabel('Time since stimulus onset (s)')
title('distance over time mutant: 150 SOA')
xline([0], '--r')
legend('150 SOA', 'Unimodal summation', 'Onset stimulus')
ylim([0,0.5])
xlim([-0.2,0.5])
lgd.FontSize = 4;

%% Mean distance travelled over time per fish

SOA = [0 0.05 0.1 0.15];

start_interval = zeros(1,length(SOA));
stop_interval = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval(i) = 750 + (frame_rate * SOA(i));
    stop_interval(i) = 800 + (frame_rate * SOA(i)); % 0.3 seconds (when p(bout) becomes close to 0 again for the 150 SOA conditions) * framerate
end

% 82 db tap

for i = 1:length(SOA)
    current_name_MSI = ['distance_' num2str(SOA(i)*1000) 'SOA_genotyped_lt'];
    current_MSI = eval(current_name_MSI);
    
    % wt
    mat_distance_lt_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    mean_distance_lt_wt_trial = mean(mat_distance_lt_wt(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_lt_wt_fish{i} = mean(reshape(mean_distance_lt_wt_trial,6,[]),1,'omitnan');
    
    mean_distance_unimodal_lt_wt_trial =  mean(d_unimodalsum_lowtap_wt{i}(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_unimodal_lt_wt_fish{i} = (mean(reshape(mean_distance_unimodal_lt_wt_trial,6,[]),1,'omitnan')) - diff_norm_lt_wt{i};

    % mutant

    mat_distance_lt_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    mean_distance_lt_mut_trial = mean(mat_distance_lt_mut(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_lt_mut_fish{i} = mean(reshape(mean_distance_lt_mut_trial,6,[]),1,'omitnan');
    
    mean_distance_unimodal_lt_mut_trial =  mean(d_unimodalsum_lowtap_mutant{i}(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_unimodal_lt_mut_fish{i} = (mean(reshape(mean_distance_unimodal_lt_mut_trial,6,[]),1,'omitnan')) - diff_norm_lt_mut{i};

end    

% 87 db tap

for i = 1:length(SOA)
    current_name_MSI = ['distance_' num2str(SOA(i)*1000) 'SOA_genotyped_ht'];
    current_MSI = eval(current_name_MSI);
    
    % wt

    mat_distance_ht_wt =  cell2mat(vertcat(current_MSI{1}{:}));
    mean_distance_ht_wt_trial = mean(mat_distance_ht_wt(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_ht_wt_fish{i} = mean(reshape(mean_distance_ht_wt_trial,6,[]),1,'omitnan');
    
    mean_distance_unimodal_ht_wt_trial =  mean(d_unimodalsum_hightap_wt{i}(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_unimodal_ht_wt_fish{i} = (mean(reshape(mean_distance_unimodal_ht_wt_trial,6,[]),1,'omitnan')) - diff_norm_ht_wt{i};

    % mutant

    mat_distance_ht_mut =  cell2mat(vertcat(current_MSI{3}{:}));
    mean_distance_ht_mut_trial = mean(mat_distance_ht_mut(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_ht_mut_fish{i} = mean(reshape(mean_distance_ht_mut_trial,6,[]),1,'omitnan');
    
    mean_distance_unimodal_ht_mut_trial =  mean(d_unimodalsum_hightap_mutant{i}(:,start_interval(i):stop_interval(i)),2,'omitnan');
    mean_distance_unimodal_ht_mut_fish{i} = (mean(reshape(mean_distance_unimodal_ht_mut_trial,6,[]),1,'omitnan')) - diff_norm_ht_mut{i};

end   

%% Bar graphs mean distance low tap experiments

% Use average of the mean

figure('Name', 'Bar graphs mean distance 82 db')

subplot(2,4,1)
x_bar = categorical({'Unimodal summation' , '0 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_wt_fish{1}, 'omitnan') mean(mean_distance_lt_wt_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
hold on
title('wt: 0 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,2)
x_bar = categorical({'Unimodal summation' , '50 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_wt_fish{2}, 'omitnan') mean(mean_distance_lt_wt_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 50 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,3)
x_bar = categorical({'Unimodal summation' , '100 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_wt_fish{3}, 'omitnan') mean(mean_distance_lt_wt_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 100 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,4)
x_bar = categorical({'Unimodal summation' , '150 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_wt_fish{4}, 'omitnan') mean(mean_distance_lt_wt_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 150 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,5)
x_bar = categorical({'Unimodal summation' , '0 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_mut_fish{1}, 'omitnan') mean(mean_distance_lt_mut_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 0 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,6)
x_bar = categorical({'Unimodal summation' , '50 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_mut_fish{2}, 'omitnan') mean(mean_distance_lt_mut_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 50 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,7)
x_bar = categorical({'Unimodal summation' , '100 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_mut_fish{3}, 'omitnan') mean(mean_distance_lt_mut_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 100 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,8)
x_bar = categorical({'Unimodal summation' , '150 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_lt_mut_fish{4}, 'omitnan') mean(mean_distance_lt_mut_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 150 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

%% Bar graphs mean distance high tap experiments

% Use average of the mean

% For the statistics and bar graphs only take interval after stimulus onset

figure('Name', 'Bar graphs mean distance 87 db')

subplot(2,4,1)
x_bar = categorical({'Unimodal summation' , '0 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_wt_fish{1}, 'omitnan') mean(mean_distance_ht_wt_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 0 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,2)
x_bar = categorical({'Unimodal summation' , '50 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_wt_fish{2}, 'omitnan') mean(mean_distance_ht_wt_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 50 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,3)
x_bar = categorical({'Unimodal summation' , '100 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_wt_fish{3}, 'omitnan') mean(mean_distance_ht_wt_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 100 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,4)
x_bar = categorical({'Unimodal summation' , '150 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_wt_fish{4}, 'omitnan') mean(mean_distance_ht_wt_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('wt: 150 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,5)
x_bar = categorical({'Unimodal summation' , '0 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_mut_fish{1}, 'omitnan') mean(mean_distance_ht_mut_fish{1}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 0 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,6)
x_bar = categorical({'Unimodal summation' , '50 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_mut_fish{2}, 'omitnan') mean(mean_distance_ht_mut_fish{2}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 50 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,7)
x_bar = categorical({'Unimodal summation' , '100 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_mut_fish{3}, 'omitnan') mean(mean_distance_ht_mut_fish{3}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 100 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')

subplot(2,4,8)
x_bar = categorical({'Unimodal summation' , '150 SOA'});    
b = bar(x_bar, [mean(mean_distance_unimodal_ht_mut_fish{4}, 'omitnan') mean(mean_distance_ht_mut_fish{4}, 'omitnan')])
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 1]
b.CData(2,:) = [1.0 0.5333 0.0]
title('mutant: 150 SOA')
ylim([0,0.07])
ylabel('mean distance (mm)')


%% Statistical tests mean distance travelled

% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

% Mean distance travelled per fish
% Data not normally distributed: wilcoxon

signrank_test_distance_lt_wt = zeros(1,length(SOA));
signrank_test_distance_lt_mut = zeros(1,length(SOA));
ttest_distance_ht_wt = zeros(1,length(SOA));
ttest_distance_ht_mut = zeros(1,length(SOA));

for i = 1: length(SOA)
    signrank_test_distance_lt_wt(:,i)= signrank(mean_distance_lt_wt_fish{i}, mean_distance_unimodal_lt_wt_fish{i},'Tail','right')
    signrank_test_distance_lt_mut(:,i)= signrank(mean_distance_lt_mut_fish{i}, mean_distance_unimodal_lt_mut_fish{i},'Tail','right')
    [~,ttest_distance_ht_wt(:,i)]= ttest(mean_distance_ht_wt_fish{i}, mean_distance_unimodal_ht_wt_fish{i},'Tail','right')
    [~,ttest_distance_ht_mut(:,i)]= ttest(mean_distance_ht_mut_fish{i}, mean_distance_unimodal_ht_mut_fish{i},'Tail','right')
end

%% Projection plots distance travelled 82 db

% figure with 4 plots, one for each SOA --> 2 figures (82 db & 87 db)

figure('Name', 'Projection plot distance travelled: 82 db')

% Identity line --> points above the line have higher distance travelled for multisensory than
% unimodal (shows MSI). Calculate distances of each point to the identity
% line

% 0 SOA
subplot(2,2,1)  

scatter(mean_distance_unimodal_lt_wt_fish{1} - diff_norm_lt_wt{1}, mean_distance_lt_wt_fish{1},'b')
hold on
scatter(mean_distance_unimodal_lt_mut_fish{1} - diff_norm_lt_mut{1}, mean_distance_lt_mut_fish{1},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('0 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')


% 50 SOA
subplot(2,2,2)

scatter(mean_distance_unimodal_lt_wt_fish{2} - diff_norm_lt_wt{2},mean_distance_lt_wt_fish{2},'b')
hold on
scatter(mean_distance_unimodal_lt_mut_fish{2} - diff_norm_lt_mut{2},mean_distance_lt_mut_fish{2},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('50 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 100 SOA
subplot(2,2,3)

scatter(mean_distance_unimodal_lt_wt_fish{3} - diff_norm_lt_wt{3},mean_distance_lt_wt_fish{3},'b')
hold on
scatter(mean_distance_unimodal_lt_mut_fish{3} - diff_norm_lt_mut{3},mean_distance_lt_mut_fish{3},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('100 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 150 SOA
subplot(2,2,4)

scatter(mean_distance_unimodal_lt_wt_fish{4} - diff_norm_lt_wt{4},mean_distance_lt_wt_fish{4},'b')
hold on
scatter(mean_distance_unimodal_lt_mut_fish{4} - diff_norm_lt_mut{4},mean_distance_lt_mut_fish{4},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('150 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

%-------------------------------------------------------------------------%
% Compare the distributions of the distances between points and reference
% line between wt and mutants

for i = 1:length(SOA)

    % Coordinates

    x_lt_wt = mean_distance_unimodal_lt_wt_fish{i} - diff_norm_lt_wt{i};
    y_lt_wt = mean_distance_lt_wt_fish{i};

    x_lt_mut = mean_distance_unimodal_lt_mut_fish{i} - diff_norm_lt_mut{i};
    y_lt_mut = mean_distance_lt_mut_fish{i};
    % Line coefficients: Ax + By + C = 0
    A = -1;
    B = 1;
    C = 0;

    % Perpendicular distance
    distanceLine_dis_lt_wt{i} = (A*x_lt_wt + B*y_lt_wt + C) ./ sqrt(A^2 + B^2);
    distanceLine_dis_lt_mut{i} = (A*x_lt_mut + B*y_lt_mut + C) ./ sqrt(A^2 + B^2);
end

% Curve showing how distances are distributed
figure('Name', 'Distribution distances from line distance travelled: 82 db')

subplot(2,2,1)

% Points above the reference line will be positive distances --> MSI

[f_dis_0SOA_lt_wt, xi_dis_0SOA_lt_wt] = ksdensity(distanceLine_dis_lt_wt{1});
[f_dis_0SOA_lt_mut, xi_dis_0SOA_lt_mut] = ksdensity(distanceLine_dis_lt_mut{1});

plot(xi_dis_0SOA_lt_wt,f_dis_0SOA_lt_wt,'b')
hold on
plot( xi_dis_0SOA_lt_mut,f_dis_0SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('0 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off

subplot(2,2,2)

[f_dis_50SOA_lt_wt, xi_dis_50SOA_lt_wt] = ksdensity(distanceLine_dis_lt_wt{2});
[f_dis_50SOA_lt_mut, xi_dis_50SOA_lt_mut] = ksdensity(distanceLine_dis_lt_mut{2});

plot( xi_dis_50SOA_lt_wt,f_dis_50SOA_lt_wt,'b')
hold on
plot( xi_dis_50SOA_lt_mut,f_dis_50SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('50 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off

subplot(2,2,3)

[f_dis_100SOA_lt_wt, xi_dis_100SOA_lt_wt] = ksdensity(distanceLine_dis_lt_wt{3});
[f_dis_100SOA_lt_mut, xi_dis_100SOA_lt_mut] = ksdensity(distanceLine_dis_lt_mut{3});

plot( xi_dis_100SOA_lt_wt,f_dis_100SOA_lt_wt,'b')
hold on
plot( xi_dis_100SOA_lt_mut,f_dis_100SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('100 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off

subplot(2,2,4)

[f_dis_150SOA_lt_wt, xi_dis_150SOA_lt_wt] = ksdensity(distanceLine_dis_lt_wt{4});
[f_dis_150SOA_lt_mut, xi_dis_150SOA_lt_mut] = ksdensity(distanceLine_dis_lt_mut{4});

plot(xi_dis_150SOA_lt_wt,f_dis_150SOA_lt_wt,'b')
hold on 
plot(xi_dis_150SOA_lt_mut,f_dis_150SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('150 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off
%% Projection plots bout probability 87 db

% figure with 4 plots, one for each SOA --> 2 figures (82 db & 87 db)

figure('Name', 'Projection plot distance travelled: 87 db')

% Identity line --> points above the line have higher velocity for multisensory than
% unimodal (shows MSI). Calculate distances of each point to the identity
% line

% 0 SOA
subplot(2,2,1)

scatter(mean_distance_unimodal_ht_wt_fish{1} - diff_norm_ht_wt{1}, mean_distance_ht_wt_fish{1},'b')
hold on
scatter(mean_distance_unimodal_ht_mut_fish{1} - diff_norm_ht_mut{1}, mean_distance_ht_mut_fish{1},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('0 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')


% 50 SOA
subplot(2,2,2)

scatter(mean_distance_unimodal_ht_wt_fish{2} - diff_norm_ht_wt{2},mean_distance_ht_wt_fish{2},'b')
hold on
scatter(mean_distance_unimodal_ht_mut_fish{2} - diff_norm_ht_mut{2},mean_distance_ht_mut_fish{2},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('50 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 100 SOA
subplot(2,2,3)

scatter(mean_distance_unimodal_ht_wt_fish{3} - diff_norm_ht_wt{3},mean_distance_ht_wt_fish{3},'b')
hold on
scatter(mean_distance_unimodal_ht_mut_fish{3} - diff_norm_ht_mut{3},mean_distance_ht_mut_fish{3},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('100 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 150 SOA
subplot(2,2,4)

scatter(mean_distance_unimodal_ht_wt_fish{4} - diff_norm_ht_wt{4},mean_distance_ht_wt_fish{4},'b')
hold on
scatter(mean_distance_unimodal_ht_mut_fish{4} - diff_norm_ht_mut{4},mean_distance_ht_mut_fish{4},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.05 0.15])
xlim([-0.05 0.15])
title('150 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

%-------------------------------------------------------------------------%
% Compare the distributions of the distances between points and reference
% line between wt and mutants

for i = 1:length(SOA)

    % Coordinates
 
    x_ht_wt = mean_distance_unimodal_ht_wt_fish{i} - diff_norm_ht_wt{i};
    y_ht_wt = mean_distance_ht_wt_fish{i};

    x_ht_mut = mean_distance_unimodal_ht_mut_fish{i} - diff_norm_ht_mut{i};
    y_ht_mut = mean_distance_ht_mut_fish{i};
    % Line coefficients: Ax + By + C = 0
    A = -1;
    B = 1;
    C = 0;

    % Perpendicular distance
    distanceLine_dis_ht_wt{i} = (A*x_ht_wt + B*y_ht_wt + C) ./ sqrt(A^2 + B^2);
    distanceLine_dis_ht_mut{i} = (A*x_ht_mut + B*y_ht_mut + C) ./ sqrt(A^2 + B^2);
end

% Curve showing how distances are distributed
figure('Name', 'Distribution distances from line bout probability: 87 db')

subplot(2,2,1)

% Points above the reference line will be positive distances --> MSI

[f_dis_0SOA_ht_wt, xi_dis_0SOA_ht_wt] = ksdensity(distanceLine_dis_ht_wt{1});
[f_dis_0SOA_ht_mut, xi_dis_0SOA_ht_mut] = ksdensity(distanceLine_dis_ht_mut{1});

plot(xi_dis_0SOA_ht_wt,f_dis_0SOA_ht_wt,'b')
hold on
plot( xi_dis_0SOA_ht_mut,f_dis_0SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('0 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off

subplot(2,2,2)

[f_dis_50SOA_ht_wt, xi_dis_50SOA_ht_wt] = ksdensity(distanceLine_dis_ht_wt{2});
[f_dis_50SOA_ht_mut, xi_dis_50SOA_ht_mut] = ksdensity(distanceLine_dis_ht_mut{2});

plot( xi_dis_50SOA_ht_wt,f_dis_50SOA_ht_wt,'b')
hold on
plot( xi_dis_50SOA_ht_mut,f_dis_50SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('50 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off

subplot(2,2,3)

[f_dis_100SOA_ht_wt, xi_dis_100SOA_ht_wt] = ksdensity(distanceLine_dis_ht_wt{3});
[f_dis_100SOA_ht_mut, xi_dis_100SOA_ht_mut] = ksdensity(distanceLine_dis_ht_mut{3});

plot( xi_dis_100SOA_ht_wt,f_dis_100SOA_ht_wt,'b')
hold on
plot( xi_dis_100SOA_ht_mut,f_dis_100SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('100 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off

subplot(2,2,4)

[f_dis_150SOA_ht_wt, xi_dis_150SOA_ht_wt] = ksdensity(distanceLine_dis_ht_wt{4});
[f_dis_150SOA_ht_mut, xi_dis_150SOA_ht_mut] = ksdensity(distanceLine_dis_ht_mut{4});

plot(xi_dis_150SOA_ht_wt,f_dis_150SOA_ht_wt,'b')
hold on 
plot(xi_dis_150SOA_ht_mut,f_dis_150SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('150 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.1 0.1])
ylim([-0.05 26])
box off
%% Statistical tests differences in distribution distance travelled

% Calculate statistics for difference in distribution wt vs mutant for all
% SOAs
% Ranksum used because here wt's are compared to mutants, two independent
% groups with different sample sizes. 
% Ranksum is good for independent groups with unequal sample sizes

ranksum_test_distance_lt = zeros(1,length(SOA));
ranksum_test_distance_ht = zeros(1,length(SOA));


for i = 1: length(SOA)
    ranksum_test_distance_lt(:,i) = ranksum(distanceLine_dis_lt_wt{i}, distanceLine_dis_lt_mut{i})
    ranksum_test_distance_ht(:,i)= ranksum(distanceLine_dis_ht_wt{i}, distanceLine_dis_ht_mut{i})
end


%% Create matrices of the data

d_mat_0SOA_wt_lt = cell2mat(vertcat(distance_0SOA_genotyped_lt{1}{:}));
d_mat_50SOA_wt_lt = cell2mat(vertcat(distance_50SOA_genotyped_lt{1}{:}));
d_mat_100SOA_wt_lt = cell2mat(vertcat(distance_100SOA_genotyped_lt{1}{:}));
d_mat_150SOA_wt_lt = cell2mat(vertcat(distance_150SOA_genotyped_lt{1}{:}));
d_mat_0SOA_mut_lt = cell2mat(vertcat(distance_0SOA_genotyped_lt{3}{:}));
d_mat_50SOA_mut_lt = cell2mat(vertcat(distance_50SOA_genotyped_lt{3}{:}));
d_mat_100SOA_mut_lt = cell2mat(vertcat(distance_100SOA_genotyped_lt{3}{:}));
d_mat_150SOA_mut_lt = cell2mat(vertcat(distance_150SOA_genotyped_lt{3}{:}));

d_mat_0SOA_wt_ht = cell2mat(vertcat(distance_0SOA_genotyped_ht{1}{:}));
d_mat_50SOA_wt_ht = cell2mat(vertcat(distance_50SOA_genotyped_ht{1}{:}));
d_mat_100SOA_wt_ht = cell2mat(vertcat(distance_100SOA_genotyped_ht{1}{:}));
d_mat_150SOA_wt_ht = cell2mat(vertcat(distance_150SOA_genotyped_ht{1}{:}));
d_mat_0SOA_mut_ht = cell2mat(vertcat(distance_0SOA_genotyped_ht{3}{:}));
d_mat_50SOA_mut_ht = cell2mat(vertcat(distance_50SOA_genotyped_ht{3}{:}));
d_mat_100SOA_mut_ht = cell2mat(vertcat(distance_100SOA_genotyped_ht{3}{:}));
d_mat_150SOA_mut_ht = cell2mat(vertcat(distance_150SOA_genotyped_ht{3}{:}));


%% Mean distance travelled per bout MSI vs unimodalsum for all SOA's graph

% Mean distance travelled per bout 
% Change start and stop interval to best one (what is optimal and sensible, explain why)


% ------------------------- 82 db wt -------------------------

bout_distance_MSI = zeros(size(mat_lowtap_wt));
bout_distance_lowtap= zeros(size(mat_lowtap_wt));

% Distance per bout MSI vs unimodal summation per SOA 
for i = 1:length(SOA)
    current_name_starts = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_starts = eval(current_name_starts);
    current_name_ends = ['boutend_mat_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_ends = eval(current_name_ends);
    current_name_distance = ['d_mat_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_distance = eval(current_name_distance);
   
    for trial = 1:size(current_starts,1)

        for bout = 1:size(current_starts,2)

        startFrame = current_starts(trial,bout);
        endFrame = current_ends(trial,bout);

        % skip empty values

            if isnan(startFrame) || isnan(endFrame);
                continue
            end    

        % Only keep bouts with starts between interval

            if startFrame >= start_interval(i) && startFrame <= stop_interval(i);

            % Sum distance travelled during the bout
                bout_distance_MSI(trial,bout) = sum(current_distance(trial,startFrame:endFrame));
            else
                bout_distance_MSI(trial,bout) = NaN;

            end
    
        end
    end

    bout_distance_lt_wt_MSI{i} = mean(bout_distance_MSI,2,'omitnan'); % mean bout distance for each trial
    mean_boutDistance_lt_wt_MSI{i} = mean(reshape(bout_distance_lt_wt_MSI{i},6,[]),1,'omitnan'); % mean distance per bout for each fish

    % Only Tap   --> duration of bouts for only tap trials
       
   for trial = 1:size(mat_lowtap_wt,1)

       for bout = 1:size(mat_lowtap_wt,2)

            startFrame_tap = mat_lowtap_wt(trial,bout);
            endFrame_tap = boutend_mat_lowtap_wt(trial,bout);

            startFrame_flash = mat_flash_wt(trial,bout);
            endFrame_flash = boutend_mat_flash_wt(trial,bout);
                
            % TAP

            if ~(isnan(startFrame_tap) || isnan(endFrame_tap));
                
                if startFrame_tap >= start_interval(1) && startFrame_tap <= stop_interval(1);

                % Sum distance travelled during the bout
                    bout_distance_lowtap(trial,bout) = sum(d_matrix_lowtap_wt(trial,startFrame_tap:endFrame_tap));
                else
                    bout_distance_lowtap(trial,bout) = NaN;

                end

            end    
    
        end
    end
    
    bout_distance_lowtap_wt{i} = mean(bout_distance_lowtap,2,'omitnan')  % mean bout distance for each trial
    mean_boutDistance_lowtap_wt{i} = mean(reshape(bout_distance_lowtap_wt{i},6,[]),1,'omitnan'); % mean distance per bout for each fish
  
end

offset = 5
x = (SOA * 1000) - offset;

means_MSI_lt_wt_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_lt_wt_MSI);
sem_MSI_lt_wt_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_lt_wt_MSI);
means_lowtap_wt_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_lowtap_wt);
sem_lowtap_wt_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_lowtap_wt);

figure('name', 'Mean distance per bout : Only tap versus tap preceded by flash ');

subplot(2,2,1)
hold on

errorbar((SOA*1000) - offset, means_lowtap_wt_boutdis, sem_lowtap_wt_boutdis,'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, means_MSI_lt_wt_boutdis, sem_MSI_lt_wt_boutdis , 'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Mean distance per bout (mm)');
legend('Tap', 'MSI');
title('82 db wt');
xlim([-50 200])
ylim([0 6])
hold off

% ------------------------- 87 db wt -------------------------

bout_distance_MSI = zeros(size(mat_hightap_wt));
bout_distance_hightap= zeros(size(mat_hightap_wt));

% Distance per bout MSI vs unimodal summation per SOA 
for i = 1:length(SOA)
    current_name_starts = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_starts = eval(current_name_starts);
    current_name_ends = ['boutend_mat_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_ends = eval(current_name_ends);
    current_name_distance = ['d_mat_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_distance = eval(current_name_distance);
   
    for trial = 1:size(current_starts,1)

        for bout = 1:size(current_starts,2)

        startFrame = current_starts(trial,bout);
        endFrame = current_ends(trial,bout);

        % skip empty values

            if isnan(startFrame) || isnan(endFrame);
                continue
            end    

        % Only keep bouts with starts between interval

            if startFrame >= start_interval(i) && startFrame <= stop_interval(i);

            % Sum distance travelled during the bout
                bout_distance_MSI(trial,bout) = sum(current_distance(trial,startFrame:endFrame));
            else
                bout_distance_MSI(trial,bout) = NaN;

            end
    
        end
    end

    bout_distance_ht_wt_MSI{i} = mean(bout_distance_MSI,2,'omitnan'); % mean bout distance for each trial
    mean_boutDistance_ht_wt_MSI{i} = mean(reshape(bout_distance_ht_wt_MSI{i},6,[]),1,'omitnan'); % mean distance per bout for each fish

    % Get unimodal summation  --> duration of bouts tap + duration of bouts flash
       
   for trial = 1:size(mat_hightap_wt,1)

       for bout = 1:size(mat_hightap_wt,2)

            startFrame_tap = mat_hightap_wt(trial,bout);
            endFrame_tap = boutend_mat_hightap_wt(trial,bout);

            % TAP

            if ~(isnan(startFrame_tap) || isnan(endFrame_tap));
                
                if startFrame_tap >= start_interval(1) && startFrame_tap <= stop_interval(1);

                % Sum distance travelled during the bout
                    bout_distance_hightap(trial,bout) = sum(d_matrix_hightap_wt(trial,startFrame_tap:endFrame_tap));
                else
                    bout_distance_hightap(trial,bout) = NaN;

                end

            end    

    
        end
    end
    
    bout_distance_hightap_wt{i} = mean(bout_distance_hightap,2,'omitnan')   % mean bout distance for each trial
    mean_boutDistance_hightap_wt{i} = mean(reshape(bout_distance_hightap_wt{i},6,[]),1,'omitnan'); % mean distance per bout for each fish
  
end

offset = 5
x = (SOA * 1000) - offset;

means_MSI_ht_wt_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_ht_wt_MSI);
sem_MSI_ht_wt_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_ht_wt_MSI);
means_hightap_wt_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_hightap_wt);
sem_hightap_wt_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_hightap_wt);

subplot(2,2,2)
hold on

errorbar((SOA*1000) - offset, means_hightap_wt_boutdis, sem_hightap_wt_boutdis,'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, means_MSI_ht_wt_boutdis, sem_MSI_ht_wt_boutdis , 'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Mean distance per bout (mm)');
legend('Tap', 'MSI');
title('87 db wt');
xlim([-50 200])
ylim([0 6])
hold off

% ------------------------- 82 db mutant -------------------------

bout_distance_MSI = zeros(size(mat_lowtap_mut));
bout_distance_lowtap= zeros(size(mat_lowtap_mut));


% Distance per bout MSI vs unimodal summation per SOA 
for i = 1:length(SOA)
    current_name_starts = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_starts = eval(current_name_starts);
    current_name_ends = ['boutend_mat_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_ends = eval(current_name_ends);
    current_name_distance = ['d_mat_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_distance = eval(current_name_distance);
   
    for trial = 1:size(current_starts,1)

        for bout = 1:size(current_starts,2)

        startFrame = current_starts(trial,bout);
        endFrame = current_ends(trial,bout);

        % skip empty values

            if isnan(startFrame) || isnan(endFrame);
                continue
            end    

        % Only keep bouts with starts between interval

            if startFrame >= start_interval(i) && startFrame <= stop_interval(i);

            % Sum distance travelled during the bout
                bout_distance_MSI(trial,bout) = sum(current_distance(trial,startFrame:endFrame));
            else
                bout_distance_MSI(trial,bout) = NaN;

            end
    
        end
    end

    bout_distance_lt_mut_MSI{i} = mean(bout_distance_MSI,2,'omitnan'); % mean bout distance for each trial
    mean_boutDistance_lt_mut_MSI{i} = mean(reshape(bout_distance_lt_mut_MSI{i},6,[]),1,'omitnan'); % mean distance per bout for each fish

    % Get unimodal summation  --> duration of bouts tap + duration of bouts flash
       
   for trial = 1:size(mat_lowtap_mut,1)

       for bout = 1:size(mat_lowtap_mut,2)

            startFrame_tap = mat_lowtap_mut(trial,bout);
            endFrame_tap = boutend_mat_lowtap_mut(trial,bout);
            startFrame_flash = mat_flash_mut(trial,bout);
            endFrame_flash = boutend_mat_flash_mut(trial,bout);           

            % TAP

            if ~(isnan(startFrame_tap) || isnan(endFrame_tap));
                
                if startFrame_tap >= start_interval(1) && startFrame_tap <= stop_interval(1);

                % Sum distance travelled during the bout
                    bout_distance_lowtap(trial,bout) = sum(d_matrix_lowtap_mutant(trial,startFrame_tap:endFrame_tap));
                else
                    bout_distance_lowtap(trial,bout) = NaN;

                end

            end    
    
        end
    end
    
    bout_distance_lowtap_mut{i} = mean(bout_distance_lowtap,2,'omitnan')  % mean bout distance for each trial
    mean_boutDistance_lowtap_mut{i} = mean(reshape(bout_distance_lowtap_mut{i},6,[]),1,'omitnan'); % mean distance per bout for each fish
  
end

offset = 5
x = (SOA * 1000) - offset;

means_MSI_lt_mut_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_lt_mut_MSI);
sem_MSI_lt_mut_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_lt_mut_MSI);
means_lowtap_mut_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_lowtap_mut);
sem_lowtap_mut_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_lowtap_mut);

subplot(2,2,3)
hold on

errorbar((SOA*1000) - offset, means_lowtap_mut_boutdis, sem_lowtap_mut_boutdis,'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, means_MSI_lt_mut_boutdis, sem_MSI_lt_mut_boutdis , 'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Mean distance per bout (mm)');
legend('Tap', 'MSI');
title('82 db mutant');
xlim([-50 200])
ylim([0 6])
hold off


% ------------------------- 87 db mutant -------------------------

bout_distance_MSI = zeros(size(mat_hightap_mut));
bout_distance_hightap= zeros(size(mat_hightap_mut));

% Distance per bout MSI vs unimodal summation per SOA 
for i = 1:length(SOA)
    current_name_starts = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_starts = eval(current_name_starts);
    current_name_ends = ['boutend_mat_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_ends = eval(current_name_ends);
    current_name_distance = ['d_mat_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_distance = eval(current_name_distance);
   
    for trial = 1:size(current_starts,1)

        for bout = 1:size(current_starts,2)

        startFrame = current_starts(trial,bout);
        endFrame = current_ends(trial,bout);

        % skip empty values

            if isnan(startFrame) || isnan(endFrame);
                continue
            end    

        % Only keep bouts with starts between interval

            if startFrame >= start_interval(i) && startFrame <= stop_interval(i);

            % Sum distance travelled during the bout
                bout_distance_MSI(trial,bout) = sum(current_distance(trial,startFrame:endFrame));
            else
                bout_distance_MSI(trial,bout) = NaN;

            end
    
        end
    end

    bout_distance_ht_mut_MSI{i} = mean(bout_distance_MSI,2,'omitnan'); % mean bout distance for each trial
    mean_boutDistance_ht_mut_MSI{i} = mean(reshape(bout_distance_ht_mut_MSI{i},6,[]),1,'omitnan'); % mean distance per bout for each fish

    % Get unimodal summation  --> duration of bouts tap + duration of bouts flash
       
   for trial = 1:size(mat_hightap_mut,1)

       for bout = 1:size(mat_hightap_mut,2)

            startFrame_tap = mat_hightap_mut(trial,bout);
            endFrame_tap = boutend_mat_hightap_mut(trial,bout);
            startFrame_flash = mat_flash_mut(trial,bout);
            endFrame_flash = boutend_mat_flash_mut(trial,bout);           

            % TAP

            if ~(isnan(startFrame_tap) || isnan(endFrame_tap));
                
                if startFrame_tap >= start_interval(1) && startFrame_tap <= stop_interval(1);

                % Sum distance travelled during the bout
                    bout_distance_hightap(trial,bout) = sum(d_matrix_hightap_mutant(trial,startFrame_tap:endFrame_tap));
                else
                    bout_distance_hightap(trial,bout) = NaN;

                end

            end    

    
        end
    end
    
    bout_distance_hightap_mut{i} = mean(bout_distance_hightap,2,'omitnan')  % mean bout distance for each trial
    mean_boutDistance_hightap_mut{i} = mean(reshape(bout_distance_hightap_mut{i},6,[]),1,'omitnan'); % mean distance per bout for each fish
  
end

offset = 5
x = (SOA * 1000) - offset;

means_MSI_ht_mut_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_ht_mut_MSI);
sem_MSI_ht_mut_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_ht_mut_MSI);
means_hightap_mut_boutdis = cellfun(@(x) mean(x,'omitnan'), mean_boutDistance_hightap_mut);
sem_hightap_mut_boutdis = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), mean_boutDistance_hightap_mut);

subplot(2,2,4)
hold on

errorbar((SOA*1000) - offset, means_hightap_mut_boutdis, sem_hightap_mut_boutdis,'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, means_MSI_ht_mut_boutdis, sem_MSI_ht_mut_boutdis , 'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Mean distance per bout (mm)');
legend('Tap', 'MSI');
title('87 db mutant');
xlim([-50 200])
ylim([0 6])
hold off



%% Statistics bout distance per bout MSI versus unimodal summation
% Difference in mean distance per bout between MSI and only tap for each SOA
% Determine if there is a significant difference between the means of the two lists of distance per bout

% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

signrank_test_boutdis_lt_wt = zeros(1,length(SOA));
signrank_test_boutdis_lt_mut = zeros(1,length(SOA));
signrank_test_boutdis_ht_wt = zeros(1,length(SOA));
signrank_test_boutdis_ht_mut = zeros(1,length(SOA));

for i = 1: length(SOA)
    signrank_test_boutdis_lt_wt(:,i)= signrank(mean_boutDistance_lt_wt_MSI{i}, mean_boutDistance_lowtap_wt{i})
    signrank_test_boutdis_lt_mut(:,i)= signrank(mean_boutDistance_lt_mut_MSI{i}, mean_boutDistance_lowtap_mut{i})
    signrank_test_boutdis_ht_wt(:,i)= signrank(mean_boutDistance_ht_wt_MSI{i}, mean_boutDistance_hightap_wt{i})
    signrank_test_boutdis_ht_mut(:,i)= signrank(mean_boutDistance_ht_mut_MSI{i}, mean_boutDistance_hightap_mut{i})
end




%% MSI Interactive index (ii) 

% ii (%) = (CM - SMmax)* 100 /SMmax
% CM = mean response evoked by MSI, SMmax = mean response evoked by tap (highest unimodal response evoking)

ii_boutdis_lt_wt = zeros(1,length(SOA));
ii_boutdis_ht_wt = zeros(1,length(SOA));
ii_boutdis_lt_mut = zeros(1,length(SOA));
ii_boutdis_ht_mut = zeros(1,length(SOA));


for i = 1:length(SOA)   

    % Low tap wt  
    CM_lt_wt = means_MSI_lt_wt_boutdis(i);
    SMmax_lt_wt = means_lowtap_wt_boutdis(i);
    
    ii_boutdis_lt_wt(i) = ((CM_lt_wt-SMmax_lt_wt)*100)/SMmax_lt_wt

    % Low tap mutant
    CM_lt_mut = means_MSI_lt_mut_boutdis(i)
    SMmax_lt_mut = means_lowtap_mut_boutdis(i);
   
    ii_boutdis_lt_mut(i) = ((CM_lt_mut-SMmax_lt_mut)*100)/SMmax_lt_mut

    % High tap wt
    CM_ht_wt = means_MSI_ht_wt_boutdis(i)
    SMmax_ht_wt = means_hightap_wt_boutdis(i);

    ii_boutdis_ht_wt(i) = ((CM_ht_wt-SMmax_ht_wt)*100)/SMmax_ht_wt
   
    % High tap mutant
    CM_ht_mut = means_MSI_ht_mut_boutdis(i)
    SMmax_ht_mut = means_hightap_mut_boutdis(i);    

    ii_boutdis_ht_mut(i) = ((CM_ht_mut-SMmax_ht_mut)*100)/SMmax_ht_mut

end

% Plot

x_SOA = [0 50 100 150];   

figure('Name', 'Multisensory interactive index - Mean distance per bout')

plot(x_SOA,ii_boutdis_lt_wt,'o','Color','b', 'MarkerFaceColor', 'b')
hold on
plot(x_SOA,ii_boutdis_lt_mut,'o','Color', 'r', 'MarkerFaceColor','r')
plot(x_SOA,ii_boutdis_ht_wt,'^','Color','b','MarkerFaceColor','b')
plot(x_SOA,ii_boutdis_ht_mut,'^','Color', 'r','MarkerFaceColor','r')

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-10,100])
yline([0], '--k')
legend('wild-type 82 db', 'mutant 82 db', 'wild-type 87 db', 'mutant 87 db')

