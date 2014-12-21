###Codebook for ‘run_analysis.R’ and its output dataset
This codebook is a guide to the approach to creating a tidy data set from the ‘UCI HAR Dataset’ 
found in the following GitHub Repository:
https://github.com/mplevasseur/CleanData-Project-Tidy-Motion-Data.git

This codebook is provided to understand the scenario, variables, output and approach, but not the code. 
For specifics on the code methods to accomplish the tidy dataset, the script is provided in the repo and 
is heavily commented on method and choices to accomplish the data processing steps.

###Author:  
Matt LeVasseur, student of Johns Hopkins Coursera Course “Getting and Cleaning Data”

###Source of Data. 
The original data comes from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Citation:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###Purpose: 
The purpose of this class project is to develop the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for (undetermined) later analysis.

General specifications for output:
1.	Just ONE script to do all processing
2.	Data will be in tidy form
a.	Each row representing an observation
b.	Each column representing a separate variable
c.	Each kind of observation in a separate table 
3.	Tidy dataset will only include certain selected variables from raw data “measurements on the mean and standard deviation for each measurement”
4.	Dataset will further process data by returning only the means of each “activity” for each “subject”.

###Approach to Generating Output

SINGLE DATASET. Solutions with multiple tables are possible, but the data together may also be considered as one “kind” of data
formed with variables all pertaining to calculated quantities of individual observations by requested factors. 
This is the approach taken; the user (assignment) has requested a summary by the factors Subject and Activity, making this summary table one “kind” 
of data. Referencing the assignment (albeit not conclusive): “merges the training and the test sets to create one data set”

CONSERVATISM of the data processing vs. needs of the Analyst. When there is room for interpretation, (e.g., specification #3 above) 
the approach is “conservative” taking the LARGEST number of variables that could POSSIBLY meet the meaning of the guidance given.

In reality, these uncertainties would be reasons to clarify with the user and align with the analysis plan. 
In the absence of any possible clarification, it seems prudent to assume that the user will understand the collected data and not use
certain variables ultimately unnecessary. This is considered preferable to not having important data that was assumed to be unimportant
by the data processing analyst--a bigger risk.
*Any and all variables that included the term “mean” or “std” without regard to case was included, not just the function mean() and std().
*There is room for interpretation, but without clarifying what is important to the user, a larger number of variables are included.

NEATNESS / ERRORS IN THE RAW DATA / DESCRIPTIVE COLUMN NAMING. 
Other than the requirement for data that are “tidy’ (i.e., prepared for analyses), ideas for “neatness” are nearly infinite
and taken to be optional, especially since its actual use and resources of those doing the analysis are undetermined. 

This is another aspect of conservativism.
*For example, column names in the raw data are duplicated and/or manifest other errors. 
It is assumed that these data are potentially important to the user even if the labeling scheme is corrupt, and the variables are preserved as “unique”.
*No further renaming of columns is attempted other than that which is provided in the raw data. This presumes understanding characteristics of the 
data that may or may not agree with the user’s purposes or preferences.
*No conventions of naming columns are presumed necessary, as they are not prescribed in the specifications
For example, the script includes the “.” as a word separator in column names. This is neither specified as good or bad for this assignment, 
although in some applications it may be undesirable.

LONG FORM USED. The assignment indicates wide or long form is acceptable. 
This dataset leaves all variable columns as presented, with subjects repeated over a number of rows, and single instances across columns. 

###Observations 

Observations are in rows but partitioned randomly by volunteer into two files, and. This necessitates reassembly (by rows) into a full dataset for analysis.
*	Total: 10,299 observations in the raw data
*	70% originally in “training” files
*	30% originally in “test” files

Once reassembled, rows are further summarized by factor variables, i.e., taking the mean of selected variables by activity, for each volunteer. 
*	30 volunteers x 6 activities = 180 rows (observations) in the final dataset.

###Factor Variables (complete variable list appears at end):

30 Subjects (“Volunteers”). 30 volunteer subjects 
The script identifies them as “Volunteers” for clarity, to distinguish between topics of interest

The raw data has a subject files separated from the data collection, identifying the Volunteer for each observation:
*	“subject_train.txt”
*	“subject_test.txt”
These must be reassembled together by row and processed (as a column) for the final tidy version.

6 Activities. Volunteers engage in 6 different activities:

1.	WALKING
2.	WALKING_UPSTAIRS
3.	WALKING_DOWNSTAIRS
4.	SITTING
5.	STANDING
6.	LAYING\

Volunteers engage in these activities while “wearing a smartphone (Samsung Galaxy S II) on the waist…” 
to generate motion data information. (Anguita, et.al.)

The raw data includes separate files denoting the activity codes for each observation:
*	“y_test.txt”
*	“y_train.txt”
The raw data also includes another file “decoding” the activity identifier with descriptive labels:
*	“activity_labels.txt”

###Quantitative Variables

Quantitative (continuous) variables are named in the raw data as a 561-feature vector, with time and frequency domain variables. 
The features include acceleration signal components and other variables estimated from the signals, 
including mean and standard deviations.

The 561-feature vectors are originally provided in these files:
*	“X_train.txt”
*	“X_test.txt”

“Descriptive Labels” appear in a separate file:
*	“features.txt”
	
Conservatism drove the selection of ALL variables containing  the strings "mean" or "std" in ANY case (lower or upper). 
*	This left 86 of the 561 variables selected for summarizing
*	The final dataset has 88 column, the 86 quantitative variables plus the 2 factor variables.
	
###Not used	
*	'Inertial Signals' folder from raw data not used	 
*	“features_info.txt” file not used, except for information	

###STRUCTURE FINAL DATA SET 
### Volunteer		Activity		86 Feature Columns...
### (train&test)	(train&test)	(train&test) observations
### summarized by means for each volunteer, each activity

###Complete Variable List
"Volunteer"       also known as subjects or volunteer subjects                
"Activity_Label"  Sitting, Walking, etc. of 6 activities                    

Used these 86 variables from the 561-feature vector.
Collected or computed motion data, including the strings “mean” or “std” as it is understood the user wants all variables with mean or standard deviation information. Both capital and lower case captured.
1.	"tBodyAcc.mean...X"                    
2.	"tBodyAcc.mean...Y"                   
3.	"tBodyAcc.mean...Z"
4.	"tBodyAcc.std...X"                    
5.	"tBodyAcc.std...Y"
6.	"tBodyAcc.std...Z"                    
7.	"tGravityAcc.mean...X"                 
8.	"tGravityAcc.mean...Y"                
9.	"tGravityAcc.mean...Z"
10.	"tGravityAcc.std...X"
11.	"tGravityAcc.std...Y"
12.	"tGravityAcc.std...Z"                 
13.	"tBodyAccJerk.mean...X"
14.	"tBodyAccJerk.mean...Y"               
15.	"tBodyAccJerk.mean...Z"
16.	"tBodyAccJerk.std...X"                
17.	"tBodyAccJerk.std...Y"
18.	"tBodyAccJerk.std...Z"                
19.	"tBodyGyro.mean...X"
20.	"tBodyGyro.mean...Y"
21.	"tBodyGyro.mean...Z"                   
22.	"tBodyGyro.std...X"                   
23.	"tBodyGyro.std...Y"                    
24.	"tBodyGyro.std...Z"                   
25.	"tBodyGyroJerk.mean...X"               
26.	"tBodyGyroJerk.mean...Y"              
27.	"tBodyGyroJerk.mean...Z"               
28.	"tBodyGyroJerk.std...X"               
29.	"tBodyGyroJerk.std...Y"                
30.	"tBodyGyroJerk.std...Z"               
31.	"tBodyAccMag.mean.."                   
32.	"tBodyAccMag.std.."                   
33.	"tGravityAccMag.mean.."                
34.	"tGravityAccMag.std.."                
35.	"tBodyAccJerkMag.mean.."               
36.	"tBodyAccJerkMag.std.."               
37.	"tBodyGyroMag.mean.."                  
38.	"tBodyGyroMag.std.."                  
39.	"tBodyGyroJerkMag.mean.."              
40.	"tBodyGyroJerkMag.std.."              
41.	"fBodyAcc.mean...X"                    
42.	"fBodyAcc.mean...Y"                   
43.	"fBodyAcc.mean...Z"                    
44.	"fBodyAcc.std...X"                    
45.	"fBodyAcc.std...Y"                     
46.	"fBodyAcc.std...Z"                    
47.	"fBodyAcc.meanFreq...X"                
48.	"fBodyAcc.meanFreq...Y"               
49.	"fBodyAcc.meanFreq...Z"                
50.	"fBodyAccJerk.mean...X"               
51.	"fBodyAccJerk.mean...Y"                
52.	"fBodyAccJerk.mean...Z"               
53.	"fBodyAccJerk.std...X"                 
54.	"fBodyAccJerk.std...Y"                
55.	"fBodyAccJerk.std...Z"                 
56.	"fBodyAccJerk.meanFreq...X"           
57.	"fBodyAccJerk.meanFreq...Y"            
58.	"fBodyAccJerk.meanFreq...Z"           
59.	"fBodyGyro.mean...X"                   
60.	"fBodyGyro.mean...Y"                  
61.	"fBodyGyro.mean...Z"                   
62.	"fBodyGyro.std...X"                   
63.	"fBodyGyro.std...Y"                    
64.	"fBodyGyro.std...Z"                   
65.	"fBodyGyro.meanFreq...X"               
66.	"fBodyGyro.meanFreq...Y"              
67.	"fBodyGyro.meanFreq...Z"               
68.	"fBodyAccMag.mean.."                  
69.	"fBodyAccMag.std.."                    
70.	"fBodyAccMag.meanFreq.."              
71.	"fBodyBodyAccJerkMag.mean.."           
72.	"fBodyBodyAccJerkMag.std.."           
73.	"fBodyBodyAccJerkMag.meanFreq.."       
74.	"fBodyBodyGyroMag.mean.."             
75.	"fBodyBodyGyroMag.std.."               
76.	"fBodyBodyGyroMag.meanFreq.."         
77.	"fBodyBodyGyroJerkMag.mean.."          
78.	"fBodyBodyGyroJerkMag.std.."          
79.	"fBodyBodyGyroJerkMag.meanFreq.."      
80.	"angle.tBodyAccMean.gravity."         
81.	"angle.tBodyAccJerkMean..gravityMean."
82.	"angle.tBodyGyroMean.gravityMean."    
83.	"angle.tBodyGyroJerkMean.gravityMean." 
84.	"angle.X.gravityMean."                
85.	"angle.Y.gravityMean."                 
86.	"angle.Z.gravityMean."                
