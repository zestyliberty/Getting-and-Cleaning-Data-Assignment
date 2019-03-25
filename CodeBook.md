# Data
Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Based on [UCI's description...](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six >activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the >waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant >rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned >into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


The run_analysis.R includes the work that I performed to complete the project requirements listed below:

* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in step 4, create a tidy data set with the average of each variable for each activity and each subject

# Variables
* `features` lists all the features
* `activities` shows all the activity labels and activity names including:
  * `WALKING`
  * `WALKING_UPSTAIRS`
  * `WALKING_DOWNSTAIRS`
  * `SITTING`
  * `STANDING`
  * `LAYING`
* `test_subject` and `train_subject` show the subject numbers from 1 through 30

# Transformation
1. import necessary package `dplyr`
2. download and unzip files
3. read data from each file 
4. merge all data sets to create one comprehensive data set
5. etract only the measurements on the mean and standard deviation
6. appropriately label the data set with descriptive variable names
7. create a second, independent tidy data set with the average of each variable for each activity and each subject named [TidyData.txt](https://github.com/zestyliberty/Getting-and-Cleaning-Data-Assignment/blob/master/TidyData.txt)
