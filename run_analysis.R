## This script creates a tidy dataset from Human Activity Recognition data

## BEFORE RUNNING SCRIPT, Download original data from:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## UNZIP FILE, place folder 'UCI HAR Dataset' into your chosen working directory
## Required: install 'plyr' and 'dplyr' packages in R (script calls library functions in correct order)
## THEN, Source this script, 'run_analysis.R' 

## Script Execution
## Step 01. Reads data from download. Note 'Inertial Signals' folder not used	 	
	
	## Reading X sets containing measurement data, one observation per row 
	
	trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
	testX <- read.table("UCI HAR Dataset/test/X_test.txt")
	
	## Reading Y sets containing numeric activity indicators for each observation (row)	

	trainY <- read.table("UCI HAR Dataset/train/y_train.txt")
	testY <- read.table("UCI HAR Dataset/test/y_test.txt")

	## Reading subject files identifying which of 30 volunteers performed each observation (row) 
	## Train and test sets are defined by having different volunteers. 

	trainvolunteer <- read.table("UCI HAR Dataset/train/subject_train.txt")
	testvolunteer <- read.table("UCI HAR Dataset/test/subject_test.txt")

	## Reading 561 descriptive column names for the 'feature vectors' (X data) 
	## Features are the 561 variables in columns for both trainX and testX
	## Some are measured, some computed

	featureid <- read.table("UCI HAR Dataset/features.txt") 		
	
	## Reading activity labels, provide 6 descriptive names for each of 6 activity id#

	activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")	


## Step 02. Merge training and test [feature vector] observations into one data set

## DESIRED STRUCTURE OF MERGED DATA SET 
	## Volunteer	Activity		561 Feature Columns...
	## (train&test)	(train&test)	(train&test) 
	## rows from train and test files stacked

	## Bind rows of train, test files for each of these 3 columns 
	volunteer <- rbind(trainvolunteer, testvolunteer)	#train, test order		
	activityid <- rbind(trainY, testY)			 	#same order
	measurements <- rbind(trainX, testX)		 	#same order
	

# All rows are assembled. 'measurements' data frame has 561 feature columns
## Only columns with mean and std are needed. Will select out  before binding columns


## Step 03. Descriptive labels for column names, will aid selecting columns
	
	## Column 2 of 'featureid' df ('V2') has the names, 'factor' type, 477 levels 
	## 477 levels < 561 columns, therefore duplicate names exist
	## 'make.names' coerces the type to character, and
	## setting 'unique' parameter = TRUE gives all columns unique name
	
	feature_names <- make.names(featureid$V2, unique = TRUE) 		
	names(measurements) <-  c(feature_names)

## Step 04. Select only columns representing mean and standard deviation of measurements

	## Using 'grep' to create a vector containing columns of interest 
	## Vector will identify columns by number that contain a pattern
	## match to the character string "mean" or "std"
	## Default is grep(pattern, x, ignore.case = FALSE) 
	## Setting parameter 'ignore.case = TRUE' to catch all

	selectedcols <- grep("mean|std", names(measurements), ignore.case = TRUE)
	subsetdf <- measurements[,selectedcols]

	## 'subsetdf' has 86 columns and all observational rows
	## Bind the three identifer columns to this subset observation dataframe
	## Result is a df with 88 columns ready to join with activity labels

 	names(volunteer) <-  c("Volunteer")
	names(activityid) <- c("Activity")
	prepjoindf <- cbind(volunteer, activityid, subsetdf)


## Step 05. Merge/Join to generate column of descriptive Activity factor labels

	## 'Join' (from 'plyr' package) generates 'activity_labels' column off of
	## common index column with same name in both data frames.
	## Assigned to new df called 'WideSubdf' - a subset of all columns in wide form

	## 'Join' preserves the order of data (unlike 'merge'),
	## but requires a column name that is the same in both data frames
	## So naming the columns of activity_label to create the join column
	## and also the name of the column that will be added

	library(plyr)
	names(activity_labels) <- c("Activity" , "Activity_Label")	# naming columns of label df
											# 'Activity' is now join column
	WideSubdf <- join(activity_labels, prepjoindf, by="Activity", type = "inner") 
	
	## Parementer 'inner' ensures label created only for matches in both df, so 
	## no extra rows (corrupting observations) created if errors in activity indicators	
	## 'WideSubdf' is the intermediate, descriptive, selected data set, 89 columns


## Step 05. Create a second, independent tidy data set with the "average of each
## variable for each activity and each subject"
	
	## Interpretation: for each Volunteer, all 86 features will be averaged
	## by activity (each Volunteer has several rows for each of 6 activities)
	## 30 subjects x 6 activities = 180 rows in the final tidy dataset

	## Using 'aggregate' to specify columns to average and 2 group variables
	## all in one line. Does require reattaching column names to group variables
	
	Summarydf <- aggregate(WideSubdf[,4:89],by=list(WideSubdf$Volunteer, WideSubdf$Activity_Label), mean)
	colnames(Summarydf)[1:2] <- c("Volunteer" , "Activity_Label")
	
	## Using 'dplyr' to arrange data by Volunteer (a natural key) and return dataset with flexible class
	## And mostly just to practice using it since it was taught in class

	library(dplyr)
	Summary_tbl <- tbl_df(Summarydf)
	TidyHAR_tbl <- arrange(Summary_tbl, Volunteer)
	write.table(TidyHAR_tbl, file="TidyHAR_tbl.txt", row.names=FALSE)
	return(TidyHAR_tbl)


