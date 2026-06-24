%% Script to analyse MSI SOA data - Bout probability & Reaction time


clearvars
close all
clc

%% Get data and divide trials by condition

run('D:\Emma_Conrad\grab_data_MSI.m')


%% Find bout start for each condition

% Select bout types to include
selected_bouttypes = [11 12 13]; % Use active escape bouts (11, 12, 13)

% Bout start of 82 db only tap conditions

boutstart_lowtap = cell(1,num_sessions);

has_positive = false;

for batchID = 1:num_sessions;
     for wellID_lowtap = 1:num_wells;
        for trialID = 1:length(trials_lowtap{batchID});
            trialID_lowtap = trials_lowtap{batchID}(trialID);

            has_positive = false;
            
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_lowtap}{trialID_lowtap};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
                    break
                end
            end    

            if has_positive
                
                boutstart = zeros(1,1500);
                boutstart(idx) = vid_data{batchID}{wellID_lowtap}{trialID_lowtap}(69,idx);   
                boutstart_lowtap{batchID}{wellID_lowtap}{trialID} = boutstart;

                boutend = zeros(1,1500);
                boutend(idx) = vid_data{batchID}{wellID_lowtap}{trialID_lowtap}(70,idx);
                boutend_lowtap{batchID}{wellID_lowtap}{trialID} = boutend;

            else
                boutstart_lowtap{batchID}{wellID_lowtap}{trialID} = zeros(1,1500);   
                boutend_lowtap{batchID}{wellID_lowtap}{trialID} = zeros(1,1500);
            end

         end    
     end
end        


% Bout start of 87 db only tap conditions

boutstart_hightap = cell(1,length(trials_hightap));

for batchID = 1:num_sessions;
    for wellID_hightap = 1:num_wells;
        for trialID = 1:length(trials_hightap{batchID});
            trialID_hightap = trials_hightap{batchID}(trialID);

            has_positive = false;

           for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_hightap}{trialID_hightap};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
         
                    break
                end
            end    

            if has_positive

                boutstart = zeros(1,1500);
                boutstart(idx) = vid_data{batchID}{wellID_hightap}{trialID_hightap}(69,idx);   
                boutstart_hightap{batchID}{wellID_hightap}{trialID} = boutstart;

                boutend = zeros(1,1500);
                boutend(idx) = vid_data{batchID}{wellID_hightap}{trialID_hightap}(70,idx);
                boutend_hightap{batchID}{wellID_hightap}{trialID} = boutend;
            else
                boutstart_hightap{batchID}{wellID_hightap}{trialID} =  zeros(1,1500);
                boutend_hightap{batchID}{wellID_hightap}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end

% Bout start of flash conditions
boutstart_flash = cell(1,length(trials_flash));

for batchID = 1:length(trials_flash);
    for wellID_flash = 1:num_wells;
        for trialID = 1:length(trials_flash{batchID});
            trialID_flash = trials_flash{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_flash}{trialID_flash};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;

                    break
                end
            end    

            if has_positive

                boutstart = zeros(1,1500);
                boutstart(idx) = vid_data{batchID}{wellID_flash}{trialID_flash}(69,idx);   
                boutstart_flash{batchID}{wellID_flash}{trialID} = boutstart;

                boutend = zeros(1,1500);
                boutend(idx) = vid_data{batchID}{wellID_flash}{trialID_flash}(70,idx);
                boutend_flash{batchID}{wellID_flash}{trialID} = boutend;
            else
                boutstart_flash{batchID}{wellID_flash}{trialID} =  zeros(1,1500);  
                boutend_flash{batchID}{wellID_flash}{trialID} = zeros(1,1500);
           end

                
        end
    end        
end

% Bout start of MSI 0 SOA conditions - 82 db
 boutstart_0SOA_lt = cell(1,length(trials_0SOA_lt));

for batchID = 1:length(trials_0SOA_lt);
    for wellID_0SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_0SOA_lt{batchID});
            trialID_0SOA_lt = trials_0SOA_lt{batchID}(trialID);

            has_positive = false;
            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;

                    break
                end
            end    

            if has_positive

            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt}(69,idx);   
            boutstart_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt}(70,idx);
            boutend_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = boutend;
            else
            boutstart_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} =  zeros(1,1500);
            boutend_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end

% Bout start of MSI 50 SOA conditions - 82 db

boutstart_50SOA_lt = cell(1,length(trials_50SOA_lt));

for batchID = 1:length(trials_50SOA_lt);
    for wellID_50SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_50SOA_lt{batchID});
            trialID_50SOA_lt = trials_50SOA_lt{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;

                    break
                end
            end    

            if has_positive

            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt}(69,idx);   
            boutstart_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt}(70,idx);
            boutend_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = boutend;
            else
            boutstart_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} =  zeros(1,1500);
            boutend_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end

% Bout start of MSI 100 SOA conditions - 82 db

boutstart_100SOA_lt = cell(1,length(trials_100SOA_lt));


for batchID = 1:length(trials_100SOA_lt);
    for wellID_100SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_100SOA_lt{batchID});
            trialID_100SOA_lt = trials_100SOA_lt{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;

                    break
                end
            end    

            if has_positive

            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt}(69,idx);   
            boutstart_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt}(70,idx);
            boutend_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = boutend;
           else
            boutstart_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} =  zeros(1,1500);
           boutend_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end

% Bout start of MSI 150 SOA conditions - 82 db

boutstart_150SOA_lt = cell(1,length(trials_150SOA_lt));

for batchID = 1:length(trials_150SOA_lt);
    for wellID_150SOA_lt = 1:num_wells;
        for trialID = 1:length(trials_150SOA_lt{batchID});
            trialID_150SOA_lt = trials_150SOA_lt{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
                    break
                end
            end    

            if has_positive

            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt}(69,idx);   
            boutstart_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt}(70,idx);
            boutend_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = boutend;
            else
            boutstart_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} =  zeros(1,1500);
           boutend_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end



% Bout start of MSI 0 SOA conditions - 87 db
boutstart_0SOA_ht = cell(1,length(trials_0SOA_ht));

for batchID = 1:length(trials_0SOA_ht);
    for wellID_0SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_0SOA_ht{batchID});
            trialID_0SOA_ht = trials_0SOA_ht{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
                    break
                end
            end    

            if has_positive

            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht}(69,idx);   
            boutstart_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht}(70,idx);
            boutend_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = boutend;
            else
            boutstart_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} =  zeros(1,1500);
           boutend_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end

% Bout start of MSI 50 SOA conditions - 87 db

boutstart_50SOA_ht = cell(1,length(trials_50SOA_ht));

for batchID = 1:length(trials_50SOA_ht);
    for wellID_50SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_50SOA_ht{batchID});
            trialID_50SOA_ht = trials_50SOA_ht{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
                    break
                end
            end 

            if has_positive
            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht}(69,idx);   
            boutstart_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht}(70,idx);
            boutend_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = boutend;
            else
                boutstart_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} =  zeros(1,1500);
                boutend_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = zeros(1,1500);
            end

        end
    end        
end


% Bout start of MSI 100 SOA conditions - 87 db

boutstart_100SOA_ht = cell(1,length(trials_100SOA_ht));


for batchID = 1:length(trials_100SOA_ht);
    for wellID_100SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_100SOA_ht{batchID});
            trialID_100SOA_ht = trials_100SOA_ht{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
                    break
                end
            end 

            if has_positive
            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht}(69,idx);   
            boutstart_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht}(70,idx);
            boutend_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = boutend;
            else
                boutstart_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = zeros(1,1500);
                boutend_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = zeros(1,1500);
            end
                
        end
    end        
end

% Bout start of MSI 150 SOA conditions - 87 db

boutstart_150SOA_ht = cell(1,length(trials_150SOA_ht));

for batchID = 1:length(trials_150SOA_ht);
    for wellID_150SOA_ht = 1:num_wells;
        for trialID = 1:length(trials_150SOA_ht{batchID});
            trialID_150SOA_ht = trials_150SOA_ht{batchID}(trialID);

            has_positive = false;

            for k = selected_bouttypes
                vals = bout_types{k}{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht};

                if any(vals > 0 ,'all')
                    has_positive = true;
                    idx = vals>0;
                    break
                end
            end 

            if has_positive
            boutstart = zeros(1,1500);
            boutstart(idx) = vid_data{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht}(69,idx);   
            boutstart_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = boutstart;

            boutend = zeros(1,1500);
            boutend(idx) = vid_data{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht}(70,idx);
            boutend_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = boutend;
            else
                boutstart_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} =  zeros(1,1500);
                boutend_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = zeros(1,1500);
            end
               
        end
    end        
end


%% Divide bout start of trials per genotype


% Bout start of trials per genotype for unimodal, 0 SOA, 50 SOA, 100 SOA, and 150 SOA

genotypes = {'wt','het','mut'};

boutstart_lowtap_genotyped = cell(length(genotypes),1);
boutstart_hightap_genotyped = cell(length(genotypes),1);
boutstart_flash_genotyped = cell(length(genotypes),1);
boutstart_0SOA_genotyped_lt = cell(length(genotypes),1);
boutstart_50SOA_genotyped_lt = cell(length(genotypes),1);
boutstart_100SOA_genotyped_lt = cell(length(genotypes),1);
boutstart_150SOA_genotyped_lt = cell(length(genotypes),1);
boutstart_0SOA_genotyped_ht = cell(length(genotypes),1);
boutstart_50SOA_genotyped_ht = cell(length(genotypes),1);
boutstart_100SOA_genotyped_ht = cell(length(genotypes),1);
boutstart_150SOA_genotyped_ht = cell(length(genotypes),1);

run('D:\Emma_Conrad\genotype.m')

for batchID = 1:length(gene)

    for geneID = 1:length(genotypes)
        clear gene_well
        gene_well = (find(ismember(gene{batchID},genotypes{geneID})));

        for wellID = 1:length(gene_well)

            for trial = 1:6

                 boutstart_lowtap_genotyped{geneID}{batchID}{wellID}(trial,:) = boutstart_lowtap{batchID}{gene_well(wellID)}{trial};
                 boutstart_hightap_genotyped{geneID}{batchID}{wellID}(trial,:) = boutstart_hightap{batchID}{gene_well(wellID)}{trial};
                 boutstart_flash_genotyped{geneID}{batchID}{wellID}(trial,:) = boutstart_flash{batchID}{gene_well(wellID)}{trial};
                 boutstart_0SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutstart_0SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutstart_50SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutstart_50SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutstart_100SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutstart_100SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutstart_150SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutstart_150SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutstart_0SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutstart_0SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutstart_50SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutstart_50SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutstart_100SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutstart_100SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutstart_150SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutstart_150SOA_ht{batchID}{gene_well(wellID)}{trial};
            end
        end
    end   
end


%% Transpose

for geneID = 1:length(boutstart_lowtap_genotyped)

    boutstart_lowtap_genotyped{geneID} = boutstart_lowtap_genotyped{geneID}.';
    boutstart_hightap_genotyped{geneID} = boutstart_hightap_genotyped{geneID}.';
    boutstart_flash_genotyped{geneID} = boutstart_flash_genotyped{geneID}.';
    boutstart_0SOA_genotyped_lt{geneID} =  boutstart_0SOA_genotyped_lt{geneID}.';
    boutstart_50SOA_genotyped_lt{geneID} =  boutstart_50SOA_genotyped_lt{geneID}.';
    boutstart_100SOA_genotyped_lt{geneID} =  boutstart_100SOA_genotyped_lt{geneID}.';
    boutstart_150SOA_genotyped_lt{geneID} = boutstart_150SOA_genotyped_lt{geneID}.';
    boutstart_0SOA_genotyped_ht{geneID} =  boutstart_0SOA_genotyped_ht{geneID}.';
    boutstart_50SOA_genotyped_ht{geneID} = boutstart_50SOA_genotyped_ht{geneID}.';
    boutstart_100SOA_genotyped_ht{geneID} =  boutstart_100SOA_genotyped_ht{geneID}.';
    boutstart_150SOA_genotyped_ht{geneID} = boutstart_150SOA_genotyped_ht{geneID}.';


    for batchID = 1:length(boutstart_lowtap_genotyped{geneID})

        boutstart_lowtap_genotyped{geneID}{batchID} = boutstart_lowtap_genotyped{geneID}{batchID}.';
        boutstart_hightap_genotyped{geneID}{batchID} = boutstart_hightap_genotyped{geneID}{batchID}.';
        boutstart_flash_genotyped{geneID}{batchID} = boutstart_flash_genotyped{geneID}{batchID}.';
        boutstart_0SOA_genotyped_lt{geneID}{batchID} =  boutstart_0SOA_genotyped_lt{geneID}{batchID}.';
        boutstart_50SOA_genotyped_lt{geneID}{batchID} =  boutstart_50SOA_genotyped_lt{geneID}{batchID}.';
        boutstart_100SOA_genotyped_lt{geneID}{batchID} =  boutstart_100SOA_genotyped_lt{geneID}{batchID}.';
        boutstart_150SOA_genotyped_lt{geneID}{batchID} = boutstart_150SOA_genotyped_lt{geneID}{batchID}.';
        boutstart_0SOA_genotyped_ht{geneID}{batchID} =  boutstart_0SOA_genotyped_ht{geneID}{batchID}.';
        boutstart_50SOA_genotyped_ht{geneID}{batchID} = boutstart_50SOA_genotyped_ht{geneID}{batchID}.';
        boutstart_100SOA_genotyped_ht{geneID}{batchID} =  boutstart_100SOA_genotyped_ht{geneID}{batchID}.';
        boutstart_150SOA_genotyped_ht{geneID}{batchID} = boutstart_150SOA_genotyped_ht{geneID}{batchID}.';

    end
end

%% Divide bout end of trials per genotype


% Bout start of trials per genotype for unimodal, 0 SOA, 50 SOA, 100 SOA, and 150 SOA

genotypes = {'wt','het','mut'};

boutend_lowtap_genotyped = cell(length(genotypes),1);
boutend_hightap_genotyped = cell(length(genotypes),1);
boutend_flash_genotyped = cell(length(genotypes),1);
boutend_0SOA_genotyped_lt = cell(length(genotypes),1);
boutend_50SOA_genotyped_lt = cell(length(genotypes),1);
boutend_100SOA_genotyped_lt = cell(length(genotypes),1);
boutend_150SOA_genotyped_lt = cell(length(genotypes),1);
boutend_0SOA_genotyped_ht = cell(length(genotypes),1);
boutend_50SOA_genotyped_ht = cell(length(genotypes),1);
boutend_100SOA_genotyped_ht = cell(length(genotypes),1);
boutend_150SOA_genotyped_ht = cell(length(genotypes),1);

run('D:\Emma_Conrad\genotype.m')

for batchID = 1:length(gene)

    for geneID = 1:length(genotypes)
        clear gene_well
        gene_well = (find(ismember(gene{batchID},genotypes{geneID})));

        for wellID = 1:length(gene_well)

            for trial = 1:6

                 boutend_lowtap_genotyped{geneID}{batchID}{wellID}(trial,:) = boutend_lowtap{batchID}{gene_well(wellID)}{trial};
                 boutend_hightap_genotyped{geneID}{batchID}{wellID}(trial,:) = boutend_hightap{batchID}{gene_well(wellID)}{trial};
                 boutend_flash_genotyped{geneID}{batchID}{wellID}(trial,:) = boutend_flash{batchID}{gene_well(wellID)}{trial};
                 boutend_0SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutend_0SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutend_50SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutend_50SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutend_100SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutend_100SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutend_150SOA_genotyped_lt{geneID}{batchID}{wellID}(trial,:) = boutend_150SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutend_0SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutend_0SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutend_50SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutend_50SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutend_100SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutend_100SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutend_150SOA_genotyped_ht{geneID}{batchID}{wellID}(trial,:) = boutend_150SOA_ht{batchID}{gene_well(wellID)}{trial};
            end
        end
    end   
end


%% Transpose bout ends

for geneID = 1:length(boutend_lowtap_genotyped)

    boutend_lowtap_genotyped{geneID} = boutend_lowtap_genotyped{geneID}.';
    boutend_hightap_genotyped{geneID} = boutend_hightap_genotyped{geneID}.';
    boutend_flash_genotyped{geneID} = boutend_flash_genotyped{geneID}.';
    boutend_0SOA_genotyped_lt{geneID} =  boutend_0SOA_genotyped_lt{geneID}.';
    boutend_50SOA_genotyped_lt{geneID} =  boutend_50SOA_genotyped_lt{geneID}.';
    boutend_100SOA_genotyped_lt{geneID} =  boutend_100SOA_genotyped_lt{geneID}.';
    boutend_150SOA_genotyped_lt{geneID} = boutend_150SOA_genotyped_lt{geneID}.';
    boutend_0SOA_genotyped_ht{geneID} =  boutend_0SOA_genotyped_ht{geneID}.';
    boutend_50SOA_genotyped_ht{geneID} = boutend_50SOA_genotyped_ht{geneID}.';
    boutend_100SOA_genotyped_ht{geneID} =  boutend_100SOA_genotyped_ht{geneID}.';
    boutend_150SOA_genotyped_ht{geneID} = boutend_150SOA_genotyped_ht{geneID}.';


    for batchID = 1:length(boutend_lowtap_genotyped{geneID})

        boutend_lowtap_genotyped{geneID}{batchID} = boutend_lowtap_genotyped{geneID}{batchID}.';
        boutend_hightap_genotyped{geneID}{batchID} = boutend_hightap_genotyped{geneID}{batchID}.';
        boutend_flash_genotyped{geneID}{batchID} = boutend_flash_genotyped{geneID}{batchID}.';
        boutend_0SOA_genotyped_lt{geneID}{batchID} =  boutend_0SOA_genotyped_lt{geneID}{batchID}.';
        boutend_50SOA_genotyped_lt{geneID}{batchID} =  boutend_50SOA_genotyped_lt{geneID}{batchID}.';
        boutend_100SOA_genotyped_lt{geneID}{batchID} =  boutend_100SOA_genotyped_lt{geneID}{batchID}.';
        boutend_150SOA_genotyped_lt{geneID}{batchID} = boutend_150SOA_genotyped_lt{geneID}{batchID}.';
        boutend_0SOA_genotyped_ht{geneID}{batchID} =  boutend_0SOA_genotyped_ht{geneID}{batchID}.';
        boutend_50SOA_genotyped_ht{geneID}{batchID} = boutend_50SOA_genotyped_ht{geneID}{batchID}.';
        boutend_100SOA_genotyped_ht{geneID}{batchID} =  boutend_100SOA_genotyped_ht{geneID}{batchID}.';
        boutend_150SOA_genotyped_ht{geneID}{batchID} = boutend_150SOA_genotyped_ht{geneID}{batchID}.';

    end
end

%% Matrices of bout end

boutend_mat_lowtap_wt = cell2mat(vertcat(boutend_lowtap_genotyped{1}{:}));
boutend_end_mat_flash_wt = cell2mat(vertcat(boutend_flash_genotyped{1}{:}));
boutend_mat_0SOA_wt_lt = cell2mat(vertcat(boutend_0SOA_genotyped_lt{1}{:}));
boutend_mat_50SOA_wt_lt = cell2mat(vertcat(boutend_50SOA_genotyped_lt{1}{:}));
boutend_mat_100SOA_wt_lt = cell2mat(vertcat(boutend_100SOA_genotyped_lt{1}{:}));
boutend_mat_150SOA_wt_lt = cell2mat(vertcat(boutend_150SOA_genotyped_lt{1}{:}));
boutend_mat_lowtap_mut = cell2mat(vertcat(boutend_lowtap_genotyped{3}{:}));
boutend_mat_flash_mut = cell2mat(vertcat(boutend_flash_genotyped{3}{:}));
boutend_mat_0SOA_mut_lt = cell2mat(vertcat(boutend_0SOA_genotyped_lt{3}{:}));
boutend_mat_50SOA_mut_lt = cell2mat(vertcat(boutend_50SOA_genotyped_lt{3}{:}));
boutend_mat_100SOA_mut_lt = cell2mat(vertcat(boutend_100SOA_genotyped_lt{3}{:}));
boutend_mat_150SOA_mut_lt = cell2mat(vertcat(boutend_150SOA_genotyped_lt{3}{:}));

boutend_mat_hightap_wt = cell2mat(vertcat(boutend_hightap_genotyped{1}{:}));
boutend_mat_flash_wt = cell2mat(vertcat(boutend_flash_genotyped{1}{:}));
boutend_mat_0SOA_wt_ht = cell2mat(vertcat(boutend_0SOA_genotyped_ht{1}{:}));
boutend_mat_50SOA_wt_ht = cell2mat(vertcat(boutend_50SOA_genotyped_ht{1}{:}));
boutend_mat_100SOA_wt_ht = cell2mat(vertcat(boutend_100SOA_genotyped_ht{1}{:}));
boutend_mat_150SOA_wt_ht = cell2mat(vertcat(boutend_150SOA_genotyped_ht{1}{:}));
boutend_mat_hightap_mut = cell2mat(vertcat(boutend_hightap_genotyped{3}{:}));
boutend_mat_flash_mut = cell2mat(vertcat(boutend_flash_genotyped{3}{:}));
boutend_mat_0SOA_mut_ht = cell2mat(vertcat(boutend_0SOA_genotyped_ht{3}{:}));
boutend_mat_50SOA_mut_ht = cell2mat(vertcat(boutend_50SOA_genotyped_ht{3}{:}));
boutend_mat_100SOA_mut_ht = cell2mat(vertcat(boutend_100SOA_genotyped_ht{3}{:}));
boutend_mat_150SOA_mut_ht = cell2mat(vertcat(boutend_150SOA_genotyped_ht{3}{:}));



%% Raster plot bout starts and Bout probability p(bout) - 82 db wt
% Raster plot for data visualization
% probability = number of bouts at time interval/number of trials

x = linspace(-3, 3, 1501); % Time axis centered at 0
time_width = 0.004; % seconds --> to match 1500 frames
time_intervals = -3:time_width:3;
interval_centers = time_intervals(1:end-1) + time_width/2;
SOA = [0 0.05 0.1 0.15];
start_baseline = 1;
stop_baseline = 700;
num_trials_pfish = 6;
psth_bin = 6;

mat_lowtap_wt = cell2mat(vertcat(boutstart_lowtap_genotyped{1}{:}));
mat_flash_wt = cell2mat(vertcat(boutstart_flash_genotyped{1}{:}));
mat_0SOA_wt_lt = cell2mat(vertcat(boutstart_0SOA_genotyped_lt{1}{:}));
mat_50SOA_wt_lt = cell2mat(vertcat(boutstart_50SOA_genotyped_lt{1}{:}));
mat_100SOA_wt_lt = cell2mat(vertcat(boutstart_100SOA_genotyped_lt{1}{:}));
mat_150SOA_wt_lt = cell2mat(vertcat(boutstart_150SOA_genotyped_lt{1}{:}));
mat_lowtap_mut = cell2mat(vertcat(boutstart_lowtap_genotyped{3}{:}));
mat_flash_mut = cell2mat(vertcat(boutstart_flash_genotyped{3}{:}));
mat_0SOA_mut_lt = cell2mat(vertcat(boutstart_0SOA_genotyped_lt{3}{:}));
mat_50SOA_mut_lt = cell2mat(vertcat(boutstart_50SOA_genotyped_lt{3}{:}));
mat_100SOA_mut_lt = cell2mat(vertcat(boutstart_100SOA_genotyped_lt{3}{:}));
mat_150SOA_mut_lt = cell2mat(vertcat(boutstart_150SOA_genotyped_lt{3}{:}));


num_fish_wt = size(mat_0SOA_wt_lt,1)/num_trials_pfish;
num_fish_mut = size(mat_0SOA_mut_lt,1)/num_trials_pfish;



figure('Name', 'Bout starts & bout probability - 82 db wt')


subplot(2,6,1)
hold on

for trial = 1:size(mat_lowtap_wt,1)
    idx = mat_lowtap_wt(trial, :);

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    scatter(t, trial * ones(size(t)),10, 'filled','b')

end
hold off

title('Bout starts wt: tap')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,7)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_lt_wt = NaN(size(mat_lowtap_wt,1),length(time_intervals)-1);

hold on
for i = 1:(size(mat_lowtap_wt,1))
    all_times = [];
        
    idx = mat_lowtap_wt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);ylim([0,0.012])
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_lt / length(all_times);
    end
    
    bout_prob_lt_wt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_wt

mean_boutprob_lt_wt = mean(bout_prob_lt_wt,1,'omitnan');
mean_boutprob_lt_wt_binned = movmean(mean_boutprob_lt_wt,psth_bin);
mean_boutprob_lt_wt_smooth = smoothdata(mean_boutprob_lt_wt_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_lt_wt_smooth, 'b');

title('p(bout) wt: tap')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5 0.5])
xline(0, '--k')
legend('Tap', 'Flash')
ylim([0,0.012])
set(gca,'YAxisLocation','left')
ax = gca;
ax.YAxis.Exponent = 0;


subplot(2,6,2)
hold on

for trial = 1:size(mat_flash_wt,1)
    idx = mat_flash_wt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','r')

end
hold off

title('Bout starts wt: flash')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,8)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_flash_wt = NaN(size(mat_flash_wt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_flash_wt,1)
    all_times = [];
        
    idx = mat_flash_wt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_flash = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_flash / length(all_times);
    end
    
    bout_prob_flash_wt(i,:) = bout_prob;

end

% Bin here mean_boutprob_flash_wt

mean_boutprob_flash_wt = mean(bout_prob_flash_wt,1, 'omitnan');
mean_boutprob_flash_wt_binned = movmean(mean_boutprob_flash_wt,psth_bin);
mean_boutprob_flash_wt_smooth = smoothdata(mean_boutprob_flash_wt_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_flash_wt_smooth, 'r');
hold off

title('p(bout) wt: flash')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;




% ---- Bout probability unimodal summation -------
% Unimodal summation has to be shifted with SOAs

unimodalsum_lowtap_wt = cell(1,length(SOA));


for i = 1:length(SOA);

    shift_samples = round(SOA(i)*frame_rate);

    % --- Shift tap trace ---

    lowtap_shifted_wt = zeros(size(bout_prob_lt_wt));
    
    if shift_samples > 0
        lowtap_shifted_wt(:,shift_samples+1:end) = ...
            bout_prob_lt_wt(:,1:end-shift_samples); %

    else
        lowtap_shifted_wt = bout_prob_lt_wt;
    end


    % --- unimodal summation --
    A = lowtap_shifted_wt;
    B = bout_prob_flash_wt;

    both_nan = isnan(A) & isnan(B);

    A(isnan(A)) = 0;
    B(isnan(B)) = 0;

    Summed = A + B;
    Summed(both_nan) = NaN;

    unimodalsum_lowtap_wt{i} = Summed;
end    


% ------------------Continue plotting----------------------

subplot(2,6,3)
hold on

for trial = 1:size(mat_0SOA_wt_lt,1)
    idx = mat_0SOA_wt_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 0SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,9)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_0SOA_wt_lt = NaN(size(mat_0SOA_wt_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_0SOA_wt_lt,1)
    all_times = [];
        
    idx = mat_0SOA_wt_lt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_lt / length(all_times);
    end
    
    bout_prob_0SOA_wt_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_wt

mean_boutprob_0SOA_wt_lt = mean(bout_prob_0SOA_wt_lt,1, 'omitnan');
mean_boutprob_0SOA_wt_lt_binned = movmean(mean_boutprob_0SOA_wt_lt,psth_bin);
mean_boutprob_0SOA_wt_lt_smooth = smoothdata(mean_boutprob_0SOA_wt_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_wt_0SOA = mean(unimodalsum_lowtap_wt{1},1, 'omitnan');
diff_0SOA_wt_lt = mean(mean_unimodalsum_lowtap_wt_0SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_0SOA_wt_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_wt_0SOA_norm = mean_unimodalsum_lowtap_wt_0SOA - diff_0SOA_wt_lt;
mean_unimodalsum_lowtap_wt_0SOA_binned = movmean(mean_unimodalsum_lowtap_wt_0SOA,psth_bin);
mean_unimodalsum_lowtap_wt_0SOA_smooth = smoothdata(mean_unimodalsum_lowtap_wt_0SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_0SOA_wt_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_wt_0SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 0SOA')
xlabel('Time since stimulus onset')
legend('0 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;



subplot(2,6,4)
hold on

for trial = 1:size(mat_50SOA_wt_lt,1)
    idx = mat_50SOA_wt_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 50SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,10)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_50SOA_wt_lt = NaN(size(mat_50SOA_wt_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_50SOA_wt_lt,1)
    all_times = [];
        
    idx = mat_50SOA_wt_lt(i, :);

    if all(isnan(idx))
       continue
    end

     idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_lt / length(all_times);
    end
    
    bout_prob_50SOA_wt_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_wt

mean_boutprob_50SOA_wt_lt = mean(bout_prob_50SOA_wt_lt,1, 'omitnan');
mean_boutprob_50SOA_wt_lt_binned = movmean(mean_boutprob_50SOA_wt_lt,psth_bin);
mean_boutprob_50SOA_wt_lt_smooth = smoothdata(mean_boutprob_50SOA_wt_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_wt_50SOA = mean(unimodalsum_lowtap_wt{2},1,'omitnan');
diff_50SOA_wt_lt = mean(mean_unimodalsum_lowtap_wt_50SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_50SOA_wt_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_wt_50SOA_norm = mean_unimodalsum_lowtap_wt_50SOA - diff_50SOA_wt_lt;
mean_unimodalsum_lowtap_wt_50SOA_binned = movmean(mean_unimodalsum_lowtap_wt_50SOA,psth_bin);
mean_unimodalsum_lowtap_wt_50SOA_smooth = smoothdata(mean_unimodalsum_lowtap_wt_50SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_50SOA_wt_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_wt_50SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 50SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('50 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.05, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;



subplot(2,6,5)
hold on

for trial = 1:size(mat_100SOA_wt_lt,1)
    idx = mat_100SOA_wt_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,11)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_100SOA_wt_lt = NaN(size(mat_100SOA_wt_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_100SOA_wt_lt,1)
    all_times = [];
        
    idx = mat_100SOA_wt_lt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_lt / length(all_times);
    end
    
    bout_prob_100SOA_wt_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_wt

mean_boutprob_100SOA_wt_lt = mean(bout_prob_100SOA_wt_lt,1, 'omitnan');
mean_boutprob_100SOA_wt_lt_binned = movmean(mean_boutprob_100SOA_wt_lt,psth_bin);
mean_boutprob_100SOA_wt_lt_smooth = smoothdata(mean_boutprob_100SOA_wt_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_wt_100SOA = mean(unimodalsum_lowtap_wt{3},1,'omitnan');
diff_100SOA_wt_lt = mean(mean_unimodalsum_lowtap_wt_100SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_100SOA_wt_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_wt_100SOA_norm = mean_unimodalsum_lowtap_wt_100SOA - diff_100SOA_wt_lt;
mean_unimodalsum_lowtap_wt_100SOA_binned = movmean(mean_unimodalsum_lowtap_wt_100SOA,psth_bin);
mean_unimodalsum_lowtap_wt_100SOA_smooth = smoothdata(mean_unimodalsum_lowtap_wt_100SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_100SOA_wt_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_wt_100SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('100 SOA', 'Unimodal summation')
ylim([0,0.012])
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.1, '--k')
ax = gca;
ax.YAxis.Exponent = 0;


subplot(2,6,6)
hold on

for trial = 1:size(mat_150SOA_wt_lt,1)
    idx = mat_150SOA_wt_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,12)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_150SOA_wt_lt = NaN(size(mat_150SOA_wt_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_150SOA_wt_lt,1);
    all_times = [];
        
    idx = mat_150SOA_wt_lt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_lt / length(all_times);
    end
    
    bout_prob_150SOA_wt_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_wt

mean_boutprob_150SOA_wt_lt = mean(bout_prob_150SOA_wt_lt,1, 'omitnan');
mean_boutprob_150SOA_wt_lt_binned = movmean(mean_boutprob_150SOA_wt_lt,psth_bin);
mean_boutprob_150SOA_wt_lt_smooth = smoothdata(mean_boutprob_150SOA_wt_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_wt_150SOA = mean(unimodalsum_lowtap_wt{4},1,'omitnan');
diff_150SOA_wt_lt = mean(mean_unimodalsum_lowtap_wt_150SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_150SOA_wt_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_wt_150SOA_norm = mean_unimodalsum_lowtap_wt_150SOA - diff_150SOA_wt_lt;
mean_unimodalsum_lowtap_wt_150SOA_binned = movmean(mean_unimodalsum_lowtap_wt_150SOA,psth_bin);
mean_unimodalsum_lowtap_wt_150SOA_smooth = smoothdata(mean_unimodalsum_lowtap_wt_150SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_150SOA_wt_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_wt_150SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('150 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.15, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;


%% Raster plot bout starts and Bout probability p(bout) - 82 db mutant
% Raster plot for data visualization
% Probability = number of bouts at time interval/number of trials

figure('Name', 'Bout starts & bout probability - 82 db mutant')

subplot(2,6,1)
hold on

for trial = 1:size(mat_lowtap_mut,1)
    idx = mat_lowtap_mut(trial, :);

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    scatter(t, trial * ones(size(t)),10, 'filled','b')

end
hold off


title('Bout starts mut: tap')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,7)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_lt_mut = NaN(size(mat_lowtap_mut,1),length(time_intervals)-1);

hold on
for i = 1:(size(mat_lowtap_mut,1))
    all_times = [];
        
    idx = mat_lowtap_mut(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_lt / length(all_times);
    end
    
    bout_prob_lt_mut(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_mut

mean_boutprob_lt_mut = mean(bout_prob_lt_mut,1,'omitnan');
mean_boutprob_lt_mut_binned = movmean(mean_boutprob_lt_mut,psth_bin);
mean_boutprob_lt_mut_smooth = smoothdata(mean_boutprob_lt_mut_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_lt_mut_smooth, 'b');

title('p(bout) mut: tap')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;



subplot(2,6,2)
hold on

for trial = 1:size(mat_flash_mut,1)
    idx = mat_flash_mut(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','r')

end
hold off

title('Bout starts mut: flash')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])



subplot(2,6,8)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_flash_mut = NaN(size(mat_flash_mut,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_flash_mut,1)
    all_times = [];
        
    idx = mat_flash_mut(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_flash = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_flash / length(all_times);
    end
    
    bout_prob_flash_mut(i,:) = bout_prob;

end

% Bin here mean_boutprob_flash_mut

mean_boutprob_flash_mut = mean(bout_prob_flash_mut,1, 'omitnan');
mean_boutprob_flash_mut_binned = movmean(mean_boutprob_flash_mut,psth_bin);
mean_boutprob_flash_mut_smooth = smoothdata(mean_boutprob_flash_mut_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_flash_mut_smooth, 'r');
hold off

title('p(bout) mut: flash')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;



% ---- Bout probability unimodal summation -------
% Unimodal summation has to be shifted with SOAs

unimodalsum_lowtap_mut = cell(1,length(SOA));


for i = 1:length(SOA);

    shift_samples = round(SOA(i)*frame_rate);

    % --- Shift tap trace ---

    lowtap_shifted_mut = zeros(size(bout_prob_lt_mut));
    
    if shift_samples > 0
        lowtap_shifted_mut(:,shift_samples+1:end) = ...
            bout_prob_lt_mut(:,1:end-shift_samples); %

    else
        lowtap_shifted_mut = bout_prob_lt_mut;
    end


    % --- unimodal summation --

    A = lowtap_shifted_mut;
    B = bout_prob_flash_mut;

    both_nan = isnan(A) & isnan(B);

    A(isnan(A)) = 0;
    B(isnan(B)) = 0;

    Summed = A + B;
    Summed(both_nan) = NaN;

    unimodalsum_lowtap_mut{i} = Summed;
end    


% ------------------Continue plotting----------------------

subplot(2,6,3)
hold on

for trial = 1:size(mat_0SOA_mut_lt,1)
    idx = mat_0SOA_mut_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts mut: 0SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,0.1])
ylim([0,num_fish_mut * 6])


subplot(2,6,9)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_0SOA_mut_lt = NaN(size(mat_0SOA_mut_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_0SOA_mut_lt,1)
    all_times = [];
        
    idx = mat_0SOA_mut_lt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_lt / length(all_times);
    end
    
    bout_prob_0SOA_mut_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_mut

mean_boutprob_0SOA_mut_lt = mean(bout_prob_0SOA_mut_lt,1, 'omitnan');
mean_boutprob_0SOA_mut_lt_binned = movmean(mean_boutprob_0SOA_mut_lt,psth_bin);
mean_boutprob_0SOA_mut_lt_smooth = smoothdata(mean_boutprob_0SOA_mut_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_mut_0SOA = mean(unimodalsum_lowtap_mut{1},1, 'omitnan');
diff_0SOA_mut_lt = mean(mean_unimodalsum_lowtap_mut_0SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_0SOA_mut_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_mut_0SOA_norm = mean_unimodalsum_lowtap_mut_0SOA - diff_0SOA_mut_lt;
mean_unimodalsum_lowtap_mut_0SOA_binned = movmean(mean_unimodalsum_lowtap_mut_0SOA,psth_bin);
mean_unimodalsum_lowtap_mut_0SOA_smooth = smoothdata(mean_unimodalsum_lowtap_mut_0SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_0SOA_mut_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_mut_0SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) mut: 0SOA')
xlabel('Time since stimulus onset')
legend('0 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;

subplot(2,6,4)
hold on

for trial = 1:size(mat_50SOA_mut_lt,1)
    idx = mat_50SOA_mut_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts mut: 50SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,10)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_50SOA_mut_lt = NaN(size(mat_50SOA_mut_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_50SOA_mut_lt,1)
    all_times = [];
        
    idx = mat_50SOA_mut_lt(i, :);

    if all(isnan(idx))
       continue
    end

     idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_lt / length(all_times);
    end
    
    bout_prob_50SOA_mut_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_mut

mean_boutprob_50SOA_mut_lt = mean(bout_prob_50SOA_mut_lt,1, 'omitnan');
mean_boutprob_50SOA_mut_lt_binned = movmean(mean_boutprob_50SOA_mut_lt,psth_bin);
mean_boutprob_50SOA_mut_lt_smooth = smoothdata(mean_boutprob_50SOA_mut_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_mut_50SOA = mean(unimodalsum_lowtap_mut{2},1,'omitnan');
diff_50SOA_mut_lt = mean(mean_unimodalsum_lowtap_mut_50SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_50SOA_wt_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_mut_50SOA_norm = mean_unimodalsum_lowtap_mut_50SOA - diff_50SOA_mut_lt;
mean_unimodalsum_lowtap_mut_50SOA_binned = movmean(mean_unimodalsum_lowtap_mut_50SOA,psth_bin);
mean_unimodalsum_lowtap_mut_50SOA_smooth = smoothdata(mean_unimodalsum_lowtap_mut_50SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_50SOA_mut_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_mut_50SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) mut: 50SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('50 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.05, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;


subplot(2,6,5)
hold on

for trial = 1:size(mat_100SOA_mut_lt,1)
    idx = mat_100SOA_mut_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts mut: 100SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,11)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_100SOA_mut_lt = NaN(size(mat_100SOA_mut_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_100SOA_mut_lt,1)
    all_times = [];
        
    idx = mat_100SOA_mut_lt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_lt / length(all_times);
    end
    
    bout_prob_100SOA_mut_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_mut

mean_boutprob_100SOA_mut_lt = mean(bout_prob_100SOA_mut_lt,1, 'omitnan');
mean_boutprob_100SOA_mut_lt_binned = movmean(mean_boutprob_100SOA_mut_lt,psth_bin);
mean_boutprob_100SOA_mut_lt_smooth = smoothdata(mean_boutprob_100SOA_mut_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_mut_100SOA = mean(unimodalsum_lowtap_mut{3},1,'omitnan');
diff_100SOA_mut_lt = mean(mean_unimodalsum_lowtap_mut_100SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_100SOA_mut_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_mut_100SOA_norm = mean_unimodalsum_lowtap_mut_100SOA - diff_100SOA_mut_lt;
mean_unimodalsum_lowtap_mut_100SOA_binned = movmean(mean_unimodalsum_lowtap_mut_100SOA,psth_bin);
mean_unimodalsum_lowtap_mut_100SOA_smooth = smoothdata(mean_unimodalsum_lowtap_mut_100SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_100SOA_mut_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_mut_100SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('100 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.1, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;

subplot(2,6,6)
hold on

for trial = 1:size(mat_150SOA_mut_lt,1)
    idx = mat_150SOA_mut_lt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,12)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_150SOA_mut_lt = NaN(size(mat_150SOA_mut_lt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_150SOA_mut_lt,1);
    all_times = [];
        
    idx = mat_150SOA_mut_lt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_lt = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_lt / length(all_times);
    end
    
    bout_prob_150SOA_mut_lt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_lt_mut

mean_boutprob_150SOA_mut_lt = mean(bout_prob_150SOA_mut_lt,1, 'omitnan');
mean_boutprob_150SOA_mut_lt_binned = movmean(mean_boutprob_150SOA_mut_lt,psth_bin);
mean_boutprob_150SOA_mut_lt_smooth = smoothdata(mean_boutprob_150SOA_mut_lt_binned,'gaussian', 5);


mean_unimodalsum_lowtap_mut_150SOA = mean(unimodalsum_lowtap_mut{4},1,'omitnan');
diff_150SOA_mut_lt = mean(mean_unimodalsum_lowtap_mut_150SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_150SOA_mut_lt(start_baseline:stop_baseline));
mean_unimodalsum_lowtap_mut_150SOA_norm = mean_unimodalsum_lowtap_mut_150SOA - diff_150SOA_mut_lt;
mean_unimodalsum_lowtap_mut_150SOA_binned = movmean(mean_unimodalsum_lowtap_mut_150SOA,psth_bin);
mean_unimodalsum_lowtap_mut_150SOA_smooth = smoothdata(mean_unimodalsum_lowtap_mut_150SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_150SOA_mut_lt_smooth, 'm');
plot(interval_centers, mean_unimodalsum_lowtap_mut_150SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('150 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.15, '--k')
ylim([0,0.012])
ax = gca;
ax.YAxis.Exponent = 0;


%% Raster plot bout starts and Bout probability p(bout) - 87 db wt
% Raster plot for data visualization
% probability = number of bouts at time interval/number of trials

x = linspace(-3, 3, 1501); % Time axis centered at 0

mat_hightap_wt = cell2mat(vertcat(boutstart_hightap_genotyped{1}{:}));
mat_flash_wt = cell2mat(vertcat(boutstart_flash_genotyped{1}{:}));
mat_0SOA_wt_ht = cell2mat(vertcat(boutstart_0SOA_genotyped_ht{1}{:}));
mat_50SOA_wt_ht = cell2mat(vertcat(boutstart_50SOA_genotyped_ht{1}{:}));
mat_100SOA_wt_ht = cell2mat(vertcat(boutstart_100SOA_genotyped_ht{1}{:}));
mat_150SOA_wt_ht = cell2mat(vertcat(boutstart_150SOA_genotyped_ht{1}{:}));
mat_hightap_mut = cell2mat(vertcat(boutstart_hightap_genotyped{3}{:}));
mat_flash_mut = cell2mat(vertcat(boutstart_flash_genotyped{3}{:}));
mat_0SOA_mut_ht = cell2mat(vertcat(boutstart_0SOA_genotyped_ht{3}{:}));
mat_50SOA_mut_ht = cell2mat(vertcat(boutstart_50SOA_genotyped_ht{3}{:}));
mat_100SOA_mut_ht = cell2mat(vertcat(boutstart_100SOA_genotyped_ht{3}{:}));
mat_150SOA_mut_ht = cell2mat(vertcat(boutstart_150SOA_genotyped_ht{3}{:}));


figure('Name', 'Bout starts & bout probability - 87 db wt')


subplot(2,6,1)
hold on

for trial = 1:size(mat_hightap_wt,1)
    idx = mat_hightap_wt(trial, :);

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    scatter(t, trial * ones(size(t)),10, 'filled','b')

end
hold off

title('Bout starts wt: tap')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.05,0.05])
ylim([0,num_fish_wt * 6])


subplot(2,6,7)
clear all_times
clear idx
clear t
clear counts_wt_lt
clear bout_prob

bout_prob_ht_wt = NaN(size(mat_hightap_wt,1),length(time_intervals)-1);

hold on
for i = 1:(size(mat_hightap_wt,1))
    all_times = [];
        
    idx = mat_hightap_wt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see behigh
    else
        counts_wt_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_ht / length(all_times);
    end
    
    bout_prob_ht_wt(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_wt

mean_boutprob_ht_wt = mean(bout_prob_ht_wt,1,'omitnan');
mean_boutprob_ht_wt_binned = movmean(mean_boutprob_ht_wt,psth_bin);
mean_boutprob_ht_wt_smooth = smoothdata(mean_boutprob_ht_wt_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_ht_wt_smooth, 'b');

title('p(bout) wt: tap')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5 0.5])
xline(0, '--k')
ylim([0,0.012])


subplot(2,6,2)
hold on

for trial = 1:size(mat_flash_wt,1)
    idx = mat_flash_wt(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','r')

end
hold off

title('Bout starts wt: flash')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])



subplot(2,6,8)
clear all_times
clear idx
clear t
clear counts_wt_ht
clear bout_prob

bout_prob_flash_wt = NaN(size(mat_flash_wt,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_flash_wt,1)
    all_times = [];
        
    idx = mat_flash_wt(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_flash = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_flash / length(all_times);
    end
    
    bout_prob_flash_wt(i,:) = bout_prob;

end

% Bin here mean_boutprob_flash_wt

mean_boutprob_flash_wt = mean(bout_prob_flash_wt,1, 'omitnan');
mean_boutprob_flash_wt_binned = movmean(mean_boutprob_flash_wt,psth_bin);
mean_boutprob_flash_wt_smooth = smoothdata(mean_boutprob_flash_wt_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_flash_wt_smooth, 'r');
hold off

title('p(bout) wt: flash')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5,0.5])
ylim([0,0.012])



% ---- Bout probability unimodal summation -------
% Unimodal summation has to be shifted with SOAs

unimodalsum_hightap_wt = cell(1,length(SOA));


for i = 1:length(SOA);

    shift_samples = round(SOA(i)*frame_rate);

    % --- Shift tap trace ---

    hightap_shifted_wt = zeros(size(bout_prob_ht_wt));
    
    if shift_samples > 0
        hightap_shifted_wt(:,shift_samples+1:end) = ...
            bout_prob_ht_wt(:,1:end-shift_samples); %

    else
        hightap_shifted_wt = bout_prob_ht_wt;
    end


    % --- unimodal summation --
    A = hightap_shifted_wt;
    B = bout_prob_flash_wt;

    both_nan = isnan(A) & isnan(B);

    A(isnan(A)) = 0;
    B(isnan(B)) = 0;

    Summed = A + B;
    Summed(both_nan) = NaN;

    unimodalsum_hightap_wt{i} = Summed;
end    


% ------------------Continue plotting----------------------

subplot(2,6,3)
hold on

for trial = 1:size(mat_0SOA_wt_ht,1)
    idx = mat_0SOA_wt_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 0SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,9)
clear all_times
clear idx
clear t
clear counts_wt_ht
clear bout_prob

bout_prob_0SOA_wt_ht = NaN(size(mat_0SOA_wt_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_0SOA_wt_ht,1)
    all_times = [];
        
    idx = mat_0SOA_wt_ht(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_ht / length(all_times);
    end
    
    bout_prob_0SOA_wt_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_wt

mean_boutprob_0SOA_wt_ht = mean(bout_prob_0SOA_wt_ht,1, 'omitnan');
mean_boutprob_0SOA_wt_ht_binned = movmean(mean_boutprob_0SOA_wt_ht,psth_bin);
mean_boutprob_0SOA_wt_ht_smooth = smoothdata(mean_boutprob_0SOA_wt_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_wt_0SOA = mean(unimodalsum_hightap_wt{1},1, 'omitnan');
diff_0SOA_wt_ht = mean(mean_unimodalsum_hightap_wt_0SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_0SOA_wt_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_wt_0SOA_norm = mean_unimodalsum_hightap_wt_0SOA - diff_0SOA_wt_ht;
mean_unimodalsum_hightap_wt_0SOA_binned = movmean(mean_unimodalsum_hightap_wt_0SOA,psth_bin);
mean_unimodalsum_hightap_wt_0SOA_smooth = smoothdata(mean_unimodalsum_hightap_wt_0SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_0SOA_wt_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_wt_0SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 0SOA')
xlabel('Time since stimulus onset')
legend('0 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
ylim([0,0.012])


subplot(2,6,4)
hold on

for trial = 1:size(mat_50SOA_wt_ht,1)
    idx = mat_50SOA_wt_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 50SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,10)
clear all_times
clear idx
clear t
clear counts_wt_ht
clear bout_prob

bout_prob_50SOA_wt_ht = NaN(size(mat_50SOA_wt_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_50SOA_wt_ht,1)
    all_times = [];
        
    idx = mat_50SOA_wt_ht(i, :);

    if all(isnan(idx))
       continue
    end

     idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_ht / length(all_times);
    end
    
    bout_prob_50SOA_wt_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_wt

mean_boutprob_50SOA_wt_ht = mean(bout_prob_50SOA_wt_ht,1, 'omitnan');
mean_boutprob_50SOA_wt_ht_binned = movmean(mean_boutprob_50SOA_wt_ht,psth_bin);
mean_boutprob_50SOA_wt_ht_smooth = smoothdata(mean_boutprob_50SOA_wt_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_wt_50SOA = mean(unimodalsum_hightap_wt{2},1,'omitnan');
diff_50SOA_wt_ht = mean(mean_unimodalsum_hightap_wt_50SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_50SOA_wt_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_wt_50SOA_norm = mean_unimodalsum_hightap_wt_50SOA - diff_50SOA_wt_ht;
mean_unimodalsum_hightap_wt_50SOA_binned = movmean(mean_unimodalsum_hightap_wt_50SOA,psth_bin);
mean_unimodalsum_hightap_wt_50SOA_smooth = smoothdata(mean_unimodalsum_hightap_wt_50SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_50SOA_wt_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_wt_50SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 50SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('50 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
ylim([0,0.012])


subplot(2,6,5)
hold on

for trial = 1:size(mat_100SOA_wt_ht,1)
    idx = mat_100SOA_wt_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,11)
clear all_times
clear idx
clear t
clear counts_wt_ht
clear bout_prob

bout_prob_100SOA_wt_ht = NaN(size(mat_100SOA_wt_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_100SOA_wt_ht,1)
    all_times = [];
        
    idx = mat_100SOA_wt_ht(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_ht / length(all_times);
    end
    
    bout_prob_100SOA_wt_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_wt

mean_boutprob_100SOA_wt_ht = mean(bout_prob_100SOA_wt_ht,1, 'omitnan');
mean_boutprob_100SOA_wt_ht_binned = movmean(mean_boutprob_100SOA_wt_ht,psth_bin);
mean_boutprob_100SOA_wt_ht_smooth = smoothdata(mean_boutprob_100SOA_wt_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_wt_100SOA = mean(unimodalsum_hightap_wt{3},1,'omitnan');
diff_100SOA_wt_ht = mean(mean_unimodalsum_hightap_wt_100SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_100SOA_wt_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_wt_100SOA_norm = mean_unimodalsum_hightap_wt_100SOA - diff_100SOA_wt_ht;
mean_unimodalsum_hightap_wt_100SOA_binned = movmean(mean_unimodalsum_hightap_wt_100SOA,psth_bin);
mean_unimodalsum_hightap_wt_100SOA_smooth = smoothdata(mean_unimodalsum_hightap_wt_100SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_100SOA_wt_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_wt_100SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('100 SOA', 'Unimodal summation')
ylim([0,0.012])
xlim([-0.5,0.5])

subplot(2,6,6)
hold on

for trial = 1:size(mat_150SOA_wt_ht,1)
    idx = mat_150SOA_wt_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_wt * 6])


subplot(2,6,12)
clear all_times
clear idx
clear t
clear counts_wt_ht
clear bout_prob

bout_prob_150SOA_wt_ht = NaN(size(mat_150SOA_wt_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_150SOA_wt_ht,1);
    all_times = [];
        
    idx = mat_150SOA_wt_ht(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_wt_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_wt_ht / length(all_times);
    end
    
    bout_prob_150SOA_wt_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_wt

mean_boutprob_150SOA_wt_ht = mean(bout_prob_150SOA_wt_ht,1, 'omitnan');
mean_boutprob_150SOA_wt_ht_binned = movmean(mean_boutprob_150SOA_wt_ht,psth_bin);
mean_boutprob_150SOA_wt_ht_smooth = smoothdata(mean_boutprob_150SOA_wt_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_wt_150SOA = mean(unimodalsum_hightap_wt{4},1,'omitnan');
diff_150SOA_wt_ht = mean(mean_unimodalsum_hightap_wt_150SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_150SOA_wt_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_wt_150SOA_norm = mean_unimodalsum_hightap_wt_150SOA - diff_150SOA_wt_ht;
mean_unimodalsum_hightap_wt_150SOA_binned = movmean(mean_unimodalsum_hightap_wt_150SOA,psth_bin);
mean_unimodalsum_hightap_wt_150SOA_smooth = smoothdata(mean_unimodalsum_hightap_wt_150SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_150SOA_wt_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_wt_150SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('150 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
ylim([0,0.012])


%% Raster plot bout starts and Bout probability p(bout) - 87 db mutant

figure('Name', 'Bout starts & bout probability - 87 db mutant ')


subplot(2,6,1)
hold on

for trial = 1:size(mat_hightap_mut,1)
    idx = mat_hightap_mut(trial, :);

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    scatter(t, trial * ones(size(t)),10, 'filled','b')

end
hold off

title('Bout starts wt: tap')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,7)
clear all_times
clear idx
clear t
clear counts_mut_lt
clear bout_prob

bout_prob_ht_mut = NaN(size(mat_hightap_mut,1),length(time_intervals)-1);

hold on
for i = 1:(size(mat_hightap_mut,1))
    all_times = [];
        
    idx = mat_hightap_mut(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see behigh
    else
        counts_mut_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_ht / length(all_times);
    end
    
    bout_prob_ht_mut(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_mut

mean_boutprob_ht_mut = mean(bout_prob_ht_mut,1,'omitnan');
mean_boutprob_ht_mut_binned = movmean(mean_boutprob_ht_mut,psth_bin);
mean_boutprob_ht_mut_smooth = smoothdata(mean_boutprob_ht_mut_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_ht_mut_smooth, 'b');

title('p(bout) wt: tap')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5 0.5])
xline(0, '--k')
ylim([0,0.012])



subplot(2,6,2)
hold on

for trial = 1:size(mat_flash_mut,1)
    idx = mat_flash_mut(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','r')

end
hold off

title('Bout starts wt: flash')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])



subplot(2,6,8)
clear all_times
clear idx
clear t
clear counts_mut_ht
clear bout_prob

bout_prob_flash_mut = NaN(size(mat_flash_mut,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_flash_mut,1)
    all_times = [];
        
    idx = mat_flash_mut(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_flash = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_flash / length(all_times);
    end
    
    bout_prob_flash_mut(i,:) = bout_prob;

end

% Bin here mean_boutprob_flash_mut

mean_boutprob_flash_mut = mean(bout_prob_flash_mut,1, 'omitnan');
mean_boutprob_flash_mut_binned = movmean(mean_boutprob_flash_mut,psth_bin);
mean_boutprob_flash_mut_smooth = smoothdata(mean_boutprob_flash_mut_binned,'gaussian', 5);


plot(interval_centers, mean_boutprob_flash_mut_smooth, 'r');
hold off

title('p(bout) wt: flash')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])



% ---- Bout probability unimodal summation -------
% Unimodal summation has to be shifted with SOAs

unimodalsum_hightap_mut = cell(1,length(SOA));


for i = 1:length(SOA);

    shift_samples = round(SOA(i)*frame_rate);

    % --- Shift tap trace ---

    hightap_shifted_mut = zeros(size(bout_prob_ht_mut));
    
    if shift_samples > 0
        hightap_shifted_mut(:,shift_samples+1:end) = ...
            bout_prob_ht_mut(:,1:end-shift_samples); %

    else
        hightap_shifted_mut = bout_prob_ht_mut;
    end


    % --- unimodal summation --
    A = hightap_shifted_mut;
    B = bout_prob_flash_mut;

    both_nan = isnan(A) & isnan(B);

    A(isnan(A)) = 0;
    B(isnan(B)) = 0;

    Summed = A + B;
    Summed(both_nan) = NaN;

    unimodalsum_hightap_mut{i} = Summed;
end    


% ------------------Continue plotting----------------------

subplot(2,6,3)
hold on

for trial = 1:size(mat_0SOA_mut_ht,1)
    idx = mat_0SOA_mut_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 0SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,9)
clear all_times
clear idx
clear t
clear counts_mut_ht
clear bout_prob

bout_prob_0SOA_mut_ht = NaN(size(mat_0SOA_mut_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_0SOA_mut_ht,1)
    all_times = [];
        
    idx = mat_0SOA_mut_ht(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_ht / length(all_times);
    end
    
    bout_prob_0SOA_mut_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_mut

mean_boutprob_0SOA_mut_ht = mean(bout_prob_0SOA_mut_ht,1, 'omitnan');
mean_boutprob_0SOA_mut_ht_binned = movmean(mean_boutprob_0SOA_mut_ht,psth_bin);
mean_boutprob_0SOA_mut_ht_smooth = smoothdata(mean_boutprob_0SOA_mut_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_mut_0SOA = mean(unimodalsum_hightap_mut{1},1, 'omitnan');
diff_0SOA_mut_ht = mean(mean_unimodalsum_hightap_mut_0SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_0SOA_mut_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_mut_0SOA_norm = mean_unimodalsum_hightap_mut_0SOA - diff_0SOA_mut_ht;
mean_unimodalsum_hightap_mut_0SOA_binned = movmean(mean_unimodalsum_hightap_mut_0SOA,psth_bin);
mean_unimodalsum_hightap_mut_0SOA_smooth = smoothdata(mean_unimodalsum_hightap_mut_0SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_0SOA_mut_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_mut_0SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 0SOA')
xlabel('Time since stimulus onset')
legend('0 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
ylim([0,0.012])


subplot(2,6,4)
hold on

for trial = 1:size(mat_50SOA_mut_ht,1)
    idx = mat_50SOA_mut_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 50SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,10)
clear all_times
clear idx
clear t
clear counts_mut_ht
clear bout_prob

bout_prob_50SOA_mut_ht = NaN(size(mat_50SOA_mut_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_50SOA_mut_ht,1)
    all_times = [];
        
    idx = mat_50SOA_mut_ht(i, :);

    if all(isnan(idx))
       continue
    end

     idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_ht / length(all_times);
    end
    
    bout_prob_50SOA_mut_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_mut

mean_boutprob_50SOA_mut_ht = mean(bout_prob_50SOA_mut_ht,1, 'omitnan');
mean_boutprob_50SOA_mut_ht_binned = movmean(mean_boutprob_50SOA_mut_ht,psth_bin);
mean_boutprob_50SOA_mut_ht_smooth = smoothdata(mean_boutprob_50SOA_mut_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_mut_50SOA = mean(unimodalsum_hightap_mut{2},1,'omitnan');
diff_50SOA_mut_ht = mean(mean_unimodalsum_hightap_mut_50SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_50SOA_mut_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_mut_50SOA_norm = mean_unimodalsum_hightap_mut_50SOA - diff_50SOA_mut_ht;
mean_unimodalsum_hightap_mut_50SOA_binned = movmean(mean_unimodalsum_hightap_mut_50SOA,psth_bin);
mean_unimodalsum_hightap_mut_50SOA_smooth = smoothdata(mean_unimodalsum_hightap_mut_50SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_50SOA_mut_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_mut_50SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 50SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('50 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.05, '--k')
ylim([0,0.012])


subplot(2,6,5)
hold on

for trial = 1:size(mat_100SOA_mut_ht,1)
    idx = mat_100SOA_mut_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])
ylim([0,num_fish_mut * 6])


subplot(2,6,11)
clear all_times
clear idx
clear t
clear counts_mut_ht
clear bout_prob

bout_prob_100SOA_mut_ht = NaN(size(mat_100SOA_mut_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_100SOA_mut_ht,1)
    all_times = [];
        
    idx = mat_100SOA_mut_ht(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_ht / length(all_times);
    end
    
    bout_prob_100SOA_mut_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_mut

mean_boutprob_100SOA_mut_ht = mean(bout_prob_100SOA_mut_ht,1, 'omitnan');
mean_boutprob_100SOA_mut_ht_binned = movmean(mean_boutprob_100SOA_mut_ht,psth_bin);
mean_boutprob_100SOA_mut_ht_smooth = smoothdata(mean_boutprob_100SOA_mut_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_mut_100SOA = mean(unimodalsum_hightap_mut{3},1,'omitnan');
diff_100SOA_mut_ht = mean(mean_unimodalsum_hightap_mut_100SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_100SOA_mut_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_mut_100SOA_norm = mean_unimodalsum_hightap_mut_100SOA - diff_100SOA_mut_ht;
mean_unimodalsum_hightap_mut_100SOA_binned = movmean(mean_unimodalsum_hightap_mut_100SOA,psth_bin);
mean_unimodalsum_hightap_mut_100SOA_smooth = smoothdata(mean_unimodalsum_hightap_mut_100SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_100SOA_mut_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_mut_100SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 100SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('100 SOA', 'Unimodal summation')
ylim([0,0.012])
xline(0, '--k')
xline(0.1, '--k')
xlim([-0.5,0.5])

subplot(2,6,6)
hold on

for trial = 1:size(mat_150SOA_mut_ht,1)
    idx = mat_150SOA_mut_ht(trial, :);
    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference

    scatter(t, trial * ones(size(t)),10, 'filled','m')

end
hold off

title('Bout starts wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('Fish#/Trials')
xlim([-0.5,0.5])

ylim([0,num_fish_mut * 6])


subplot(2,6,12)
clear all_times
clear idx
clear t
clear counts_mut_ht
clear bout_prob

bout_prob_150SOA_mut_ht = NaN(size(mat_150SOA_mut_ht,1),length(time_intervals)-1);

hold on
for i = 1:size(mat_150SOA_mut_ht,1);
    all_times = [];
        
    idx = mat_150SOA_mut_ht(i, :);

    if all(isnan(idx))
       continue
    end

    idx = idx(~isnan(idx) & idx ~= 0);
    t = x(idx);   % already in time relative to some reference
    all_times = [all_times,t];
     
    if isempty(all_times)
        bout_prob = NaN(1, length(time_intervals)-1);  % or NaN, see below
    else
        counts_mut_ht = histcounts(all_times, time_intervals);
        bout_prob = counts_mut_ht / length(all_times);
    end
    
    bout_prob_150SOA_mut_ht(i,:) = bout_prob;

end

% Bin here mean_bout_prob_ht_mut

mean_boutprob_150SOA_mut_ht = mean(bout_prob_150SOA_mut_ht,1, 'omitnan');
mean_boutprob_150SOA_mut_ht_binned = movmean(mean_boutprob_150SOA_mut_ht,psth_bin);
mean_boutprob_150SOA_mut_ht_smooth = smoothdata(mean_boutprob_150SOA_mut_ht_binned,'gaussian', 5);


mean_unimodalsum_hightap_mut_150SOA = mean(unimodalsum_hightap_mut{4},1,'omitnan');
diff_150SOA_mut_ht = mean(mean_unimodalsum_hightap_mut_150SOA(start_baseline:stop_baseline)) - mean(mean_boutprob_150SOA_mut_ht(start_baseline:stop_baseline));
mean_unimodalsum_hightap_mut_150SOA_norm = mean_unimodalsum_hightap_mut_150SOA - diff_150SOA_mut_ht;
mean_unimodalsum_hightap_mut_150SOA_binned = movmean(mean_unimodalsum_hightap_mut_150SOA,psth_bin);
mean_unimodalsum_hightap_mut_150SOA_smooth = smoothdata(mean_unimodalsum_hightap_mut_150SOA_binned,'gaussian', 5);

plot(interval_centers, mean_boutprob_150SOA_mut_ht_smooth, 'm');
plot(interval_centers, mean_unimodalsum_hightap_mut_150SOA_smooth ,'Color', '#FF8800');
hold off

title('p(bout) wt: 150SOA')
xlabel('Time since stimulus onset')
ylabel('p(bout)')
legend('150 SOA', 'Unimodal summation')
xlim([-0.5,0.5])
xline(0, '--k')
xline(0.15, '--k')
ylim([0,0.012])

%% Bout probability MSI versus unimodal summation for all SOAs
% Instead of probability over time --> get per trial probability
% Total probability per condition

% Probability of a bout after stimulus onset
% Mean p(bout) per fish --> plot that with sem --> variation will be between fish

start_interval_sum = zeros(1,length(SOA))
stop_interval_sum = zeros(1,length(SOA))

for i = 1:length(SOA)
    start_interval_sum(i) = 750 - (frame_rate * SOA(i))
    stop_interval_sum(i) = 800 - (frame_rate * SOA(i)) % 0.3 seconds (when p(bout) becomes close to 0 again for the 150 SOA conditions) * framerate
end

start_interval = zeros(1,length(SOA))
stop_interval = zeros(1,length(SOA))

for i = 1:length(SOA)
    start_interval(i) = 750 + (frame_rate * SOA(i))
    stop_interval(i) = 800 + (frame_rate * SOA(i)) % 0.3 seconds (when p(bout) becomes close to 0 again for the 150 SOA conditions) * framerate
end

mean_MSI_boutprob_lt_wt = cell(1,length(size(SOA)));
mean_unimodalsum_boutprob_lt_wt = cell(1,length(size(SOA)));

% Calculate probability of bout after stimulus onset, by deciding if there was a bout per trial
for i = 1:length(SOA)
    clear current_MSI
    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_MSI = eval(current_name_MSI);
    current_MSI_binary = any(current_MSI >= start_interval(i) & current_MSI <= stop_interval(i) ,2);
    mean_MSI_boutprob_lt_wt{i} = mean(reshape(current_MSI_binary,6,[]),1,'omitnan');

    % Get unimodal summation     
    lowtap_wt_binary= any(mat_lowtap_wt >= start_interval_sum(i) & mat_lowtap_wt <= stop_interval_sum(i),2);
    lowtap_wt_binary_ii= any(mat_lowtap_wt >= start_interval(1) & mat_lowtap_wt <= stop_interval(1) ,2);
    mean_lowtap_wt = mean(reshape(lowtap_wt_binary,6,[]),1,'omitnan');
    mean_lowtap_wt_boutprob = mean(reshape(lowtap_wt_binary_ii,6,[]),1,'omitnan');

    flash_wt_binary = any(mat_flash_wt >= start_interval_sum(1) & mat_flash_wt <= stop_interval_sum(1) ,2);
    mean_flash_wt = mean(reshape(flash_wt_binary,6,[]),1,'omitnan');

    current_normalisation = ['diff_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    normalisation = eval(current_normalisation);

    mean_unimodalsum_boutprob_lt_wt{i} = ((mean_lowtap_wt + mean_flash_wt)-(mean_lowtap_wt.*mean_flash_wt)) - normalisation;

end 

offset = 5
x = (SOA * 1000) - offset;

means_MSI_lt_wt = cellfun(@mean, mean_MSI_boutprob_lt_wt);
sem_MSI_lt_wt = cellfun(@(x) std(x)/sqrt(length(x)), mean_MSI_boutprob_lt_wt);
means_unimodalsum_lt_wt = cellfun(@mean, mean_unimodalsum_boutprob_lt_wt);
sem_unimodalsum_lt_wt = cellfun(@(x) std(x)/sqrt(length(x)), mean_unimodalsum_boutprob_lt_wt);

figure('name', 'Bout probability: MSI versus unimodal summation');

subplot(2,2,1)
hold on

errorbar((SOA*1000) - offset, means_MSI_lt_wt, sem_MSI_lt_wt , 'o', 'LineWidth', 1, 'color','m');
errorbar((SOA*1000) + offset, means_unimodalsum_lt_wt, sem_unimodalsum_lt_wt,'o', 'LineWidth', 1, 'color','#FF8800');

xlabel('SOA');
ylabel('p(bout)');
legend('MSI', 'Unimodal summation');
title('MSI vs Unimodal summation: 82 db wt');
xlim([-50 200])
ylim([0 0.15])
hold off


%--------------------87 db wt---------------------------------------------------%

mean_MSI_boutprob_ht_wt = cell(1,length(size(SOA)));
mean_unimodalsum_boutprob_ht_wt = cell(1,length(size(SOA)));

% Calculate probability of bout after stimulus onset, by deciding if there was a bout per trial
for i = 1:length(SOA)
    clear current_MSI
    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_MSI = eval(current_name_MSI);
    current_MSI_binary = any(current_MSI >= start_interval(i) & current_MSI <= stop_interval(i) ,2);
    mean_MSI_boutprob_ht_wt{i} = mean(reshape(current_MSI_binary,6,[]),1,'omitnan');

    % Get unimodal summation by making the tap and flash binary, get both means and sum
    hightap_wt_binary= any(mat_hightap_wt >= start_interval_sum(i) & mat_hightap_wt <= stop_interval_sum(i) ,2);
    hightap_wt_binary_ii= any(mat_hightap_wt >= start_interval(1) & mat_hightap_wt <= stop_interval(1) ,2);
    mean_hightap_wt = mean(reshape(hightap_wt_binary,6,[]),1,'omitnan');
    mean_hightap_wt_boutprob = mean(reshape(hightap_wt_binary_ii,6,[]),1,'omitnan');
    

    flash_wt_binary = any(mat_flash_wt >= start_interval_sum(1) & mat_flash_wt <= stop_interval_sum(1) ,2);
    mean_flash_wt = mean(reshape(flash_wt_binary,6,[]),1,'omitnan');

    current_normalisation = ['diff_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    normalisation = eval(current_normalisation);
    
    mean_unimodalsum_boutprob_ht_wt{i} = ((mean_hightap_wt + mean_flash_wt)-(mean_hightap_wt.*mean_flash_wt)) - normalisation;

end 

offset = 5
x = (SOA * 1000) - offset;

means_MSI_ht_wt = cellfun(@mean, mean_MSI_boutprob_ht_wt);
sem_MSI_ht_wt = cellfun(@(x) std(x)/sqrt(length(x)), mean_MSI_boutprob_ht_wt);
means_unimodalsum_ht_wt = cellfun(@mean, mean_unimodalsum_boutprob_ht_wt);
sem_unimodalsum_ht_wt = cellfun(@(x) std(x)/sqrt(length(x)), mean_unimodalsum_boutprob_ht_wt);

subplot(2,2,2)
hold on

errorbar((SOA*1000) - offset, means_MSI_ht_wt, sem_MSI_ht_wt , 'o', 'LineWidth', 1, 'color','m');
errorbar((SOA*1000) + offset, means_unimodalsum_ht_wt, sem_unimodalsum_ht_wt,'o', 'LineWidth', 1, 'color','#FF8800');

xlabel('SOA');
ylabel('p(bout)');
legend('MSI', 'Unimodal summation');
title('MSI vs Unimodal summation: 87 db wt');
xlim([-50 200])
ylim([0 0.15])
hold off

%------------------------------ 82 db mutant --------------------------------------------%

mean_MSI_boutprob_lt_mut = cell(1,length(size(SOA)));
mean_unimodalsum_boutprob_lt_mut = cell(1,length(size(SOA)));

% Calculate probability of bout after stimulus onset, by deciding if there was a bout per trial
for i = 1:length(SOA)
    clear current_MSI
    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_MSI = eval(current_name_MSI);
    current_MSI_binary = any(current_MSI >= start_interval(i) & current_MSI <= stop_interval(i),2);

    mean_MSI_boutprob_lt_mut{i} = mean(reshape(current_MSI_binary,6,[]),1,'omitnan');

    % Get unimodal summation by making the tap and flash binary, get both means and sum

    lowtap_mut_binary= any(mat_lowtap_mut >= start_interval_sum(i) & mat_lowtap_mut <= stop_interval_sum(i) ,2);
    lowtap_mut_binary_ii= any(mat_lowtap_mut >= start_interval(1) & mat_lowtap_mut <= stop_interval(1) ,2);
    mean_lowtap_mut = mean(reshape(lowtap_mut_binary,6,[]),1,'omitnan');
    mean_lowtap_mut_boutprob = mean(reshape(lowtap_mut_binary_ii,6,[]),1,'omitnan');

    flash_mut_binary = any(mat_flash_mut >= start_interval_sum(1) & mat_flash_mut <= stop_interval_sum(1) ,2);
    mean_flash_mut = mean(reshape(flash_mut_binary,6,[]),1,'omitnan');

    current_normalisation = ['diff_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    normalisation = eval(current_normalisation);

    mean_unimodalsum_boutprob_lt_mut{i} = ((mean_lowtap_mut + mean_flash_mut)-(mean_lowtap_mut.*mean_flash_mut)) - normalisation;
    
end 

means_MSI_lt_mut = cellfun(@mean, mean_MSI_boutprob_lt_mut);
sem_MSI_lt_mut = cellfun(@(x) std(x)/sqrt(length(x)), mean_MSI_boutprob_lt_mut);
means_unimodalsum_lt_mut = cellfun(@mean, mean_unimodalsum_boutprob_lt_mut);
sem_unimodalsum_lt_mut = cellfun(@(x) std(x)/sqrt(length(x)), mean_unimodalsum_boutprob_lt_mut);


subplot(2,2,3)
hold on

errorbar((SOA*1000) - offset, means_MSI_lt_mut, sem_MSI_lt_mut , 'o', 'LineWidth', 1, 'color','m');
errorbar((SOA*1000) + offset, means_unimodalsum_lt_mut, sem_unimodalsum_lt_mut,'o', 'LineWidth', 1, 'color','#FF8800');

xlabel('SOA');
ylabel('p(bout)');
legend('MSI', 'Unimodal summation');
title('MSI vs Unimodal summation: 82 db mutant');
xlim([-50 200])
ylim([0 0.15])
hold off


%%---------------------------------------87 db mutant ----------------------------------------------------

mean_MSI_boutprob_ht_mut = cell(1,length(size(SOA)));
mean_unimodalsum_boutprob_ht_mut = cell(1,length(size(SOA)));

% Calculate probability of bout after stimulus onset, by deciding if there was a bout per trial
for i = 1:length(SOA)
    clear current_MSI
    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_MSI = eval(current_name_MSI);
    current_MSI_binary = any(current_MSI >= start_interval(i) & current_MSI <= stop_interval(i) ,2);
    mean_MSI_boutprob_ht_mut{i} = mean(reshape(current_MSI_binary,6,[]),1,'omitnan');

    % Get unimodal summation by making the tap and flash binary, get both means and sum
    hightap_mut_binary = any(mat_hightap_mut >= start_interval_sum(i) & mat_hightap_mut <= stop_interval_sum(i) ,2);
    hightap_mut_binary_ii = any(mat_hightap_mut >= start_interval(1) & mat_hightap_mut <= stop_interval(1) ,2);
    mean_hightap_mut = mean(reshape(hightap_mut_binary,6,[]),1,'omitnan');
    mean_hightap_mut_boutprob = mean(reshape(hightap_mut_binary_ii,6,[]),1,'omitnan');
    
    flash_mut_binary = any(mat_flash_mut >= start_interval_sum(1) & mat_flash_mut <= stop_interval_sum(1) ,2);
    mean_flash_mut =  mean(reshape(flash_mut_binary,6,[]),1,'omitnan');

    current_normalisation = ['diff_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    normalisation = eval(current_normalisation);

    mean_unimodalsum_boutprob_ht_mut{i} = ((mean_hightap_mut + mean_flash_mut)-(mean_hightap_mut.*mean_flash_mut)) - normalisation;
    
end 

means_MSI_ht_mut = cellfun(@mean, mean_MSI_boutprob_ht_mut);
sem_MSI_ht_mut = cellfun(@(x) std(x)/sqrt(length(x)), mean_MSI_boutprob_ht_mut);
means_unimodalsum_ht_mut = cellfun(@mean, mean_unimodalsum_boutprob_ht_mut);
sem_unimodalsum_ht_mut = cellfun(@(x) std(x)/sqrt(length(x)), mean_unimodalsum_boutprob_ht_mut);

subplot(2,2,4)
hold on

errorbar((SOA*1000) - offset, means_MSI_ht_mut, sem_MSI_ht_mut , 'o', 'LineWidth', 1, 'color','m');
errorbar((SOA*1000) + offset, means_unimodalsum_ht_mut, sem_unimodalsum_ht_mut,'o', 'LineWidth', 1, 'color','#FF8800');

xlabel('SOA');
ylabel('p(bout)');
legend('MSI', 'Unimodal summation');
title('MSI vs Unimodal summation: 87 db mutant');
xlim([-50 200])
ylim([0 0.15])
hold off


%% Statistics bout probability MSI versus unimodal summation
% Difference in p(bout) between MSI and unimodal summation for each SOA
% Determine if there is a significant difference between the means of the two lists of p(bout)

% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

signrank_test_boutprob_lt_wt = zeros(1,length(SOA));
signrank_test_boutprob_lt_mut = zeros(1,length(SOA));
signrank_test_boutprob_ht_wt = zeros(1,length(SOA));
signrank_test_boutprob_ht_mut = zeros(1,length(SOA));

for i = 1: length(SOA)
    signrank_test_boutprob_lt_wt(:,i)= signrank(mean_MSI_boutprob_lt_wt{i}, mean_unimodalsum_boutprob_lt_wt{i})
    signrank_test_boutprob_lt_mut(:,i)= signrank(mean_MSI_boutprob_lt_mut{i}, mean_unimodalsum_boutprob_lt_mut{i})
    signrank_test_boutprob_ht_wt(:,i)= signrank(mean_MSI_boutprob_ht_wt{i}, mean_unimodalsum_boutprob_ht_wt{i})
    signrank_test_boutprob_ht_mut(:,i)= signrank(mean_MSI_boutprob_ht_mut{i}, mean_unimodalsum_boutprob_ht_mut{i})
end


%% MSI Interactive index 

% ii (%) = (CM - SMmax)* 100 /SMmax
% CM = mean response evoked by MSI, SMmax = mean response evoked by tap (highest unimodal response evoking)

ii_boutprob_lt_wt = zeros(1,length(SOA));
ii_boutprob_ht_wt =zeros(1,length(SOA));
ii_boutprob_lt_mut = zeros(1,length(SOA));
ii_boutprob_ht_mut = zeros(1,length(SOA));

ii_boutprob_lt_wt_sem = zeros(1,length(SOA));
ii_boutprob_ht_wt_sem =zeros(1,length(SOA));
ii_boutprob_lt_mut_sem = zeros(1,length(SOA));
ii_boutprob_ht_mut_sem = zeros(1,length(SOA));


for i = 1:length(SOA)   

    % Low tap wt  
    CM_lt_wt = mean(mean_MSI_boutprob_lt_wt{i});
    SMmax_lt_wt = mean(mean_lowtap_wt_boutprob);
    CM_lt_wt_sem =  std(mean_MSI_boutprob_lt_wt{i}, 'omitnan')/sqrt(length(mean_MSI_boutprob_lt_wt{i}));
    SMmax_lt_wt_sem =  std(mean_lowtap_wt_boutprob, 'omitnan')/sqrt(length(mean_lowtap_wt_boutprob));

    ii_boutprob_lt_wt(i) = ((CM_lt_wt-SMmax_lt_wt)*100)./SMmax_lt_wt;
    ii_boutprob_lt_wt_sem(i) = ((CM_lt_wt_sem-SMmax_lt_wt_sem)*100)./SMmax_lt_wt_sem;

    % Low tap mutant
    CM_lt_mut = mean(mean_MSI_boutprob_lt_mut{i});
    SMmax_lt_mut = mean(mean_lowtap_mut_boutprob);
    CM_lt_mut_sem =  std(mean_MSI_boutprob_lt_mut{i}, 'omitnan')/sqrt(length(mean_MSI_boutprob_lt_mut{i}));
    SMmax_lt_mut_sem =  std(mean_lowtap_mut_boutprob, 'omitnan')/sqrt(length(mean_lowtap_mut_boutprob));
   
    ii_boutprob_lt_mut(i) = ((CM_lt_mut-SMmax_lt_mut)*100)./SMmax_lt_mut;
    ii_boutprob_lt_mut_sem(i) = ((CM_lt_mut_sem-SMmax_lt_mut_sem)*100)./SMmax_lt_mut_sem;

    % High tap wt
    CM_ht_wt = mean(mean_MSI_boutprob_ht_wt{i});
    SMmax_ht_wt = mean(mean_hightap_wt_boutprob);    
    CM_ht_wt_sem =  std(mean_MSI_boutprob_ht_wt{i}, 'omitnan')/sqrt(length(mean_MSI_boutprob_ht_wt{i}));
    SMmax_ht_wt_sem =  std(mean_hightap_wt_boutprob, 'omitnan')/sqrt(length(mean_hightap_wt_boutprob));

    ii_boutprob_ht_wt(i) = ((CM_ht_wt-SMmax_ht_wt)*100)./SMmax_ht_wt;
    ii_boutprob_ht_wt_sem(i) = (( CM_ht_wt_sem-SMmax_ht_wt_sem)*100)./SMmax_ht_wt_sem;

    % High tap mutant
    CM_ht_mut = mean(mean_MSI_boutprob_ht_mut{i});
    SMmax_ht_mut = mean(mean_hightap_mut_boutprob);    
    CM_ht_mut_sem =  std(mean_MSI_boutprob_ht_mut{i}, 'omitnan')/sqrt(length(mean_MSI_boutprob_ht_mut{i}));
    SMmax_ht_mut_sem =  std(mean_hightap_mut_boutprob, 'omitnan')/sqrt(length(mean_hightap_mut_boutprob));

    ii_boutprob_ht_mut(i) = ((CM_ht_mut-SMmax_ht_mut)*100)./SMmax_ht_mut;
    ii_boutprob_ht_mut_sem(i) = (( CM_ht_mut_sem-SMmax_ht_mut_sem)*100)./SMmax_ht_mut_sem;

end

%------------ Plot mean interactive index of all conditions----------

figure('Name', 'Multisensory interactive index - bout probability');

offset = 5
x = (SOA * 1000) - offset;  

subplot(2,1,1)


errorbar((SOA*1000) - offset, ii_boutprob_lt_wt, ii_boutprob_lt_wt_sem , 'o', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, ii_boutprob_lt_mut, ii_boutprob_lt_mut_sem,'o', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-60,150])
yline([0], '--k')
title('82 db')
legend('wild-type 82 db', 'mutant 82 db')

subplot(2,1,2)


errorbar((SOA*1000) - offset, ii_boutprob_ht_wt, ii_boutprob_ht_wt_sem,'^', 'LineWidth', 1, 'color','b','MarkerSize',6,'MarkerFaceColor', 'b','LineStyle', ':');
hold on
errorbar((SOA*1000) + offset, ii_boutprob_ht_mut, ii_boutprob_ht_mut_sem,'^', 'LineWidth', 1, 'color','r','MarkerSize',6,'MarkerFaceColor', 'r','LineStyle', ':');

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-60,150])
yline([0], '--k')
title('87 db')
legend('wild-type 87 db', 'mutant 87 db')

%%

% ------------------------Plot violin plots lowtap-----------------------

data_lt = [
    ii_boutprob_lt_wt(:);
    ii_boutprob_lt_mut(:);];

% Number of samples per matrix
n_lt_wt = numel(ii_boutprob_lt_wt);
n_lt_mut = numel(ii_boutprob_lt_mut);


% SOA labels for each matrix (x-axis groups)
soa_order = {'0 SOA','50 SOA','100 SOA','150 SOA'};
soa_lt_wt = repmat( ...
    categorical({'0 SOA','50 SOA','100 SOA','150 SOA'},soa_order), ...
    size(ii_boutprob_lt_wt,1), 1);

soa_lt_mut = repmat( ...
    categorical({'0 SOA','50 SOA','100 SOA','150 SOA'},soa_order), ...
    size(ii_boutprob_lt_mut,1), 1);


% Combine SOA labels
soa_labels_lt = [
    soa_lt_wt(:);
    soa_lt_mut(:);
];

soa_labels_lt = categorical(soa_labels_lt, soa_order, 'Ordinal', true);

% Condition labels (color groups)
cond_labels_lt = [
    repmat(categorical("wild-type 82 db"),  n_lt_wt,1);
    repmat(categorical("mutant 82 db "), n_lt_mut,1);];

figure('Name', 'Violin plots interactive index - bout probability');
hold on

subplot(2,1,1)

ax = gca;  % lock current axes
ax.ColorOrder = [0 0.4470 0.7410; 0.8500 0 0];       
ax.NextPlot = 'replacechildren';

v = violinplot(soa_labels_lt, data_lt, GroupByColor=cond_labels_lt)
;
ylabel('ii (%)')
yline(0, '--k');
title ('Interactive index bout probability 82 db')
ylim([-300 600])
box off
% --- force legend-safe objects inside same axes ---
h1_lt = line(ax, nan, nan, 'LineWidth', 2, ...
    'Color', [0 0.4470 0.7410]);

h2_lt = line(ax, nan, nan, 'LineWidth', 2, ...
    'Color', [ 0.8500 0 0]);

legend(ax, [h1_lt h2_lt], ...
    {'wild-type', 'mutant'}, ...
    'Location', 'best')
set(gca,'LineWidth',1.2,'FontSize',8)

% ------------------------- Plot violin plots 87 db --------------------

data_ht = [
    ii_boutprob_ht_wt(:);
    ii_boutprob_ht_mut(:)];

% Number of samples per matrix

n_ht_wt = numel(ii_boutprob_ht_wt);
n_ht_mut = numel(ii_boutprob_ht_mut);


% SOA labels for each matrix (x-axis groups)

soa_ht_wt = repmat( ...
    categorical({'0 SOA','50 SOA','100 SOA','150 SOA'},soa_order), ...
    size(ii_boutprob_ht_wt,1), 1);

soa_ht_mut = repmat( ...
    categorical({'0 SOA','50 SOA','100 SOA','150 SOA'},soa_order), ...
    size(ii_boutprob_ht_mut,1), 1);

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
title ('Interactive index bout probability 87 db')
h1_ht = line(ax, nan, nan, 'LineWidth', 2, ...
    'Color', [0 0.4470 0.7410]);

h2_ht = line(ax, nan, nan, 'LineWidth', 2, ...
    'Color', [ 0.8500 0 0]);

legend(ax, [h1_ht h2_ht], ...
    {'wild-type', 'mutant'}, ...
    'Location', 'best')
box off

set(gca,'LineWidth',1.2,'FontSize',8)


%% MSI interactive index statistics

% Difference between mutant and wildtype for each SOA (t-test)


ttest_boutprob_lt = zeros(1,length(SOA));
ttest_boutprob_ht = zeros(1,length(SOA));

for i = 1: length(SOA)
    ttest_boutprob_lt(:,i)= ranksum(ii_boutprob_lt_wt(:,i), ii_boutprob_lt_mut(:,i))
    ttest_boutprob_ht(:,i)= ranksum(ii_boutprob_ht_wt(:,i),ii_boutprob_ht_mut(:,i))
end


% Difference between the SOAs for both the wt and mutant (one-way ANOVA)
group_labels = {'0 SOA', '50 SOA', '100 SOA' ,'150 SOA'}

[p_anov_boutprob_lt_wt,tbl_anov_boutprob_lt_wt,stats_anov_boutprob_lt_wt] = anova1(ii_boutprob_lt_wt,group_labels)
[p_anov_boutprob_lt_mut,tbl_anov_boutprob_lt_mut,stats_anov_boutprob_lt_mut] = anova1(ii_boutprob_lt_mut,group_labels)
[p_anov_boutprob_ht_wt,tbl_anov_boutprob_ht_wt,stats_anov_boutprob_ht_wt] = anova1(ii_boutprob_ht_wt,group_labels)
[p_anov_boutprob_ht_mut,tbl_anov_boutprob_ht_mut,stats_anov_boutprob_ht_mut] = anova1(ii_boutprob_ht_mut,group_labels)

% Post-hoc tests for the anova tests that were significant
[c_lt_wt, m_lt_wt] = multcompare(stats_anov_boutprob_lt_wt)

% This gives s ignificant difference between 0 SOA and 50 SOA in ii, which
% makes sense! It also gives a significant difference between 50 and 100
% SOA. 


%% MSI Multisensory (additive) index (MI)

% MI = AV - (A+V)
% VA = multisensory response, V = response to visual stimulus, A = response to auditory stimulus
% MI > 0 = supralinear
% MI < 0 = sublinear


MI_boutprob_lt_wt = zeros(1,length(SOA));
MI_boutprob_ht_wt = zeros(1,length(SOA));
MI_boutprob_lt_mut = zeros(1,length(SOA));
MI_boutprob_ht_mut = zeros(1,length(SOA));

for i = 1:length(SOA)   

    % Low tap wt
    VA_lt_wt = means_MSI_lt_wt(i)
    A_lt_wt = mean(mean_lowtap_wt_boutprob);
    V_lt_wt = mean(mean_flash_wt);
    
    MI_boutprob_lt_wt(i) = VA_lt_wt - (V_lt_wt + A_lt_wt);

    % Low tap mutant

    VA_lt_mut = means_MSI_lt_mut(i)
    A_lt_mut = mean(mean_lowtap_mut_boutprob);
    V_lt_mut = mean(mean_flash_mut);
    
    MI_boutprob_lt_mut(i) = VA_lt_mut - (V_lt_mut + A_lt_mut);

    % High tap wt
   
    VA_ht_wt = means_MSI_ht_wt(i)
    A_ht_wt = mean(mean_hightap_wt_boutprob);
    V_ht_wt = mean(mean_flash_wt);
    
    MI_boutprob_ht_wt(i) = VA_ht_wt - (V_ht_wt + A_ht_wt)
   
    % High tap mutant
    VA_ht_mut = means_MSI_ht_mut(i)
    A_ht_mut = mean(mean_hightap_mut_boutprob);
    V_ht_mut = mean(mean_flash_mut);
    
    MI_boutprob_ht_mut(i) = VA_ht_mut - (V_ht_mut + A_ht_mut)

end

% Plot

x_SOA = [0 50 100 150];   

figure('Name', 'Multisensory index - bout probability')

plot(x_SOA,MI_boutprob_lt_wt,'o','Color','b', 'MarkerFaceColor', 'b')
hold on
plot(x_SOA,MI_boutprob_lt_mut,'o','Color', 'r', 'MarkerFaceColor','r')
plot(x_SOA,MI_boutprob_ht_wt,'^','Color','b','MarkerFaceColor','b')
plot(x_SOA,MI_boutprob_ht_mut,'^','Color', 'r','MarkerFaceColor','r')

xlabel('SOA')
ylabel('MI')
xlim([-50,200])
ylim([-0.5,1.5])
yline([0], '--k')
legend('wild-type 82 db', 'mutant 82 db', 'wild-type 87 db', 'mutant 87 db')

%% Projection plots bout probability 82 db

% figure with 4 plots, one for each SOA --> 2 figures (82 db & 87 db)

figure('Name', 'Projection plot bout probability: 82 db')

% Identity line --> points above the line have higher velocity for multisensory than
% unimodal (shows MSI). Calculate distances of each point to the identity
% line

% 0 SOA
subplot(2,2,1)

scatter(mean_unimodalsum_boutprob_lt_wt{1} - diff_0SOA_wt_lt, mean_MSI_boutprob_lt_wt{1},'b')
hold on
scatter(mean_unimodalsum_boutprob_lt_mut{1} - diff_0SOA_mut_lt, mean_MSI_boutprob_lt_mut{1},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('0 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')


% 50 SOA
subplot(2,2,2)

scatter(mean_unimodalsum_boutprob_lt_wt{2} - diff_50SOA_wt_lt,mean_MSI_boutprob_lt_wt{2},'b')
hold on
scatter(mean_unimodalsum_boutprob_lt_mut{2} - diff_50SOA_mut_lt,mean_MSI_boutprob_lt_mut{2},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('50 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 100 SOA
subplot(2,2,3)

scatter(mean_unimodalsum_boutprob_lt_wt{3} - diff_100SOA_wt_lt,mean_MSI_boutprob_lt_wt{3},'b')
hold on
scatter(mean_unimodalsum_boutprob_lt_mut{3} - diff_100SOA_mut_lt,mean_MSI_boutprob_lt_mut{3},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('100 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 150 SOA
subplot(2,2,4)

scatter(mean_unimodalsum_boutprob_lt_wt{4} - diff_150SOA_wt_lt,mean_MSI_boutprob_lt_wt{4},'b')
hold on
scatter(mean_unimodalsum_boutprob_lt_mut{4} - diff_150SOA_mut_lt,mean_MSI_boutprob_lt_mut{4},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('150 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

%-------------------------------------------------------------------------%
% Compare the distributions of the distances between points and reference
% line between wt and mutants

for i = 1:length(SOA)

    % Coordinates
    current_diff_wt = ['diff_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_wt = eval(current_diff_wt);
    current_diff_mut = ['diff_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_mut = eval(current_diff_mut);

    x_lt_wt = mean_unimodalsum_boutprob_lt_wt{i} - current_wt;
    y_lt_wt = mean_MSI_boutprob_lt_wt{i};

    x_lt_mut = mean_unimodalsum_boutprob_lt_mut{i} - current_mut;
    y_lt_mut = mean_MSI_boutprob_lt_mut{i};
    % Line coefficients: Ax + By + C = 0
    A = -1;
    B = 1;
    C = 0;

    % Perpendicular distance
    distanceLine_bp_lt_wt{i} = (A*x_lt_wt + B*y_lt_wt + C) ./ sqrt(A^2 + B^2);
    distanceLine_bp_lt_mut{i} = (A*x_lt_mut + B*y_lt_mut + C) ./ sqrt(A^2 + B^2);
end

% Curve showing how distances are distributed
figure('Name', 'Distribution distances from line bout probability: 82 db')

subplot(2,2,1)

% Points above the reference line will be positive distances --> MSI

[f_bp_0SOA_lt_wt, xi_bp_0SOA_lt_wt] = ksdensity(distanceLine_bp_lt_wt{1});
[f_bp_0SOA_lt_mut, xi_bp_0SOA_lt_mut] = ksdensity(distanceLine_bp_lt_mut{1});

plot(xi_bp_0SOA_lt_wt,f_bp_0SOA_lt_wt,'b')
hold on
plot( xi_bp_0SOA_lt_mut,f_bp_0SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('0 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off

subplot(2,2,2)

[f_bp_50SOA_lt_wt, xi_bp_50SOA_lt_wt] = ksdensity(distanceLine_bp_lt_wt{2});
[f_bp_50SOA_lt_mut, xi_bp_50SOA_lt_mut] = ksdensity(distanceLine_bp_lt_mut{2});

plot( xi_bp_50SOA_lt_wt,f_bp_50SOA_lt_wt,'b')
hold on
plot( xi_bp_50SOA_lt_mut,f_bp_50SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('50 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off

subplot(2,2,3)

[f_bp_100SOA_lt_wt, xi_bp_100SOA_lt_wt] = ksdensity(distanceLine_bp_lt_wt{3});
[f_bp_100SOA_lt_mut, xi_bp_100SOA_lt_mut] = ksdensity(distanceLine_bp_lt_mut{3});

plot( xi_bp_100SOA_lt_wt,f_bp_100SOA_lt_wt,'b')
hold on
plot( xi_bp_100SOA_lt_mut,f_bp_100SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('100 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off

subplot(2,2,4)

[f_bp_150SOA_lt_wt, xi_bp_150SOA_lt_wt] = ksdensity(distanceLine_bp_lt_wt{4});
[f_bp_150SOA_lt_mut, xi_bp_150SOA_lt_mut] = ksdensity(distanceLine_bp_lt_mut{4});

plot(xi_bp_150SOA_lt_wt,f_bp_150SOA_lt_wt,'b')
hold on 
plot(xi_bp_150SOA_lt_mut,f_bp_150SOA_lt_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('150 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off
%% Projection plots bout probability 87 db

% figure with 4 plots, one for each SOA --> 2 figures (82 db & 87 db)

figure('Name', 'Projection plot bout probability: 87 db')

% Identity line --> points above the line have higher velocity for multisensory than
% unimodal (shows MSI). Calculate distances of each point to the identity
% line

% 0 SOA
subplot(2,2,1)

scatter(mean_unimodalsum_boutprob_ht_wt{1} - diff_0SOA_wt_ht, mean_MSI_boutprob_ht_wt{1},'b')
hold on
scatter(mean_unimodalsum_boutprob_ht_mut{1} - diff_0SOA_mut_ht, mean_MSI_boutprob_ht_mut{1},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('0 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')


% 50 SOA
subplot(2,2,2)

scatter(mean_unimodalsum_boutprob_ht_wt{2} - diff_50SOA_wt_ht,mean_MSI_boutprob_ht_wt{2},'b')
hold on
scatter(mean_unimodalsum_boutprob_ht_mut{2} - diff_50SOA_mut_ht,mean_MSI_boutprob_ht_mut{2},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('50 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 100 SOA
subplot(2,2,3)

scatter(mean_unimodalsum_boutprob_ht_wt{3} - diff_100SOA_wt_ht,mean_MSI_boutprob_ht_wt{3},'b')
hold on
scatter(mean_unimodalsum_boutprob_ht_mut{3} - diff_100SOA_mut_ht,mean_MSI_boutprob_ht_mut{3},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('100 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

% 150 SOA
subplot(2,2,4)

scatter(mean_unimodalsum_boutprob_ht_wt{4} - diff_150SOA_wt_ht,mean_MSI_boutprob_ht_wt{4},'b')
hold on
scatter(mean_unimodalsum_boutprob_ht_mut{4} - diff_150SOA_mut_ht,mean_MSI_boutprob_ht_mut{4},'r')
identityline = xlim;
plot(identityline,identityline,'--k')
xlim([-0.1 1.2])
ylim([-0.1 1.2])
title('150 SOA')
xlabel('Sum (tap + flash)')
ylabel('MSI')
legend('wild-type', 'mutant')

%-------------------------------------------------------------------------%
% Compare the distributions of the distances between points and reference
% line between wt and mutants

for i = 1:length(SOA)

    % Coordinates
    current_diff_wt = ['diff_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_wt = eval(current_diff_wt);
    current_diff_mut = ['diff_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_mut = eval(current_diff_mut);

    x_ht_wt = mean_unimodalsum_boutprob_ht_wt{i} - current_wt;
    y_ht_wt = mean_MSI_boutprob_ht_wt{i};

    x_ht_mut = mean_unimodalsum_boutprob_ht_mut{i} - current_mut;
    y_ht_mut = mean_MSI_boutprob_ht_mut{i};
    % Line coefficients: Ax + By + C = 0
    A = -1;
    B = 1;
    C = 0;

    % Perpendicular distance
    distanceLine_bp_ht_wt{i} = (A*x_ht_wt + B*y_ht_wt + C) ./ sqrt(A^2 + B^2);
    distanceLine_bp_ht_mut{i} = (A*x_ht_mut + B*y_ht_mut + C) ./ sqrt(A^2 + B^2);
end

% Curve showing how distances are distributed
figure('Name', 'Distribution distances from line bout probability: 87 db')

subplot(2,2,1)

% Points above the reference line will be positive distances --> MSI

[f_bp_0SOA_ht_wt, xi_bp_0SOA_ht_wt] = ksdensity(distanceLine_bp_ht_wt{1});
[f_bp_0SOA_ht_mut, xi_bp_0SOA_ht_mut] = ksdensity(distanceLine_bp_ht_mut{1});

plot(xi_bp_0SOA_ht_wt,f_bp_0SOA_ht_wt,'b')
hold on
plot( xi_bp_0SOA_ht_mut,f_bp_0SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('0 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off

subplot(2,2,2)

[f_bp_50SOA_ht_wt, xi_bp_50SOA_ht_wt] = ksdensity(distanceLine_bp_ht_wt{2});
[f_bp_50SOA_ht_mut, xi_bp_50SOA_ht_mut] = ksdensity(distanceLine_bp_ht_mut{2});

plot( xi_bp_50SOA_ht_wt,f_bp_50SOA_ht_wt,'b')
hold on
plot( xi_bp_50SOA_ht_mut,f_bp_50SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('50 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off

subplot(2,2,3)

[f_bp_100SOA_ht_wt, xi_bp_100SOA_ht_wt] = ksdensity(distanceLine_bp_ht_wt{3});
[f_bp_100SOA_ht_mut, xi_bp_100SOA_ht_mut] = ksdensity(distanceLine_bp_ht_mut{3});

plot( xi_bp_100SOA_ht_wt,f_bp_100SOA_ht_wt,'b')
hold on
plot( xi_bp_100SOA_ht_mut,f_bp_100SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('100 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off

subplot(2,2,4)

[f_bp_150SOA_ht_wt, xi_bp_150SOA_ht_wt] = ksdensity(distanceLine_bp_ht_wt{4});
[f_bp_150SOA_ht_mut, xi_bp_150SOA_ht_mut] = ksdensity(distanceLine_bp_ht_mut{4});

plot(xi_bp_150SOA_ht_wt,f_bp_150SOA_ht_wt,'b')
hold on 
plot(xi_bp_150SOA_ht_mut,f_bp_150SOA_ht_mut,'r')
xline(0, '--k'); % Line at y-axis
yline(0, '--k'); % Line at x-axis

legend('wild-type','mutant')
title('150 SOA')
xlabel('Distance from line')
ylabel('Density')
xlim([-0.5 0.5])
ylim([-0.05 3])
box off
%% Statistical tests differences in distribution bout probability

% Calculate statistics for difference in distribution wt vs mutant for all
% SOAs
% Ranksum used because here wt's are compared to mutants, two independent
% groups with different sample sizes. 
% Ranksum is good for independent groups with unequal sample sizes

ranksum_test_boutprob_lt = zeros(1,length(SOA));
ranksum_test_boutprob_ht = zeros(1,length(SOA));


for i = 1: length(SOA)
    ranksum_test_boutprob_lt(:,i)= ranksum(distanceLine_bp_lt_wt{i}, distanceLine_bp_lt_mut{i})
    ranksum_test_boutprob_ht(:,i)= ranksum(distanceLine_bp_ht_wt{i}, distanceLine_bp_ht_mut{i})
end


%% Reaction time (tap versus tap preceded by flash)
% Use matrices with bout start and calculate mean reaction time for each fish
% Reaction time for only tap versus when preceded by a flash


start_interval_rt = zeros(1,length(SOA));
stop_interval_rt = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval_rt(1) = 750 + (frame_rate * SOA(i))
    stop_interval_rt(i) = 825 + (frame_rate * SOA(i)) % 0.3 seconds (when p(bout) becomes close to 0 again for the 150 SOA conditions) * framerate
end

%--------------------------------------- 82 db wild-type ----------------------------------------------------

reactiontime_lt_wt = cell(1,length(size(SOA)));
mean_rt_lt_wt = cell(1,length(size(SOA)));
sem_rt_lt_wt = cell(1,length(size(SOA)));
reactiontime_MSI_lt_wt = cell(1,length(size(SOA)));
mean_rt_MSI_lt_wt = cell(1,length(size(SOA)));
sem_rt_MSI_lt_wt = cell(1,length(size(SOA)));

% Reaction time only tap --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

   % Only tap reaction time

    reactiontime_tap = zeros(1,size(mat_lowtap_wt,1));
    for j = 1:size(mat_lowtap_wt,1);

       idx = find(mat_lowtap_wt(j,:) > start_interval_rt(1) & mat_lowtap_wt(j,:) < stop_interval_rt(1),1);
       if mat_lowtap_wt(j,idx) > 0 
            reactiontime_tap(j) = ((mat_lowtap_wt(j,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_tap(j) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_tap_pfish = mean(reshape(reactiontime_tap,6,[]),1,'omitnan');

    reactiontime_lt_wt{i} = reactiontime_tap_pfish;
    mean_rt_lt_wt{i} = mean(reactiontime_tap_pfish,'omitnan');
    sem_rt_lt_wt{i} = std(reactiontime_tap_pfish,'omitnan')/sqrt(length(reactiontime_tap_pfish));

    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(i),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - (750 + (SOA(i)*250)))/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_lt_wt{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_lt_wt{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_lt_wt{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 

figure('name', 'Reaction time: tap only vs tap preceded by flash');

subplot(2,2,1)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_lt_wt), cell2mat(sem_rt_lt_wt) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_lt_wt), cell2mat(sem_rt_MSI_lt_wt),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Tap only', 'MSI');
title('Tap only vs MSI: 82 db wild-type');
xlim([-50 200])
ylim([0 300])
hold off


%--------------------------------------- 82 db mutant ----------------------------------------------------

reactiontime_lt_mut = cell(1,length(size(SOA)));
mean_rt_lt_mut = cell(1,length(size(SOA)));
sem_rt_lt_mut = cell(1,length(size(SOA)));
reactiontime_MSI_lt_mut = cell(1,length(size(SOA)));
mean_rt_MSI_lt_mut = cell(1,length(size(SOA)));
sem_rt_MSI_lt_mut = cell(1,length(size(SOA)));

% Reaction time only tap --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

   % Only tap reaction time

    reactiontime_tap = zeros(1,size(mat_lowtap_mut,1));
    for j = 1:size(mat_lowtap_mut,1);

       idx = find(mat_lowtap_mut(j,:) > start_interval_rt(1) & mat_lowtap_mut(j,:) < stop_interval_rt(1),1);
       if mat_lowtap_mut(j,idx) > 0 
            reactiontime_tap(j) = ((mat_lowtap_mut(j,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_tap(j) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_tap_pfish = mean(reshape(reactiontime_tap,6,[]),1,'omitnan');

    reactiontime_lt_mut{i} = reactiontime_tap_pfish;
    mean_rt_lt_mut{i} = mean(reactiontime_tap_pfish,'omitnan');
    sem_rt_lt_mut{i} = std(reactiontime_tap_pfish,'omitnan')/sqrt(length(reactiontime_tap_pfish));

    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(i),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - (750 + (SOA(i)*250)))/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_lt_mut{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_lt_mut{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_lt_mut{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 

subplot(2,2,3)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_lt_mut), cell2mat(sem_rt_lt_mut) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_lt_mut), cell2mat(sem_rt_MSI_lt_mut),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Tap only', 'MSI');
title('Tap only vs MSI: 82 db mutant');
xlim([-50 200])
ylim([0 300])
hold off


%--------------------------------------- 87 db wild-type ----------------------------------------------------

reactiontime_ht_wt = cell(1,length(size(SOA)));
mean_rt_ht_wt = cell(1,length(size(SOA)));
sem_rt_ht_wt = cell(1,length(size(SOA)));
reactiontime_MSI_ht_wt = cell(1,length(size(SOA)));
mean_rt_MSI_ht_wt = cell(1,length(size(SOA)));
sem_rt_MSI_ht_wt = cell(1,length(size(SOA)));

% Reaction time only tap --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

   % Only tap reaction time

    reactiontime_tap = zeros(1,size(mat_hightap_wt,1));
    for j = 1:size(mat_hightap_wt,1);

       idx = find(mat_hightap_wt(j,:) > start_interval_rt(1) & mat_hightap_wt(j,:) < stop_interval_rt(1),1);
       if mat_hightap_wt(j,idx) > 0 
            reactiontime_tap(j) = ((mat_hightap_wt(j,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_tap(j) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_tap_pfish = mean(reshape(reactiontime_tap,6,[]),1,'omitnan');

    reactiontime_ht_wt{i} = reactiontime_tap_pfish;
    mean_rt_ht_wt{i} = mean(reactiontime_tap_pfish,'omitnan');
    sem_rt_ht_wt{i} = std(reactiontime_tap_pfish,'omitnan')/sqrt(length(reactiontime_tap_pfish));

    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(i),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - (750 + (SOA(i)*250)))/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_ht_wt{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_ht_wt{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_ht_wt{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 


subplot(2,2,2)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_ht_wt), cell2mat(sem_rt_ht_wt) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_ht_wt), cell2mat(sem_rt_MSI_ht_wt),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Tap only', 'MSI');
title('Tap only vs MSI: 87 db wild-type');
xlim([-50 200])
ylim([0 300])
hold off

%--------------------------------------- 87 db mutant ----------------------------------------------------

reactiontime_ht_mut = cell(1,length(size(SOA)));
mean_rt_ht_mut = cell(1,length(size(SOA)));
sem_rt_ht_mut = cell(1,length(size(SOA)));
reactiontime_MSI_ht_mut = cell(1,length(size(SOA)));
mean_rt_MSI_ht_mut = cell(1,length(size(SOA)));
sem_rt_MSI_ht_mut = cell(1,length(size(SOA)));

% Reaction time only tap --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

   % Only tap reaction time

    reactiontime_tap = zeros(1,size(mat_hightap_mut,1));
    for j = 1:size(mat_hightap_mut,1);

       idx = find(mat_hightap_mut(j,:) > start_interval_rt(1) & mat_hightap_mut(j,:) < stop_interval_rt(1),1);
       if mat_hightap_mut(j,idx) > 0 
            reactiontime_tap(j) = ((mat_hightap_mut(j,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_tap(j) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_tap_pfish = mean(reshape(reactiontime_tap,6,[]),1,'omitnan');

    reactiontime_ht_mut{i} = reactiontime_tap_pfish;
    mean_rt_ht_mut{i} = mean(reactiontime_tap_pfish,'omitnan');
    sem_rt_ht_mut{i} = std(reactiontime_tap_pfish,'omitnan')/sqrt(length(reactiontime_tap_pfish));

    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(i),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - (750 + (SOA(i)*250)))/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_ht_mut{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_ht_mut{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_ht_mut{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 

subplot(2,2,4)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_ht_mut), cell2mat(sem_rt_ht_mut) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_ht_mut), cell2mat(sem_rt_MSI_ht_mut),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Tap only', 'MSI');
title('MSI vs Unimodal summation: 87 db mutant');
xlim([-50 200])
ylim([0 300])
hold off


%% Reaction time only flash versus flash with tap)
% Use matrices with bout start and calculate mean reaction time for each fish
% Reaction time for only tap versus when preceded by a flash


start_interval_rt = zeros(1,length(SOA));
stop_interval_rt = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval_rt(1) = 750 + (frame_rate * SOA(i))
    stop_interval_rt(i) = 825 + (frame_rate * SOA(i)) % 0.3 seconds (when p(bout) becomes close to 0 again for the 150 SOA conditions) * framerate
end

%--------------------------------------- 82 db wild-type ----------------------------------------------------

reactiontime_flash_wt = cell(1,length(size(SOA)));
mean_rt_flash_wt = cell(1,length(size(SOA)));
sem_rt_flash_wt = cell(1,length(size(SOA)));
reactiontime_MSI_lt_wt = cell(1,length(size(SOA)));
mean_rt_MSI_lt_wt = cell(1,length(size(SOA)));
sem_rt_MSI_lt_wt = cell(1,length(size(SOA)));

% Reaction time flash --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

   % Only flash reaction time

    reactiontime_flash = zeros(1,size(mat_flash_wt,1));
    for j = 1:size(mat_flash_wt,1);

       idx = find(mat_flash_wt(j,:) > start_interval_rt(1) & mat_flash_wt(j,:) < stop_interval_rt(1),1);
       if mat_flash_wt(j,idx) > 0 
            reactiontime_flash(j) = ((mat_flash_wt(j,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_flash(j) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_flash_pfish = mean(reshape(reactiontime_flash,6,[]),1,'omitnan');

    reactiontime_flash_wt{i} = reactiontime_flash_pfish;
    mean_rt_flash_wt{i} = mean(reactiontime_flash_pfish,'omitnan');
    sem_rt_flash_wt{i} = std(reactiontime_flash_pfish,'omitnan')/sqrt(length(reactiontime_flash_pfish));

    % Reaction time MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_lt'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(1),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - 750)/250)*1000; % reactiontime from onset flash in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_lt_wt{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_lt_wt{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_lt_wt{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 

figure('name', 'Reaction time: flash only vs flash with tap');

subplot(2,2,1)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_flash_wt), cell2mat(sem_rt_flash_wt) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_lt_wt), cell2mat(sem_rt_MSI_lt_wt),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Flash only', 'MSI');
title('Flash only vs MSI: 82 db wild-type');
xlim([-50 200])
ylim([0 300])
hold off


%--------------------------------------- 82 db mutant ----------------------------------------------------

reactiontime_flash_mut = cell(1,length(size(SOA)));
mean_rt_flash_mut = cell(1,length(size(SOA)));
sem_rt_flash_mut = cell(1,length(size(SOA)));
reactiontime_MSI_lt_mut = cell(1,length(size(SOA)));
mean_rt_MSI_lt_mut = cell(1,length(size(SOA)));
sem_rt_MSI_lt_mut = cell(1,length(size(SOA)));

% Reaction time only flash --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

   % Only flash reaction time

    reactiontime_flash = zeros(1,size(mat_flash_mut,1));
    for j = 1:size(mat_flash_mut,1);

       idx = find(mat_flash_mut(j,:) > start_interval_rt(1) & mat_flash_mut(j,:) < stop_interval_rt(1),1);
       if mat_flash_mut(j,idx) > 0 
            reactiontime_flash(j) = ((mat_flash_mut(j,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_flash(j) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_flash_pfish = mean(reshape(reactiontime_flash,6,[]),1,'omitnan');

    reactiontime_flash_mut{i} = reactiontime_flash_pfish;
    mean_rt_flash_mut{i} = mean(reactiontime_flash_pfish,'omitnan');
    sem_rt_flash_mut{i} = std(reactiontime_flash_pfish,'omitnan')/sqrt(length(reactiontime_flash_pfish));

    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_lt'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(1),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_lt_mut{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_lt_mut{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_lt_mut{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 

subplot(2,2,3)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_flash_mut), cell2mat(sem_rt_flash_mut) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_lt_mut), cell2mat(sem_rt_MSI_lt_mut),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Flash only', 'MSI');
title('Flash only vs MSI: 82 db mutant');
xlim([-50 200])
ylim([0 300])
hold off


%--------------------------------------- 87 db wild-type ----------------------------------------------------

reactiontime_MSI_ht_wt = cell(1,length(size(SOA)));
mean_rt_MSI_ht_wt = cell(1,length(size(SOA)));
sem_rt_MSI_ht_wt = cell(1,length(size(SOA)));

% Reaction time only tap --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)


    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_wt_ht'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(1),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_ht_wt{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_ht_wt{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_ht_wt{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 


subplot(2,2,2)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_flash_wt), cell2mat(sem_rt_flash_wt) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_ht_wt), cell2mat(sem_rt_MSI_ht_wt),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Flash only', 'MSI');
title('Flash only vs MSI: 87 db wild-type');
xlim([-50 200])
ylim([0 300])
hold off

%--------------------------------------- 87 db mutant ----------------------------------------------------

reactiontime_MSI_ht_mut = cell(1,length(size(SOA)));
mean_rt_MSI_ht_mut = cell(1,length(size(SOA)));
sem_rt_MSI_ht_mut = cell(1,length(size(SOA)));

% Reaction time only tap --> Calculate reaction time per fish and then mean 
for i = 1:length(SOA)

    % Reaction time when preceded by flash --> MSI

    current_name_MSI = ['mat_' num2str(SOA(i)*1000) 'SOA_mut_ht'];
    current_MSI = eval(current_name_MSI);
   
    reactiontime_MSI = zeros(1,size(current_MSI,1));
    for k = 1:size(current_MSI,1);

       idx = find(current_MSI(k,:) > start_interval_rt(1) & current_MSI(k,:) < stop_interval_rt(i),1);
       if current_MSI(k,idx) > 0 ;
            reactiontime_MSI(k) = ((current_MSI(k,idx) - 750)/250)*1000; % reactiontime in ms
       else
            reactiontime_MSI(k) = NaN; % reactiontime in ms
       end     
    end    
    
    reactiontime_MSI_pfish = mean(reshape(reactiontime_MSI,6,[]),1,'omitnan');
    
    reactiontime_MSI_ht_mut{i} = reactiontime_MSI_pfish;
    mean_rt_MSI_ht_mut{i} = mean(reactiontime_MSI_pfish,'omitnan');
    sem_rt_MSI_ht_mut{i} = std(reactiontime_MSI_pfish,'omitnan')/sqrt(length(reactiontime_MSI_pfish));

end 

subplot(2,2,4)
hold on

errorbar((SOA*1000) - offset, cell2mat(mean_rt_flash_mut), cell2mat(sem_rt_flash_mut) , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, cell2mat(mean_rt_MSI_ht_mut), cell2mat(sem_rt_MSI_ht_mut),'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('Reaction time (ms)');
legend('Flash only', 'MSI');
title('Flash only vs MSI: 87 db mutant');
xlim([-50 200])
ylim([0 300])
hold off


%% Statistics Reaction time: MSI versus unimodal summation
% Difference in reaction time between MSI and only tap
% Determine if there is a significant difference between the means of the two lists of reaction time
% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

signrank_test_rt_lt_wt = zeros(1,length(SOA));
signrank_test_rt_lt_mut = zeros(1,length(SOA));
signrank_test_rt_ht_wt = zeros(1,length(SOA));
signrank_test_rt_ht_mut = zeros(1,length(SOA));

for i = 1:length(SOA)
    signrank_test_rt_lt_wt(:,i)= signrank(reactiontime_MSI_lt_wt{i}, reactiontime_lt_wt{i})
    signrank_test_rt_lt_mut(:,i)= signrank(reactiontime_MSI_lt_mut{i}, reactiontime_lt_mut{i})
    signrank_test_rt_ht_wt(:,i)= signrank(reactiontime_MSI_ht_wt{i}, reactiontime_ht_wt{i})
    signrank_test_rt_ht_mut(:,i)= signrank(reactiontime_MSI_ht_mut{i}, reactiontime_ht_mut{i})
end



