These MATLAB (R2025b) scripts were used to analyse the data of MSI behavioural experiments. 
The input data for the scripts were the output of an analysis done beforehand with DeepLabCut and Megabouts 
through an automated pipeline. 

Each script was used for the analysis of another parameter. The scripts had the following purposes:

genotype.m: Contains the genotype of each larva for all experiments

grab_data_MSI.m: Script that loads and reads the megabouts data and connects that data to the belonging meta data files of the experiments.
The script also divides trials per experimental condition and assigns which bout types were excecuted in each trial. 

MSI_analysis_velocity.m: This script uses the velocity of the larvae to analyse MSI. Input data is the velocity over time of each trial.

MSI_analysis_boutprob_reactiontime.m: This script uses bout probability of the larvae to analyse MSI. Additionally, reaction time is calculated. Input data is the time of bout starts for each trial.

MSI_analysis_bout-duration.m: This script analyses bout duration to look into bout kinematics in response to MSI. Input data is the time of bout starts and bout ends for each trial.

MSI_analysis_distancetravelled.m: Identical to the analysis of velocity, this script analyses distance travelled over time. The input data was distance travelled over time for each trial. To look more into bout kinematics, distance travelled per bout can be analysed with this script. The input data is the time of bout starts and ends as well as distance travelled over time. 
