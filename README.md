# Getting-and-Cleaning-Data
# Variables used in the model
fileName <- name of the downloaded file
url <- url which cointains zip file
directory <- name of file directory
features <- table taken from UCI HAR Dataset/features.txt 
activity_labels <- table taken from UCI HAR Dataset/activity_labels.txt
subject_test <- table taken from UCI HAR Dataset/test/subject_test.txt
subject_train <- table taken from UCI HAR Dataset/train/subject_train.txt
X_test <- table taken from UCI HAR Dataset/test/X_test.txt
y_test <- table taken from UCI HAR Dataset/test/y_test.txt
X_train <- table taken from UCI HAR Dataset/train/X_train.txt
y_train <- table taken from UCI HAR Dataset/train/y_train.txt
dataSet <-merging of X_train and X_test variables
Mean_St <- mean and standart deviations taken from "features"" 
dataSet <- dataSet created from "Mean_St""
subject <- dataset created by rbinding subject_train and subject_test
activity <- dataset created by rbinding y_train and y_test
dataSet <- dataset created by cbinding subject, activity and dataSet
DB <- melting result from dataSet by Subject and Activity
secondDataSet <- dcast from DB