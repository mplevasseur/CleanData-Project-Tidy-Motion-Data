CleanData-Project-Tidy-Motion-Data
==================================

Script and supporting files to produce a tidy dataset from wearable computing data. 
Coursera "Cleaning Data" class project

Technical information

# BEFORE RUNNING SCRIPT 
* You need the 'UCI HAR Dataset' folder in your working directory
* You also need the 'plyr' and 'dplyr' packages installed from R 

You may download original data from:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* UNZIP FILE, place folder 'UCI HAR Dataset' into your chosen working directory
* You must have installed 'plyr' and 'dplyr' packages in R, but the script calls the library functions in correct order
* THEN, Source this script, 'run_analysis.R' (you may or may not actually be asked to do this for grading)

# OUTPUT CHOICES

* The script returns a table called "TidyHAR_tbl" which you can view in R
* The script also writes a .txt file to your working directory called "TidyHAR_tbl.txt"

# TO VIEW OUTPUT AS TIDY DATA - SIMPLE READ AND VIEW COMMANDS

As we learned on the discussion forum, even tidy data does not often appear neat when opened in a a standard text editor.
To view the tidy data set in a clean table format with borders, run this code in R after running the script (from our TA):
	
		data <- read.table("TidyHAR_tbl.txt" header = TRUE)
		View(data)
	
			* code courtesy David Hood, 'David's Project FAQ' on the Discussion Forum for the Course
			https://class.coursera.org/getdata-016/forum/thread?thread_id=50

# INCLUDED CONTENTS: README, SCRIPT, CODEBOOK		
Here is a guide to "what-is-where" for each of the project files.
They are generally created in Notepad++ and pushed to GitHub using GitBash.

* README.md	
	* A brief overview of the files that are included
	* Technical information to assist in making the files work

* SCRIPT
	* The script is a .R file for sourcing and executing in R
	* Includes extensive commenting on the coding thought process and choices
	* Outlined and indented to help understand flow of program relative to the assignment
	
* CODEBOOK.md: 
	* An explanation of my general approach to this project's data cleanup
	* Specific steps taken to clean up the data and why.
	* Resulting structure of the data
	
	--> Given the project does not actually include analysis, that we have no particular insight to its collection, 
	and that the instructions are vague, I assume that multiple valid interpretations are possible for learning purposes, but
	it is therefore very important to explain the steps taken (less important the exact form of the result, as long as it is "tidy")
	
	--> I enjoyed this challenging assignment, and hope it was a good learning experience for all. As you might have guessed,
	I like bullets and am also testing out the resulting rendering effects in GitHub.



















