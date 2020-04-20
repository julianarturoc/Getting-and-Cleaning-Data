#1# Data download and unzip 

# downloading File and check user conditions
fileName <- "UCIdata.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
directory <- "UCI HAR Dataset"
# check File and directory. If file does not exist, then download to working directory.
if(!file.exists(fileName)){
        download.file(url,fileName, mode = "wb") 
}
# check File unzip verification. If the directory does not exist, unzip the downloaded file.
if(!file.exists(directory)){
        unzip("UCIdata.zip", files = NULL, exdir=".")
}
# check if reshape2 package is installed
if (!"reshape2" %in% installed.packages()) {
        install.packages("reshape2")
}
library("reshape2")

#2# Reading Data}
        features <- read.table("UCI HAR Dataset/features.txt")  
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
#3# validating data
        
# A. Merging  training and test sets with rbind.
dataSet <- rbind(X_train,X_test)
# B. Calculate mean and standard deviation for each measurement. 
# Create a vector of only mean and std from features.
Mean_St <- grep("mean()|std()", features[, 2]) 
dataSet <- dataSet[,Mean_St]
# C. Label the data set with each descriptive activity names.
# Clean feature names and rename labels.
CleanFeaturelabels <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(dataSet) <- CleanFeaturelabels[Mean_St]
# Merge test and train of subject data and activity data, give descriptive lables
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)
names(subject) <- 'Subject'
names(activity) <- 'Activity'
# Merge  subject, activity, mean and Standart deviation on data set
dataSet <- cbind(subject,activity, dataSet)
# D. Use descriptive activity names to name the activities in the data set and group the activity column of dataSet, re-name lable of levels with activity_levels, and apply it to dataSet.
activity_group <- factor(dataSet$activity)
levels(activity_group) <- activity_labels[,2]
dataSet$activity <- activity_group
# E. Merge all data and cast means. Finally save tidy data to the working directory as "tidy_data.txt"
DB <- melt(dataSet,(id.vars=c("Subject","Activity")))
secondDataSet <- dcast(DB, subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[mean]" , names(secondDataSet)[-c(1:2)] )
write.table(secondDataSet, "tidy_data.txt", sep = ",")

