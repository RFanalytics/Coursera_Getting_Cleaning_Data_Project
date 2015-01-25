
#  Coursera Project for class titled "Getting and Cleaning Data"

## The objective is to write R code that will input the various measurements recorded from a Samsung Galaxy 5 phone's accelerometer.  This data is correlated to 30 people performing 6 different types of activities such as walking or standing.  A code book is to be supplied for reference to variable specifics.

### data source for the project is listed below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### It is assumed that all the data is previously downloaded and unzipped into the working directory for operations.  This is per the courses instruction "The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory"

### Important items to note:

1.  The script to be run is titled "run_analysis.R".  This script is to be executed from the R working directory where the necessary data files are located (from step 2 below).
2.  The key files, selected from the larger data set, to be included in the working directory are:
	+ run_analysis.R
    + features.txt
    + activity_labels.txt
    + X_test.txt
    + Y_test.txt
    + subject_test.txt
    + X_train.txt
    + y_train.txt
    + subject_test.txt
3.  The file "README.md", also in the working directory, is the general description of how the script works, with necessary input files.
4.  The file "Code_book.md", also in the working directory, provides details of the files and their content, describing variables.
5.  The file "tidy_data_set" is written from the code and is the summarized (average) set per measurement by person per category as instructed in step 5 of the assignment. It is important to note this data was further reduced from the larger set to only include measurement variable categories that are mean or standard deviation.
6.  Comments in the R code have more explicit descriptions on operations per line.

### Summarized code function:

Reads the measurement text files into dataframes, merges the test and train files into one dataframe and correctly associates headers for measurements, people and activities.  This large dataframe is subsetted further to reflect measurements that have the mean or standard deviation in their name. The final step is to write the file "tidy_data_set" into the working directory.  

