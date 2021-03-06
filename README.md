# **Getting and Cleaning Data - Course Project - CleaningData project**

This is the R code for the peer-reviewed assigment of the Johns Hopkins course
"Getting and Cleaning Data" - URL: https://www.coursera.org/course/getdata

The dataset includes the following files:
=========================================
- 'README.md': General explanatory information about all files and tasks
- 'run_analysis.R': Script for the data download, reading and transformation
- 'CodeBook.md': Detailed description for the step-by-step process of the 'run_analysis.R' file
- 'tidydata.txt': File with the results of the process applying

##Task description:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

-----------------------------------------------------------------------------------------

###Acquiring the data:
```r
#Download the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#unzip the data
unzip(zipfile="./data/Dataset.zip",exdir="./data")
```

-----------------------------------------------------------------------------------------

Performing the required transformations
=========================

Read and run the run_analysis.R (the file contains lots of comments about each step)
The Markdown file "CodeBook.md" describes the steps with illustrative details.

Here is a summary of what to do after read all the raw data files.

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!
