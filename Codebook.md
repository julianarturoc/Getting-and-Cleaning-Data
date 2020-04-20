Download the dataset
        Dataset downloaded and extracted under the folder called UCI HAR Dataset
Assign each data to variables
        features <- table taken from UCI HAR Dataset/features.txt;
        activity_labels <- table taken from UCI HAR Dataset/activity_labels.txt;
        subject_test <- table taken from UCI HAR Dataset/test/subject_test.txt;
        subject_train <- table taken from UCI HAR Dataset/train/subject_train.txt;
        X_test <- table taken from UCI HAR Dataset/test/X_test.txt;
        y_test <- table taken from UCI HAR Dataset/test/y_test.txt;
        X_train <- table taken from UCI HAR Dataset/train/X_train.txt;
        y_train <- table taken from UCI HAR Dataset/train/y_train.txt;
Merges the training and the test sets to create one data set
        dataSet <-merging of X_train and X_test variables;
        Mean_St <- mean and standart deviations taken from "features"; 
Create Datasets fro MEan_ST and rbinding subject_train , y_train_ytest
        dataSet <- dataSet created from "Mean_St";
        subject <- dataset created by rbinding subject_train and subject_test;
        activity <- dataset created by rbinding y_train and y_test;
        dataSet <- dataset created by cbinding subject, activity and dataSet;
Merge all tables in DB
        DB <- melting result from dataSet by Subject and Activity;
Add aditional info to creat a second Data Set
        secondDataSet <- dcast from DB;
Create a TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.

Export FinalData into FinalData.txt file.