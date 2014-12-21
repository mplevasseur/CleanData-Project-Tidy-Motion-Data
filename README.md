CleanData-Project-Tidy-Motion-Data
==================================

Script and support to produce a tidy dataset from wearable computing data. Coursera Cleaning Data class project

Technical information

## BEFORE RUNNING SCRIPT 
	* You need the 'UCI HAR Dataset' in your working directory
	* You also need the 'plyr' and 'dplyr' packages installed from R 

* You may download original data from:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* UNZIP FILE, place folder 'UCI HAR Dataset' into your chosen working directory
* Required that you have installed 'plyr' and 'dplyr' packages in R (this script calls library functions, in correct order)
* THEN, Source this script, 'run_analysis.R' 

## OUTPUT
This script returns a table called "TidyHAR_tbl" which you can view in R
It also writes a .txt file to your working directory called "TidyHAR_tbl.txt"

## TO VIEW OUTPUT AS TIDY DATA 
	Even tidy data does not often appear neat in a a standard text editor, run this code in R:
	
	data <- read.table("TidyHAR_tbl.txt" header = TRUE)
	View(data)
			--code courtesy David Hood, 'David's Project FAQ' on the Discussion Forum for the Course
			https://class.coursera.org/getdata-016/forum/thread?thread_id=50

			
