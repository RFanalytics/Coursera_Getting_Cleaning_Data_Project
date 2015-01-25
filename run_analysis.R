# R programing project for Coursera - "Getting and Cleaning Data"
# Submission deadline 1/25/15
# This R code is based on the assumption the data files have been downloaded into your working directory & unzipped
# Source of data is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(plyr)
library(data.table)

# The code will be broken down into the 5 steps described in the instructions (listed below from Coursera instructions)
# 1.    Merges the training and the test sets to create one data set.
# 2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.    Uses descriptive activity names to name the activities in the data set
# 4.    Appropriately labels the data set with descriptive variable names. 
# 5.    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# data inspection observations:  using notepad++ and viewing the files I see no headers, white space delimited, filled, rows/collumns

##########
# step 1 # - Merges the training and the test sets to create one data set.
##########   # inspect the directory and identify the following files to read, X_train.txt, y_train.txt, 
             # subject_train.txt, x_test.txt, y_test.txt, and subject_test.txt

                x_train <- read.table("X_train.txt")            # sep by spaces, very regular, 7352 rows, 561 columns
                y_train <- read.table("y_train.txt")            # one long column, 7352 records, values 1-6, Integer - activities
                subject_train <- read.table("subject_train.txt")# another long column, 7352 records, values 1-30, Integer - people

                x_test <- read.table("X_test.txt")              # sep by spaces, very regular, 2947 rows, 561 columns
                y_test <- read.table("y_test.txt")              # one long column, 2947 records, values 1-6, Integer - activities
                subject_test <- read.table("subject_test.txt")  # another long column, 2947 records, values 2-24, Integer - people

                x_data <- rbind(x_train, x_test)                # creates the complete (merged) data set for X

                y_data <- rbind(y_train, y_test)                # creates the complete (merged) data set for y

                person_data <- rbind(subject_train,
                                     subject_test)              # create the complete (merged) data set for the people
                                                                # note: important to keep the bind order for
                                                                # test and train to correctly associate the people with the data


##########
# step 2 # - Extracts only the measurements on the mean and standard deviation for each measurement.
##########

                features <- read.table("features.txt")          # the "features.txt" file contains all the
                                                                # names for each of the measurements

                mean_std_features <- grep("-(mean|std)\\(\\)", 
                                              features[, 2])    # use only the columns with the words mean or std
                                                                # in their names from "features" (per instructions)

                x_data <- x_data[, mean_std_features]           # choose the appropriate columns from the "thinned" above


                names(x_data) <- 
                        features[mean_std_features, 2]          # associate all the column names

##########
# step 3 # - Uses descriptive activity names to name the activities in the data set
##########

                activities <- read.table("activity_labels.txt")

                y_data[, 1] <- activities[y_data[, 1], 2]       # put in the activity verb to match the index integer

                names(y_data) <- "activity"                     # use the word "activity" for column header


##########
# step 4 # - Appropriately labels the data set with descriptive variable names.
##########

                names(person_data) <- "person"                 # use the word "person" for subject header        

                merge_data <- cbind(x_data, 
                                  y_data, 
                                  person_data)                 # bind the data (by columns) for the data sets
                                                               # that were created to make one dataframe called merge_data

##########
# step 5 # - From the data set in step 4, creates a second, independent tidy data set with the average of 
##########   each variable for each activity and each subject.


                tidy_data_set <- ddply(merge_data, 
                                       .(person, activity),
                                       function(x) colMeans(x[, 1:66]))  # perform the mean across all columns except 
                                                                         # the person and activity columns (66 of the 68 columns)
                                                                         # subsetted by activity per person
                                        

                write.table(tidy_data_set,
                            "tidy_data_set.txt",
                            row.name=FALSE)                     # write "tidy_data_set" to the working directory
