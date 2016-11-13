#Course Project - Getting & Cleaning Data
#
##Objective: 
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

##About the data used for the project
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data for the project downloaded from:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data has been unzipped under getwd()/"UCI HAR Dataset"

##License:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


##Workings of the script 
The script performs following steps on the downloaded data mentioned above

###Step 1: Merges the training and the test sets to create one data set.

* Reads in the relevant data from features.txt, activity\_labels.txt, test (X\_test.txt, y\_test.txt), train (X\_train.txt, y\_train.txt), and subject (subjec\t_train.txt, subject\_test.txt) downloaded under UCI HAR Dataset folder.
* Set up the column names based on feature names read in above from features.txt. Also labels the column read in for subject as "subject" and for activity labels as "activity" and "activityName"
* Combine/Merge the data set using rbind and cbind

	###*Output:*
Merged data-set with 10299 observations of 563 variables

###Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

* Generates a subset from the merged data generated in Step 1. This subset includes all the columns that contain "mean" and std in column names. Also included are the activity and subject columns

	###*Output:* 
Subset of merged data-set with 10299 observations of 68 variables

###Step 3: Uses descriptive activity names to name the activities in the data set

* Populates the activity column in this subset with activity name, read in Step 1. 

###Step 4: Appropriately labels the data set with descriptive variable names

* Replaces "-mean" with Mean and "-std" with "StandardDeviation"
* Replaces starting character "t" & "f" with "time" and "frequency" respectively
* Removes "()"

###Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

* Utilizes aggregate method to compute summary statistics with mean of each variable for each activity and each subject, to generate a tidy dataset
* Writes out the tidy data-set

	###*Output:* 
The second tidy data set contains the average of mean and stand deviation measures of these variables for each subject and activity. ( 180 records = 30 subjects * 6 activities )

##Data Dictionary
	Terms: Acc - Accelerometer, Gyro - Gyroscope

 `subject                                      : int  	: Range [1 - 30]  	: Subjects who performed the activity`
 `activity 									   : Factor w/ 6 levels : LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS`
 `timeBodyAccMean-X							   : num  	: Range [-1, 1]`
 `timeBodyAccMean-Y							   : num  	: Range [-1, 1]`
 `timeBodyAccMean-Z							   : num  	: Range [-1, 1]`
 `timeBodyAccStandardDeviation-X   			   : num  	: Range [-1, 1]`
 `timeBodyAccStandardDeviation-Y   			   : num  	: Range [-1, 1]`
 `timeBodyAccStandardDeviation-Z               : num  	: Range [-1, 1]`
 `timeGravityAccMean-X                         : num  	: Range [-1, 1]`
 `timeGravityAccMean-Y                         : num  	: Range [-1, 1]`
 `timeGravityAccMean-Z                         : num  	: Range [-1, 1]`
 `timeGravityAccStandardDeviation-X            : num  	: Range [-1, 1]`
 `timeGravityAccStandardDeviation-Y            : num  	: Range [-1, 1]`
 `timeGravityAccStandardDeviation-Z            : num  	: Range [-1, 1]`
 `timeBodyAccJerkMean-X                        : num  	: Range [-1, 1]`
 `timeBodyAccJerkMean-Y                        : num  	: Range [-1, 1]`
 `timeBodyAccJerkMean-Z                        : num  	: Range [-1, 1]`
 `timeBodyAccJerkStandardDeviation-X           : num  	: Range [-1, 1]`
 `timeBodyAccJerkStandardDeviation-Y           : num  	: Range [-1, 1]`
 `timeBodyAccJerkStandardDeviation-Z           : num  	: Range [-1, 1]`
 `timeBodyGyroMean-X                           : num  	: Range [-1, 1]`
 `timeBodyGyroMean-Y                           : num  	: Range [-1, 1]`
 `timeBodyGyroMean-Z                           : num  	: Range [-1, 1]`
 `timeBodyGyroStandardDeviation-X              : num  	: Range [-1, 1]`
 `timeBodyGyroStandardDeviation-Y              : num  	: Range [-1, 1]`
 `timeBodyGyroStandardDeviation-Z              : num  	: Range [-1, 1]`
 `timeBodyGyroJerkMean-X                       : num  	: Range [-1, 1]`
 `timeBodyGyroJerkMean-Y                       : num  	: Range [-1, 1]`
 `timeBodyGyroJerkMean-Z                       : num  	: Range [-1, 1]`
 `timeBodyGyroJerkStandardDeviation-X          : num  	: Range [-1, 1]`
 `timeBodyGyroJerkStandardDeviation-Y          : num  	: Range [-1, 1]`
 `timeBodyGyroJerkStandardDeviation-Z          : num  	: Range [-1, 1]`
 `timeBodyAccMagMean                           : num  	: Range [-1, 1]`
 `timeBodyAccMagStandardDeviation              : num  	: Range [-1, 1]`
 `timeGravityAccMagMean                        : num  	: Range [-1, 1]`
 `timeGravityAccMagStandardDeviation           : num  	: Range [-1, 1]`
 `timeBodyAccJerkMagMean                       : num  	: Range [-1, 1]`
 `timeBodyAccJerkMagStandardDeviation          : num  	: Range [-1, 1]`
 `timeBodyGyroMagMean                          : num  	: Range [-1, 1]`
 `timeBodyGyroMagStandardDeviation             : num  	: Range [-1, 1]`
 `timeBodyGyroJerkMagMean                      : num  	: Range [-1, 1]`
 `timeBodyGyroJerkMagStandardDeviation         : num  	: Range [-1, 1]`
 `frequencyBodyAccMean-X                       : num  	: Range [-1, 1]`
 `frequencyBodyAccMean-Y                       : num  	: Range [-1, 1]`
 `frequencyBodyAccMean-Z                       : num  	: Range [-1, 1]`
 `frequencyBodyAccStandardDeviation-X          : num  	: Range [-1, 1]`
 `frequencyBodyAccStandardDeviation-Y          : num  	: Range [-1, 1]`
 `frequencyBodyAccStandardDeviation-Z          : num  	: Range [-1, 1]`
 `frequencyBodyAccJerkMean-X                   : num  	: Range [-1, 1]`
 `frequencyBodyAccJerkMean-Y                   : num  	: Range [-1, 1]`
 `frequencyBodyAccJerkMean-Z                   : num  	: Range [-1, 1]`
 `frequencyBodyAccJerkStandardDeviation-X      : num  	: Range [-1, 1]`
 `frequencyBodyAccJerkStandardDeviation-Y      : num  	: Range [-1, 1]`
 `frequencyBodyAccJerkStandardDeviation-Z      : num  	: Range [-1, 1]`
 `frequencyBodyGyroMean-X                      : num  	: Range [-1, 1]`
 `frequencyBodyGyroMean-Y                      : num  	: Range [-1, 1]`
 `frequencyBodyGyroMean-Z                      : num  	: Range [-1, 1]`
 `frequencyBodyGyroStandardDeviation-X         : num  	: Range [-1, 1]`
 `frequencyBodyGyroStandardDeviation-Y         : num  	: Range [-1, 1]`
 `frequencyBodyGyroStandardDeviation-Z         : num  	: Range [-1, 1]`
 `frequencyBodyAccMagMean                      : num  	: Range [-1, 1]`
 `frequencyBodyAccMagStandardDeviation         : num  	: Range [-1, 1]`
 `frequencyBodyBodyAccJerkMagMean              : num  	: Range [-1, 1]`
 `frequencyBodyBodyAccJerkMagStandardDeviation : num  	: Range [-1, 1]`
 `frequencyBodyBodyGyroMagMean                 : num  	: Range [-1, 1]`
 `frequencyBodyBodyGyroMagStandardDeviation    : num  	: Range [-1, 1]`
 `frequencyBodyBodyGyroJerkMagMean             : num  	: Range [-1, 1]`
 `frequencyBodyBodyGyroJerkMagStandardDeviation: num  	: Range [-1, 1]`
  