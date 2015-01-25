# Code Book for Coursera Project for class titled "Getting and Cleaning Data"

## Variable Description

The script "run_analysis.R" is run against several text files that are listed and described in detail below.

	* **features.txt**
		+ long column
		+ 561 records 
		+ unique measurement name
		+ meant to associate as column headers for **X_test** and **y_test**
    * **activity_labels.txt**
		+ this file matches an integer in the **y_test** and **y_train** with an activity name
		+ 1 WALKING
		+ 2 WALKING_UPSTAIRS
		+ 3 WALKING_DOWNSTAIRS
		+ 4 SITTING
		+ 5 STANDING
		+ 6 LAYING
    * **X_test.txt**
		+ separated by spaces, very regular, 
		+ 2947 rows (observations)
		+ 561 columns (measurements)
		+ no header
    * **Y_test.txt**
		+ long column
		+ 2947 records
		+ values 1-6, Integer
		+ Integer correlates to an activity for observations in **X_test**, walking, standing, etc.
    * **subject_test.txt**
		+ long column
		+ 2947 records
		+ values 2-24 (subset of 1:30 not in **subject_test.txt**)
		+ Integer - people
		+ correlates to observations in **X_test**
    * **X_train.txt**
		+ separated by spaces, very regular, 
		+ 7352 rows (observations)
		+ 561 columns (measurements)
		+ no header
    * **y_train.txt**
		+ long column
		+ 7352 records
		+ values 1-6, Integer
		+ Integer correlates to an activity for observations in **X_train**, walking, standing, etc.
    * **subject_test.txt**
		+ long column
		+ 7352 records
		+ values 1-30 (subset of 1:30 not in **subject_train.txt**)
		+ Integer - people
		+ correlates to observations in **X_train**
		
## Program specific
	*  Please reference the comments in the code of **run_analysis.R** for details on operations
	*  A file is written to the working directory (from **run_analysis.R**) called **tidy_data_set**
		+ It is a summary of the larger data set
		+ Summarized by person, as an average per measurement, implemented using the ddply function
		+ The measurements observed are only those related to mean or standard deviation, only 66 of the total 561