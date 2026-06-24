
%% Script to analyse MSI SOA data - Bout duration


clearvars
close all
clc

%% Get data and divide trials by condition

run('D:\Emma_Conrad\grab_data_MSI.m')


%% Find bout start & bout end for each condition

% Only bouts after stimulus onset, within an interval

selected_bouttypes = [11 12 13] % Use  active escape bouts

SOA = [0 0.05 0.1 0.15];

start_interval = zeros(1,length(SOA));
stop_interval = zeros(1,length(SOA));

for i = 1:length(SOA)
    start_interval(i) = 750 + (frame_rate * SOA(i));
    stop_interval(i) = 825 + (frame_rate * SOA(i)); % 0.3 seconds (when p(bout) becomes close to 0 again for the 150 SOA conditions) * framerate
end


% Make the bout type selection correct here too!!!
          

% Bout duration end of 82 db only tap conditions

for batchID = 1:length(trials_lowtap);
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
           

                boutstarts_lowtap{batchID}{wellID_lowtap}{trialID} = vid_data{batchID}{wellID_lowtap}{trialID_lowtap}(69,idx);
                boutends_lowtap{batchID}{wellID_lowtap}{trialID} = vid_data{batchID}{wellID_lowtap}{trialID_lowtap}(70,idx);

                valid_idx{batchID}{wellID_lowtap}{trialID} = boutstarts_lowtap{batchID}{wellID_lowtap}{trialID} >= start_interval(1)...
                    & boutstarts_lowtap{batchID}{wellID_lowtap}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_lowtap}{trialID} = boutstarts_lowtap{batchID}{wellID_lowtap}{trialID}(valid_idx{batchID}{wellID_lowtap}{trialID});
                boutends_interval{batchID}{wellID_lowtap}{trialID} = boutends_lowtap{batchID}{wellID_lowtap}{trialID}(valid_idx{batchID}{wellID_lowtap}{trialID});
   
                boutduration_lowtap{batchID}{wellID_lowtap}{trialID} = boutends_interval{batchID}{wellID_lowtap}{trialID}...
                    - boutstarts_interval{batchID}{wellID_lowtap}{trialID} ;

                if isempty(boutduration_lowtap{batchID}{wellID_lowtap}{trialID})
                    boutduration_lowtap{batchID}{wellID_lowtap}{trialID} = NaN;
                end  
            
            else
                boutduration_lowtap{batchID}{wellID_lowtap}{trialID} = NaN;
            
            end    
        end
    end        
end


% Bout duration of 87 db only tap conditions


for batchID = 1:length(trials_hightap);
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
           
                boutstarts_hightap{batchID}{wellID_hightap}{trialID} = vid_data{batchID}{wellID_hightap}{trialID_hightap}(69,idx);
                boutends_hightap{batchID}{wellID_hightap}{trialID} = vid_data{batchID}{wellID_hightap}{trialID_hightap}(70,idx);

                valid_idx{batchID}{wellID_hightap}{trialID} = boutstarts_hightap{batchID}{wellID_hightap}{trialID} >= start_interval(1)...
                    & boutstarts_hightap{batchID}{wellID_hightap}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_hightap}{trialID} = boutstarts_hightap{batchID}{wellID_hightap}{trialID}(valid_idx{batchID}{wellID_hightap}{trialID});
                boutends_interval{batchID}{wellID_hightap}{trialID} = boutends_hightap{batchID}{wellID_hightap}{trialID}(valid_idx{batchID}{wellID_hightap}{trialID});
   
                boutduration_hightap{batchID}{wellID_hightap}{trialID} = boutends_interval{batchID}{wellID_hightap}{trialID}...
                    - boutstarts_interval{batchID}{wellID_hightap}{trialID} ;

                if isempty(boutduration_hightap{batchID}{wellID_hightap}{trialID})
                    boutduration_hightap{batchID}{wellID_hightap}{trialID} = NaN;
                end  
            
            else

                boutduration_hightap{batchID}{wellID_hightap}{trialID} = NaN;
            
   
            end
        end
    end        
end


% Bout duration of flash conditions


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

                boutstarts_flash{batchID}{wellID_flash}{trialID} = vid_data{batchID}{wellID_flash}{trialID_flash}(69,idx);
                boutends_flash{batchID}{wellID_flash}{trialID} = vid_data{batchID}{wellID_flash}{trialID_flash}(70,idx);

                valid_idx{batchID}{wellID_flash}{trialID} = boutstarts_flash{batchID}{wellID_flash}{trialID} >= start_interval(1)...
                    & boutstarts_flash{batchID}{wellID_flash}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_flash}{trialID} = boutstarts_flash{batchID}{wellID_flash}{trialID}(valid_idx{batchID}{wellID_flash}{trialID});
                boutends_interval{batchID}{wellID_flash}{trialID} = boutends_flash{batchID}{wellID_flash}{trialID}(valid_idx{batchID}{wellID_flash}{trialID});
   
                boutduration_flash{batchID}{wellID_flash}{trialID} = boutends_interval{batchID}{wellID_flash}{trialID}...
                    - boutstarts_interval{batchID}{wellID_flash}{trialID};

                if isempty(boutduration_flash{batchID}{wellID_flash}{trialID})
                   boutduration_flash{batchID}{wellID_flash}{trialID} = NaN;
                end   

            else
                boutduration_flash{batchID}{wellID_flash}{trialID} = NaN;
            end    
        end
    end        
end

% Bout duration of MSI 0 SOA conditions - 82 db


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

                boutstarts_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = vid_data{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt}(69,idx);
                boutends_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = vid_data{batchID}{wellID_0SOA_lt}{trialID_0SOA_lt}(70,idx);

                valid_idx{batchID}{wellID_0SOA_lt}{trialID} = boutstarts_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} >= start_interval(1)...
                    & boutstarts_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_0SOA_lt}{trialID} = boutstarts_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID}(valid_idx{batchID}{wellID_0SOA_lt}{trialID});
                boutends_interval{batchID}{wellID_0SOA_lt}{trialID} = boutends_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID}(valid_idx{batchID}{wellID_0SOA_lt}{trialID});
   
                boutduration_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = boutends_interval{batchID}{wellID_0SOA_lt}{trialID}...
                    - boutstarts_interval{batchID}{wellID_0SOA_lt}{trialID} ;  

                if isempty(boutduration_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID})
                   boutduration_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = NaN;
                end  

            else
                boutduration_0SOA_lt{batchID}{wellID_0SOA_lt}{trialID} = NaN;
           
            end    
        end
    end        
end

% Bout duration of MSI 50 SOA conditions - 82 db

boutstart_50SOA_lt = cell(1,length(trials_50SOA_lt));
boutend_50SOA_lt = cell(1,length(trials_50SOA_lt));

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

            boutstarts_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = vid_data{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt}(69,idx);
            boutends_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = vid_data{batchID}{wellID_50SOA_lt}{trialID_50SOA_lt}(70,idx);

            valid_idx{batchID}{wellID_50SOA_lt}{trialID} = boutstarts_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} >= start_interval(1)...
                & boutstarts_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} <= stop_interval(1);
            boutstarts_interval{batchID}{wellID_50SOA_lt}{trialID} = boutstarts_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID}(valid_idx{batchID}{wellID_50SOA_lt}{trialID});
            boutends_interval{batchID}{wellID_50SOA_lt}{trialID} = boutends_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID}(valid_idx{batchID}{wellID_50SOA_lt}{trialID});
   
            boutduration_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = boutends_interval{batchID}{wellID_50SOA_lt}{trialID}...
                - boutstarts_interval{batchID}{wellID_50SOA_lt}{trialID} ;   

             if isempty(boutduration_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID})
                boutduration_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = NaN;
             end  
            
            else
                boutduration_50SOA_lt{batchID}{wellID_50SOA_lt}{trialID} = NaN;

            end
        end
    end        
end

% Bout duration of MSI 100 SOA conditions - 82 db

boutstart_100SOA_lt = cell(1,length(trials_100SOA_lt));
boutend_100SOA_lt = cell(1,length(trials_100SOA_lt));


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

                boutstarts_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = vid_data{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt}(69,idx);
                boutends_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = vid_data{batchID}{wellID_100SOA_lt}{trialID_100SOA_lt}(70,idx);

                valid_idx{batchID}{wellID_100SOA_lt}{trialID} = boutstarts_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} >= start_interval(1)...
                    & boutstarts_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_100SOA_lt}{trialID} = boutstarts_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID}(valid_idx{batchID}{wellID_100SOA_lt}{trialID});
                boutends_interval{batchID}{wellID_100SOA_lt}{trialID} = boutends_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID}(valid_idx{batchID}{wellID_100SOA_lt}{trialID});
   
                boutduration_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = boutends_interval{batchID}{wellID_100SOA_lt}{trialID}...
                    - boutstarts_interval{batchID}{wellID_100SOA_lt}{trialID} ; 

                if isempty(boutduration_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID})
                    boutduration_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = NaN;
                end  

            else
                boutduration_100SOA_lt{batchID}{wellID_100SOA_lt}{trialID} = NaN;
            end

        end
    end        
end

% Bout duration of MSI 150 SOA conditions - 82 db

boutstart_150SOA_lt = cell(1,length(trials_150SOA_lt));
boutend_150SOA_lt = cell(1,length(trials_150SOA_lt));

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

                boutstarts_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = vid_data{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt}(69,idx);
                boutends_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = vid_data{batchID}{wellID_150SOA_lt}{trialID_150SOA_lt}(70,idx);

                valid_idx{batchID}{wellID_150SOA_lt}{trialID} = boutstarts_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} >= start_interval(1)...
                    & boutstarts_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_150SOA_lt}{trialID} = boutstarts_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID}(valid_idx{batchID}{wellID_150SOA_lt}{trialID});
                boutends_interval{batchID}{wellID_150SOA_lt}{trialID} = boutends_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID}(valid_idx{batchID}{wellID_150SOA_lt}{trialID});
   
                boutduration_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = boutends_interval{batchID}{wellID_150SOA_lt}{trialID}...
                    - boutstarts_interval{batchID}{wellID_150SOA_lt}{trialID} ; 

                if isempty(boutduration_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID})
                    boutduration_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = NaN;
                end  

            else
                boutduration_150SOA_lt{batchID}{wellID_150SOA_lt}{trialID} = NaN;

            end
        end
    end        
end



% Bout duration of MSI 0 SOA conditions - 87 db
boutstart_0SOA_ht = cell(1,length(trials_0SOA_ht));
boutend_0SOA_ht = cell(1,length(trials_0SOA_ht));

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

                boutstarts_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = vid_data{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht}(69,idx);
                boutends_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = vid_data{batchID}{wellID_0SOA_ht}{trialID_0SOA_ht}(70,idx);

                valid_idx{batchID}{wellID_0SOA_ht}{trialID} = boutstarts_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} >= start_interval(1)...
                    & boutstarts_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_0SOA_ht}{trialID} = boutstarts_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID}(valid_idx{batchID}{wellID_0SOA_ht}{trialID});
                boutends_interval{batchID}{wellID_0SOA_ht}{trialID} = boutends_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID}(valid_idx{batchID}{wellID_0SOA_ht}{trialID});
   
                boutduration_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = boutends_interval{batchID}{wellID_0SOA_ht}{trialID}...
                    - boutstarts_interval{batchID}{wellID_0SOA_ht}{trialID} ;

                if isempty(boutduration_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID})
                    boutduration_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = NaN;
                end  

            else
                boutduration_0SOA_ht{batchID}{wellID_0SOA_ht}{trialID} = NaN;
            end
        end
    end        
end

% Bout duration of MSI 50 SOA conditions - 87 db

boutstart_50SOA_ht = cell(1,length(trials_50SOA_ht));
boutend_50SOA_ht = cell(1,length(trials_50SOA_ht));

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

                boutstarts_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = vid_data{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht}(69,idx);
                boutends_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = vid_data{batchID}{wellID_50SOA_ht}{trialID_50SOA_ht}(70,idx);

                valid_idx{batchID}{wellID_50SOA_ht}{trialID} = boutstarts_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} >= start_interval(1)...
                    & boutstarts_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_50SOA_ht}{trialID} = boutstarts_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID}(valid_idx{batchID}{wellID_50SOA_ht}{trialID});
                boutends_interval{batchID}{wellID_50SOA_ht}{trialID} = boutends_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID}(valid_idx{batchID}{wellID_50SOA_ht}{trialID});
   
                boutduration_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = boutends_interval{batchID}{wellID_50SOA_ht}{trialID}...
                    - boutstarts_interval{batchID}{wellID_50SOA_ht}{trialID} ;

                if isempty(boutduration_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID})
                    boutduration_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = NaN;
                end  

            else
                boutduration_50SOA_ht{batchID}{wellID_50SOA_ht}{trialID} = NaN;
            end
        end
    end        
end


% Bout duration of MSI 100 SOA conditions - 87 db

boutstart_100SOA_ht = cell(1,length(trials_100SOA_ht));
boutend_100SOA_ht = cell(1,length(trials_100SOA_ht));


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

                boutstarts_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = vid_data{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht}(69,idx);
                boutends_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = vid_data{batchID}{wellID_100SOA_ht}{trialID_100SOA_ht}(70,idx);

                valid_idx{batchID}{wellID_100SOA_ht}{trialID} = boutstarts_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} >= start_interval(1)...
                    & boutstarts_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_100SOA_ht}{trialID} = boutstarts_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID}(valid_idx{batchID}{wellID_100SOA_ht}{trialID});
                boutends_interval{batchID}{wellID_100SOA_ht}{trialID} = boutends_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID}(valid_idx{batchID}{wellID_100SOA_ht}{trialID});
   
                boutduration_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = boutends_interval{batchID}{wellID_100SOA_ht}{trialID}...
                    - boutstarts_interval{batchID}{wellID_100SOA_ht}{trialID} ;           
             
                if isempty(boutduration_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID})
                    boutduration_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = NaN;
                end  

            else
                boutduration_100SOA_ht{batchID}{wellID_100SOA_ht}{trialID} = NaN;
            end
        end
    end        
end

% Bout duration of MSI 150 SOA conditions - 87 db

boutstart_150SOA_ht = cell(1,length(trials_150SOA_ht));
boutend_150SOA_ht = cell(1,length(trials_150SOA_ht));

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

                boutstarts_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = vid_data{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht}(69,idx);
                boutends_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = vid_data{batchID}{wellID_150SOA_ht}{trialID_150SOA_ht}(70,idx);

                valid_idx{batchID}{wellID_150SOA_ht}{trialID} = boutstarts_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} >= start_interval(1)...
                    & boutstarts_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} <= stop_interval(1);
                boutstarts_interval{batchID}{wellID_150SOA_ht}{trialID} = boutstarts_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID}(valid_idx{batchID}{wellID_150SOA_ht}{trialID});
                boutends_interval{batchID}{wellID_150SOA_ht}{trialID} = boutends_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID}(valid_idx{batchID}{wellID_150SOA_ht}{trialID});
   
                boutduration_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = boutends_interval{batchID}{wellID_150SOA_ht}{trialID}...
                    - boutstarts_interval{batchID}{wellID_150SOA_ht}{trialID} ;      

                if isempty(boutduration_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID})
                    boutduration_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = NaN;
                end    

            else
                boutduration_150SOA_ht{batchID}{wellID_150SOA_ht}{trialID} = NaN;
            end             
        end
    end        
end

%% Divide duration of trials per genotype


% Bout start of trials per genotype for unimodal, 0 SOA, 50 SOA, 100 SOA, and 150 SOA

genotypes = {'wt','het','mut'};

boutduration_lowtap_genotyped = cell(length(genotypes),1);
boutduration_hightap_genotyped = cell(length(genotypes),1);
boutduration_flash_genotyped = cell(length(genotypes),1);
boutduration_0SOA_lt_genotyped = cell(length(genotypes),1);
boutduration_50SOA_lt_genotyped = cell(length(genotypes),1);
boutduration_100SOA_lt_genotyped = cell(length(genotypes),1);
boutduration_150SOA_lt_genotyped = cell(length(genotypes),1);
boutduration_0SOA_ht_genotyped = cell(length(genotypes),1);
boutduration_50SOA_ht_genotyped = cell(length(genotypes),1);
boutduration_100SOA_ht_genotyped = cell(length(genotypes),1);
boutduration_150SOA_ht_genotyped = cell(length(genotypes),1);


run('D:\Emma_Conrad\genotype.m')

for batchID = 1:length(gene)

    for geneID = 1:length(genotypes)
        clear gene_well
        gene_well = (find(ismember(gene{batchID},genotypes{geneID})));

        for wellID = 1:length(gene_well)

            for trial = 1:6

                 boutduration_lowtap_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_lowtap{batchID}{gene_well(wellID)}{trial};
                 boutduration_hightap_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_hightap{batchID}{gene_well(wellID)}{trial};
                 boutduration_flash_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_flash{batchID}{gene_well(wellID)}{trial};
                 boutduration_0SOA_lt_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_0SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutduration_50SOA_lt_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_50SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutduration_100SOA_lt_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_100SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutduration_150SOA_lt_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_150SOA_lt{batchID}{gene_well(wellID)}{trial};
                 boutduration_0SOA_ht_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_0SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutduration_50SOA_ht_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_50SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutduration_100SOA_ht_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_100SOA_ht{batchID}{gene_well(wellID)}{trial};
                 boutduration_150SOA_ht_genotyped{geneID}{batchID}{wellID}{trial} = boutduration_150SOA_ht{batchID}{gene_well(wellID)}{trial};

               
            end
        end
    end   
end

%% Transpose

for geneID = 1:length(boutduration_lowtap_genotyped)

    boutduration_lowtap_genotyped{geneID} = boutduration_lowtap_genotyped{geneID}.';
    boutduration_hightap_genotyped{geneID} = boutduration_hightap_genotyped{geneID}.';
    boutduration_flash_genotyped{geneID} = boutduration_flash_genotyped{geneID}.';
    boutduration_0SOA_lt_genotyped{geneID} =  boutduration_0SOA_lt_genotyped{geneID}.';
    boutduration_50SOA_lt_genotyped{geneID} =  boutduration_50SOA_lt_genotyped{geneID}.';
    boutduration_100SOA_lt_genotyped{geneID} =  boutduration_100SOA_lt_genotyped{geneID}.';
    boutduration_150SOA_lt_genotyped{geneID} = boutduration_150SOA_lt_genotyped{geneID}.';
    boutduration_0SOA_ht_genotyped{geneID} =  boutduration_0SOA_ht_genotyped{geneID}.';
    boutduration_50SOA_ht_genotyped{geneID} = boutduration_50SOA_ht_genotyped{geneID}.';
    boutduration_100SOA_ht_genotyped{geneID} =  boutduration_100SOA_ht_genotyped{geneID}.';
    boutduration_150SOA_ht_genotyped{geneID} = boutduration_150SOA_ht_genotyped{geneID}.';



    for batchID = 1:length(boutduration_lowtap_genotyped{geneID})

        data.boutduration_lowtap_genotyped{geneID}{batchID} = boutduration_lowtap_genotyped{geneID}{batchID}.';
        data.boutduration_hightap_genotyped{geneID}{batchID} = boutduration_hightap_genotyped{geneID}{batchID}.';
        data.boutduration_flash_genotyped{geneID}{batchID} = boutduration_flash_genotyped{geneID}{batchID}.';
        data.boutduration_0SOA_lt_genotyped{geneID}{batchID} =  boutduration_0SOA_lt_genotyped{geneID}{batchID}.';
        data.boutduration_50SOA_lt_genotyped{geneID}{batchID} =  boutduration_50SOA_lt_genotyped{geneID}{batchID}.';
        data.boutduration_100SOA_lt_genotyped{geneID}{batchID} =  boutduration_100SOA_lt_genotyped{geneID}{batchID}.';
        data.boutduration_150SOA_lt_genotyped{geneID}{batchID} = boutduration_150SOA_lt_genotyped{geneID}{batchID}.';
        data.boutduration_0SOA_ht_genotyped{geneID}{batchID} =  boutduration_0SOA_ht_genotyped{geneID}{batchID}.';
        data.boutduration_50SOA_ht_genotyped{geneID}{batchID} = boutduration_50SOA_ht_genotyped{geneID}{batchID}.';
        data.boutduration_100SOA_ht_genotyped{geneID}{batchID} =  boutduration_100SOA_ht_genotyped{geneID}{batchID}.';
        data.boutduration_150SOA_ht_genotyped{geneID}{batchID} = boutduration_150SOA_ht_genotyped{geneID}{batchID}.';


    end
end

%% Calculate mean and sem bout duration per condition

% Mean bout probability per fish for each SOA

% --------------------- 82 db wild-type conditions ------------------------

avg_duration_MSI_lt_wt = cell(1,length(SOA));
avg_duration_lowtap_wt = cell(1,length(SOA));

avg_duration_MSI_ht_wt = cell(1,length(SOA));
avg_duration_hightap_wt = cell(1,length(SOA));

avg_duration_MSI_lt_mut = cell(1,length(SOA));
avg_duration_lowtap_mut = cell(1,length(SOA));

avg_duration_MSI_ht_mut = cell(1,length(SOA));
avg_duration_hightap_mut = cell(1,length(SOA));

for i = 1:length(SOA)

    current_name_MSI_lt = sprintf('boutduration_%dSOA_lt_genotyped', SOA(i)*1000);
    current_MSI_lt = data.(current_name_MSI_lt);

    current_name_MSI_ht = sprintf('boutduration_%dSOA_ht_genotyped', SOA(i)*1000);
    current_MSI_ht = data.(current_name_MSI_ht);
   

    for batchID = 1:num_sessions
        for fish_lt_wt = 1:length(current_MSI_lt{1}{batchID})
           
        avg_duration_MSI_lt_wt{i}{batchID}(fish_lt_wt) = mean(cell2mat(current_MSI_lt{1}{batchID}{fish_lt_wt}), 'omitnan');  % Mean bout duration per fish
        avg_duration_lowtap_wt{i}{batchID}(fish_lt_wt) = mean(cell2mat(data.boutduration_lowtap_genotyped{1}{batchID}{fish_lt_wt}), 'omitnan');

        end

        for fish_ht_wt = 1:length(current_MSI_ht{1}{batchID});
           
        avg_duration_MSI_ht_wt{i}{batchID}(fish_ht_wt) = mean(cell2mat(current_MSI_ht{1}{batchID}{fish_ht_wt}), 'omitnan');  % Mean bout duration per fish
        avg_duration_hightap_wt{i}{batchID}(fish_ht_wt) = mean(cell2mat(data.boutduration_hightap_genotyped{1}{batchID}{fish_ht_wt}), 'omitnan');

        end

        for fish_lt_mut = 1:length(current_MSI_lt{3}{batchID});
           
        avg_duration_MSI_lt_mut{i}{batchID}(fish_lt_mut) = mean(cell2mat(current_MSI_lt{3}{batchID}{fish_lt_mut}), 'omitnan');  % Mean bout duration per fish
        avg_duration_lowtap_mut{i}{batchID}(fish_lt_mut) = mean(cell2mat(data.boutduration_lowtap_genotyped{3}{batchID}{fish_lt_mut}), 'omitnan');

        end

        for fish_ht_mut = 1:length(current_MSI_ht{3}{batchID});
           
        avg_duration_MSI_ht_mut{i}{batchID}(fish_ht_mut) = mean(cell2mat(current_MSI_ht{3}{batchID}{fish_ht_mut}), 'omitnan');  % Mean bout duration per fish
        avg_duration_hightap_mut{i}{batchID}(fish_ht_mut) = mean(cell2mat(data.boutduration_hightap_genotyped{3}{batchID}{fish_ht_mut}), 'omitnan');

        end

    end

    avg_duration_MSI_lt_wt{i} = (cell2mat(avg_duration_MSI_lt_wt{i})/250)*1000 ;
    avg_duration_lowtap_wt{i} = (cell2mat(avg_duration_lowtap_wt{i})/250)*1000 ;
    avg_duration_MSI_ht_wt{i} = (cell2mat(avg_duration_MSI_ht_wt{i})/250)*1000 ;
    avg_duration_hightap_wt{i} = (cell2mat(avg_duration_hightap_wt{i})/250)*1000 ;
    avg_duration_MSI_lt_mut{i} = (cell2mat(avg_duration_MSI_lt_mut{i})/250)*1000 ;
    avg_duration_lowtap_mut{i} = (cell2mat(avg_duration_lowtap_mut{i})/250)*1000 ;
    avg_duration_MSI_ht_mut{i} = (cell2mat(avg_duration_MSI_ht_mut{i})/250)*1000 ;
    avg_duration_hightap_mut{i} = (cell2mat(avg_duration_hightap_mut{i})/250)*1000 ;

end    

%% Create graphs bout duration

% Mean per 6 trials and then per condition (variantion between fish, not trials)
% Plot means and sem for MSI and unimodal summation in a plot for all SOAs

% --------------------- 82 db wt -------------------------------------

offset = 5
x = (SOA * 1000) - offset;

mean_duration_MSI_lt_wt = cellfun(@(x) mean(x,'omitnan'), avg_duration_MSI_lt_wt);
sem_duration_MSI_lt_wt = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_MSI_lt_wt);
mean_duration_lowtap_wt = cellfun(@(x) mean(x,'omitnan'), avg_duration_lowtap_wt);
sem_duration_lowtap_wt = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_lowtap_wt);

figure('name', 'Bout duration tap vs tap preceded by a flash');

subplot(2,2,1)
hold on

errorbar((SOA*1000) - offset, mean_duration_lowtap_wt, sem_duration_lowtap_wt , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, mean_duration_MSI_lt_wt,sem_duration_MSI_lt_wt,'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('bout duration (ms)');
legend('Tap', 'MSI');
title('Tap vs MSI: 82 db wt');
xlim([-50 200])
ylim([0 300])
hold off

% --------------------- 87 db wt -------------------------------------

offset = 5
x = (SOA * 1000) - offset;

mean_duration_MSI_ht_wt = cellfun(@(x) mean(x,'omitnan'), avg_duration_MSI_ht_wt);
sem_duration_MSI_ht_wt = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_MSI_ht_wt);
mean_duration_hightap_wt = cellfun(@(x) mean(x,'omitnan'), avg_duration_hightap_wt);
sem_duration_hightap_wt = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_hightap_wt);

subplot(2,2,2)
hold on

errorbar((SOA*1000) - offset, mean_duration_hightap_wt, sem_duration_hightap_wt , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, mean_duration_MSI_ht_wt,sem_duration_MSI_ht_wt,'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('bout duration (ms)');
legend('Tap', 'MSI');
title('Tap vs MSI: 87 db wt');
xlim([-50 200])
ylim([0 300])
hold off

% --------------------- 82 db mutant -------------------------------------

offset = 5
x = (SOA * 1000) - offset;

mean_duration_MSI_lt_mut = cellfun(@(x) mean(x,'omitnan'), avg_duration_MSI_lt_mut);
sem_duration_MSI_lt_mut = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_MSI_lt_mut);
mean_duration_lowtap_mut = cellfun(@(x) mean(x,'omitnan'), avg_duration_lowtap_mut);
sem_duration_lowtap_mut = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_lowtap_mut);

subplot(2,2,3)
hold on

errorbar((SOA*1000) - offset, mean_duration_lowtap_mut, sem_duration_lowtap_mut , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, mean_duration_MSI_lt_mut,sem_duration_MSI_lt_mut,'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('bout duration (ms)');
legend('Tap', 'MSI');
title('Tap vs MSI: 82 db mutant');
xlim([-50 200])
ylim([0 300])
hold off

% --------------------- 87 db mutant -------------------------------------

offset = 5
x = (SOA * 1000) - offset;

mean_duration_MSI_ht_mut = cellfun(@(x) mean(x,'omitnan'), avg_duration_MSI_ht_mut);
sem_duration_MSI_ht_mut = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_MSI_ht_mut);
mean_duration_hightap_mut = cellfun(@(x) mean(x,'omitnan'), avg_duration_hightap_mut);
sem_duration_hightap_mut = cellfun(@(x) std(x,[],'omitnan')/sqrt(length(x)), avg_duration_hightap_mut);

subplot(2,2,4)
hold on

errorbar((SOA*1000) - offset, mean_duration_hightap_mut, sem_duration_hightap_mut , 'o', 'LineWidth', 1, 'color','b');
errorbar((SOA*1000) + offset, mean_duration_MSI_ht_mut,sem_duration_MSI_ht_mut,'o', 'LineWidth', 1, 'color','m');

xlabel('SOA');
ylabel('bout duration (ms)');
legend('Tap', 'MSI');
title('Tap vs MSI: 87 db mutant');
xlim([-50 200])
ylim([0 300])
hold off

%% Statistics bout duration MSI versus only tap
% Difference in bout duration between MSI and only tap for each SOA
% Determine if there is a significant difference between the means of the two lists of p(bout)

% Test data for normal distribution --> it is not normally distributed and also not equal variance --> use non-parametric test --> Wilcoxon signed-rank test

signrank_test_boutdur_lt_wt = zeros(1,length(SOA));
signrank_test_boutdur_lt_mut = zeros(1,length(SOA));
signrank_test_boutdur_ht_wt = zeros(1,length(SOA));
signrank_test_boutdur_ht_mut = zeros(1,length(SOA));

for i = 1: length(SOA)
    signrank_test_boutdur_lt_wt(:,i)= signrank(avg_duration_MSI_lt_wt{i}, avg_duration_lowtap_wt{i})
    signrank_test_boutdur_lt_mut(:,i)= signrank(avg_duration_MSI_lt_mut{i}, avg_duration_lowtap_mut{i})
    signrank_test_boutdur_ht_wt(:,i)= signrank(avg_duration_MSI_ht_wt{i}, avg_duration_hightap_wt{i})
    signrank_test_boutdur_ht_mut(:,i)= signrank(avg_duration_MSI_ht_mut{i}, avg_duration_hightap_mut{i})
end


%% MSI Interactive index 

% ii (%) = (CM - SMmax)* 100 /SMmax
% CM = mean response evoked by MSI, SMmax = mean response evoked by tap (highest unimodal response evoking)

ii_boutdur_lt_wt = zeros(1,length(SOA));
ii_boutdur_ht_wt = zeros(1,length(SOA));
ii_boutdur_lt_mut = zeros(1,length(SOA));
ii_boutdur_ht_mut = zeros(1,length(SOA));


for i = 1:length(SOA)   

    % Low tap wt  
    CM_lt_wt = mean_duration_MSI_lt_wt(i)
    SMmax_lt_wt = mean_duration_lowtap_wt(i);
    
    ii_boutdur_lt_wt(i) = ((CM_lt_wt-SMmax_lt_wt)*100)/SMmax_lt_wt

    % Low tap mutant
    CM_lt_mut = mean_duration_MSI_lt_mut(i)
    SMmax_lt_mut = mean_duration_lowtap_mut(i);
   
    ii_boutdur_lt_mut(i) = ((CM_lt_mut-SMmax_lt_mut)*100)/SMmax_lt_mut

    % High tap wt
    CM_ht_wt = mean_duration_MSI_ht_wt(i)
    SMmax_ht_wt = mean_duration_hightap_wt(i);    

    ii_boutdur_ht_wt(i) = ((CM_ht_wt-SMmax_ht_wt)*100)/SMmax_ht_wt
   
    % High tap mutant
    CM_ht_mut = mean_duration_MSI_ht_mut(i);
    SMmax_ht_mut = mean_duration_hightap_mut(i);    

    ii_boutdur_ht_mut(i) = ((CM_ht_mut-SMmax_ht_mut)*100)/SMmax_ht_mut;

end

% Plot

x_SOA = [0 50 100 150];   

figure('Name', 'Multisensory interactive index - bout duration')

plot(x_SOA,ii_boutdur_lt_wt,'o','Color','b', 'MarkerFaceColor', 'b')
hold on
plot(x_SOA,ii_boutdur_lt_mut,'o','Color', 'r', 'MarkerFaceColor','r')
plot(x_SOA,ii_boutdur_ht_wt,'^','Color','b','MarkerFaceColor','b')
plot(x_SOA,ii_boutdur_ht_mut,'^','Color', 'r','MarkerFaceColor','r')

xlabel('SOA')
ylabel('interactive index (%)')
xlim([-50,200])
ylim([-10,100])
yline([0], '--k')
legend('wild-type 82 db', 'mutant 82 db', 'wild-type 87 db', 'mutant 87 db')