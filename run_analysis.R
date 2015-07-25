#Download the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#unzip the data
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#list files in the folder
list.files("./data/UCI HAR Dataset", recursive = TRUE)

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

#Merges the training and the test sets to create one data set
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

#Extracts only the measurements on the mean and standard deviation
#foreach measurement
##Subset Name of Features by measurements on the mean and standard deviation
subFeaturesNames<-FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",FeaturesNames$V2)]
##Subset the data frame Data by seleted names of Features
selectedNames<-c(as.character(subFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

#Uses descriptive activity names to name the activities in the data set
activityLabels<-read.table(file.path(path_data,"activity_labels.txt"),header=F)
Data$activity<-factor(Data$activity,
                      levels=activityLabels$V1,labels=activityLabels$V2)

#Appropriately labels the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Creates a second, independent tidy data set with the average of each variable
#for each activity and each subject
library("plyr")
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
