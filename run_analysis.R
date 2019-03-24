#import packages
library(dplyr)

#download and unzip file
filename <- "week4peer.zip"
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

#read data---features
features <- read.table("UCI HAR Dataset/features.txt")
colnames(features) <- c("num", "feature")

#read data---activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt") 
colnames(activities) <- c("activityLabel", "activityName")

#read data---train
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_result <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityLabel")

#read data---test
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_result <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityLabel")

#merge data to create one data set
total_subject <- rbind(train_subject, test_subject)
total_result <- rbind(train_result, test_result)
total_activity <- rbind(train_activity, test_activity)

total_data <- cbind(total_subject, total_activity, total_result)

#etract only the measurements on the mean and standard deviation
clean_data <- total_data %>% 
        select(subject, activityLabel, contains("mean"), contains("std"))


#appropriately labels the data set with descriptive variable names
clean_data$activityLabel <- activities[clean_data$activityLabel,2]
names(clean_data)[2] = "activity"

names(clean_data)<-gsub("Acc", "Accelerometer", names(clean_data))
names(clean_data)<-gsub("Gyro", "Gyroscope", names(clean_data))
names(clean_data)<-gsub("Mag", "Magnitude", names(clean_data))
names(clean_data)<-gsub("BodyBody", "Body", names(clean_data))

names(clean_data)<-gsub("^t", "TimeDomain", names(clean_data))
names(clean_data)<-gsub("^f", "FrequencyDomain", names(clean_data))
names(clean_data)<-gsub("freq", "Frequency", names(clean_data))

names(clean_data)<-gsub("tBody", "TimeBody", names(clean_data))
names(clean_data)<-gsub("mean", "Mean", names(clean_data))
names(clean_data)<-gsub("std", "StandardDeviation", names(clean_data))

#create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- clean_data %>%
        group_by(activity, subject) %>%
        summarize_all(list(mean))

write.table(tidy_data, file = "TidyData.txt", row.name=FALSE)

        






