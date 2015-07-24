<!---------------------------------------------
title: "codebook.Rmd"
author: "Diego Maciel Geronimo"
date: "Friday, July 24, 2015"
output: MarkDown Document
----------------------------------------------->

# **Getting and Cleaning Data - Course Project**

### Introduction
One of the most exciting areas in all of data science right now is wearable computing [1]. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

### Variables
The data experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually [2].

Each record provides these measurements aggregate by subject and activity:

- activity label. 
- identifier of the subject who carried out the experiment.
- 66-feature vector averageing each variable. 

Variable Name  | Description 
-------------- | ------------
"subject"  | identifier of the subject who carried out the experiment
"activity"  | activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
"timeBodyAccelerometer-mean()-X"  | Mean value, averaged   
"timeBodyAccelerometer-mean()-Y"  | Mean value, averaged   
"timeBodyAccelerometer-mean()-Z"  | Mean value, averaged   
"timeBodyAccelerometer-std()-X"  | Standard deviation, averaged
"timeBodyAccelerometer-std()-Y"  | Standard deviation, averaged
"timeBodyAccelerometer-std()-Z"  | Standard deviation, averaged
"timeGravityAccelerometer-mean()-X"  | Mean value, averaged   
"timeGravityAccelerometer-mean()-Y"  | Mean value, averaged   
"timeGravityAccelerometer-mean()-Z"  | Mean value, averaged   
"timeGravityAccelerometer-std()-X"  | Standard deviation, averaged
"timeGravityAccelerometer-std()-Y"  | Standard deviation, averaged
"timeGravityAccelerometer-std()-Z"  | Standard deviation, averaged
"timeBodyAccelerometerJerk-mean()-X"  | Mean value, averaged   
"timeBodyAccelerometerJerk-mean()-Y"  | Mean value, averaged   
"timeBodyAccelerometerJerk-mean()-Z"  | Mean value, averaged   
"timeBodyAccelerometerJerk-std()-X"  | Standard deviation, averaged
"timeBodyAccelerometerJerk-std()-Y"  | Standard deviation, averaged
"timeBodyAccelerometerJerk-std()-Z"  | Standard deviation, averaged
"timeBodyGyroscope-mean()-X"  | Mean value, averaged   
"timeBodyGyroscope-mean()-Y"  | Mean value, averaged   
"timeBodyGyroscope-mean()-Z"  | Mean value, averaged   
"timeBodyGyroscope-std()-X"  | Standard deviation, averaged
"timeBodyGyroscope-std()-Y"  | Standard deviation, averaged
"timeBodyGyroscope-std()-Z"  | Standard deviation, averaged
"timeBodyGyroscopeJerk-mean()-X"  | Mean value, averaged   
"timeBodyGyroscopeJerk-mean()-Y"  | Mean value, averaged   
"timeBodyGyroscopeJerk-mean()-Z"  | Mean value, averaged   
"timeBodyGyroscopeJerk-std()-X"  | Standard deviation, averaged
"timeBodyGyroscopeJerk-std()-Y"  | Standard deviation, averaged
"timeBodyGyroscopeJerk-std()-Z"  | Standard deviation, averaged
"timeBodyAccelerometerMagnitude-mean()"  | Mean value, averaged   
"timeBodyAccelerometerMagnitude-std()"  | Standard deviation, averaged
"timeGravityAccelerometerMagnitude-mean()"  | Mean value, averaged   
"timeGravityAccelerometerMagnitude-std()"  | Standard deviation, averaged
"timeBodyAccelerometerJerkMagnitude-mean()"  | Mean value, averaged   
"timeBodyAccelerometerJerkMagnitude-std()"  | Standard deviation, averaged
"timeBodyGyroscopeMagnitude-mean()"  | Mean value, averaged   
"timeBodyGyroscopeMagnitude-std()"  | Standard deviation, averaged
"timeBodyGyroscopeJerkMagnitude-mean()"  | Mean value, averaged   
"timeBodyGyroscopeJerkMagnitude-std()"  | Standard deviation, averaged
"frequencyBodyAccelerometer-mean()-X"  | Mean value, averaged   
"frequencyBodyAccelerometer-mean()-Y"  | Mean value, averaged   
"frequencyBodyAccelerometer-mean()-Z"  | Mean value, averaged   
"frequencyBodyAccelerometer-std()-X"  | Standard deviation, averaged
"frequencyBodyAccelerometer-std()-Y"  | Standard deviation, averaged
"frequencyBodyAccelerometer-std()-Z"  | Standard deviation, averaged
"frequencyBodyAccelerometerJerk-mean()-X"  | Mean value, averaged   
"frequencyBodyAccelerometerJerk-mean()-Y"  | Mean value, averaged   
"frequencyBodyAccelerometerJerk-mean()-Z"  | Mean value, averaged   
"frequencyBodyAccelerometerJerk-std()-X"  | Standard deviation, averaged
"frequencyBodyAccelerometerJerk-std()-Y"  | Standard deviation, averaged
"frequencyBodyAccelerometerJerk-std()-Z"  | Standard deviation, averaged
"frequencyBodyGyroscope-mean()-X"  | Mean value, averaged   
"frequencyBodyGyroscope-mean()-Y"  | Mean value, averaged   
"frequencyBodyGyroscope-mean()-Z"  | Mean value, averaged   
"frequencyBodyGyroscope-std()-X"  | Standard deviation, averaged
"frequencyBodyGyroscope-std()-Y"  | Standard deviation, averaged
"frequencyBodyGyroscope-std()-Z"  | Standard deviation, averaged
"frequencyBodyAccelerometerMagnitude-mean()"  | Mean value, averaged   
"frequencyBodyAccelerometerMagnitude-std()"  | Standard deviation, averaged
"frequencyBodyAccelerometerJerkMagnitude-mean()"  | Mean value, averaged   
"frequencyBodyAccelerometerJerkMagnitude-std()"  | Standard deviation, averaged
"frequencyBodyGyroscopeMagnitude-mean()"  | Mean value, averaged   
"frequencyBodyGyroscopeMagnitude-std()"  | Standard deviation, averaged
"frequencyBodyGyroscopeJerkMagnitude-mean()"  | Mean value, averaged   
"frequencyBodyGyroscopeJerkMagnitude-std()"  | Standard deviation, averaged


### Data
#### Raw Data
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.[2] Therefore the orignal data include the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

which we  clean up, concatenate and aggregate into one tidy data set
- 'tidy.txt': Tidy set

###Data reading
```r
#reading the data from selected files
path_data <- file.path("./data/UCI HAR Dataset")
##Read the Activity files
ActivityTest  <- read.table(file.path(path_data,
                                      "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(path_data,
                                      "train", "Y_train.txt"),header = FALSE)
##Read the Subject files
SubjectTrain <- read.table(file.path(path_data, "train",
                                     "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path_data, "test" ,
                                     "subject_test.txt"),header = FALSE)
#Read Fearures files
FeaturesTest  <- read.table(file.path(path_data,
                                      "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(path_data,
                                      "train", "X_train.txt"),header = FALSE)
```

###Merges the training and the test sets to create one data set 
```r
##Bind the data tables by rows
Subject <- rbind(SubjectTrain, SubjectTest)
Activity<- rbind(ActivityTrain, ActivityTest)
Features<- rbind(FeaturesTrain, FeaturesTest)

##set names to variables
names(Subject)<-c("subject")
names(Activity)<- c("activity")
FeaturesNames <- read.table(file.path(path_data, "features.txt"),head=FALSE)
names(Features)<- FeaturesNames$V2

##Merge columns to get the data frame Data for all data
dataComb <- cbind(Subject, Activity)
Data <- cbind(Features, dataComb)
```

###Extracts only the measurements on the mean and standard deviation foreach measurement
```r
##Subset Name of Features by measurements on the mean and standard deviation
subFeaturesNames<-FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",FeaturesNames$V2)]
##Subset the data frame Data by seleted names of Features
selectedNames<-c(as.character(subFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

#Uses descriptive activity names to name the activities in the data set
activityLabels<-read.table(file.path(path_data,"activity_labels.txt"),header=F)
Data$activity<-factor(Data$activity,
                      levels=activityLabels$V1,labels=activityLabels$V2)
```

###Appropriately labels the data set with descriptive variable names
```r
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
```

###Creates a second, independent tidy data set with the average of each variable for each activity and each subject
```r
library("plyr")
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
```

#### References:
[1]Data Science, Wearable Computing and the Battle for the Throne as World’s Top Sports Brand, URL: http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/
[2] Human Activity Recognition Using Smartphones Data Set, URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
[3] Data for the project, URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
[4] Tidy data set code book, URL: https://github.com/cwerner13/UCIHAR_Smartphones/blob/master/CodeBook.md  
