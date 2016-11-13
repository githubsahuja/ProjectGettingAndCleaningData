#Course Project - Getting & Cleaning Data
#Objective: The purpose of this project is to demonstrate your ability to collect, work with, 
#           and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#Description of the data
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Data for the project
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#The script will perform following steps on the downloaded data

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

#Pre-Condition:
#The data is already downloaded and unzipped under wd/UCI HAR Dataset folder
#########

library(plyr);

##Step 1: Merges the training and the test sets to create one data set.
#########

#Setup relevant data.frames
#Feature Data
feature_names_df <- read.table("./UCI HAR Dataset/features.txt")

#Activity  Labels
activity_labels_df <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Training Data / Labels
training_x_df <- read.table("./UCI HAR Dataset/train/X_train.txt")
training_y_labels_df <- read.table("./UCI HAR Dataset/train/y_train.txt")
training_subject_df <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Test Data / Labels
test_x_df <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y_labels_df <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject_df <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Set column names based on the features_df second column
colnames(training_x_df) <- feature_names_df[,2]
colnames(test_x_df) <- feature_names_df[,2]

#Set column names for training (labels) dataset - this data represents activity 
colnames(training_y_labels_df) <- "activity"
colnames(test_y_labels_df) <- "activity"

#Set column names for subject datasets
colnames(training_subject_df) <- "subject"
colnames(test_subject_df) <- "subject"

#Set column names for activity labels
colnames(activity_labels_df) <- c("activity", "subject")

# Merge data - row bind
features_df <- rbind(training_x_df, test_x_df)
activity_df <- rbind(training_y_labels_df, test_y_labels_df)
subject_df <- rbind(training_subject_df, test_subject_df)

#Finally merge columns to get the combined data set
sub_activity_df <- cbind(subject_df, activity_df)
combined_df <- cbind(sub_activity_df, features_df)

##Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#########

#include activity and subject columns
colnames_to_extract <- grepl("subject|activity|mean\\(\\)|std\\(\\)",colnames(combined_df))
combined_subset_df <- combined_df[, colnames_to_extract == TRUE]

##Step 3. Uses descriptive activity names to name the activities in the data set
#########

combined_subset_df$activity <- activity_labels_df[combined_subset_df$activity, 2]

#Step 4. Appropriately labels the data set with descriptive variable names.
#########

colnames(combined_subset_df) <- gsub("-mean", "Mean", colnames(combined_subset_df))
colnames(combined_subset_df) <- gsub("-std", "StandardDeviation", colnames(combined_subset_df))
colnames(combined_subset_df) <- gsub("^t", "time", colnames(combined_subset_df))
colnames(combined_subset_df) <- gsub("^f", "frequency", colnames(combined_subset_df))
colnames(combined_subset_df) <- gsub("[()]", "", colnames(combined_subset_df))

#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.
#########

secondTidyDataSet_df <- aggregate(. ~subject + activity, combined_subset_df, mean)
write.table(secondTidyDataSet_df, file = "Course3_Project_tidy.txt", row.names=FALSE)






