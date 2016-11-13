### Introduction

The purpose of this project is to create one R script that demonstrates ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

A full description of data to be utilized for this project is available at the site:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Task at hand
The script will perform following steps on the downloaded data

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Steps to recreate this on your system
1. Download the data file mentioned above and unzip it in your working directory. Unzip should create a folder "UCI HAR Dataset" 
2. Download run_analysis.R from the repository in your working directory, this file is located at the same level as this README.md
3. Read the CookBook.md or the comments in the script regarding details of the functioning of the script. The details of the data can be found under "UCI HAR Dataset\README.txt" 
4. Run the following in your R

		`source("run_analysis.R")`
5. This should end up generating "Course3\_Project\_tidy.txt" file in your working directory. This file is the result of final step of creating a tidy data set with the average of each variable for each activity and each subject