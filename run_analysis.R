#This script makes use of the Human Activity Recognition Using Smartphones Dataset from UCI and #creates two clean datasets.
#1. Cleandata: A dataset containing the merged training and test sets, measurements on mean and std,  #descriptive activity names and appropriate tidy variable names. 
#2: Tidydata: A dataset which averages the data by activity and subject. 

#loads required packages
library(plyr); library(dplyr)  

#If the required data files are not currently downloaded to the working directory, downloads and #unzips the .zip folder containing 28 files in 4 folders (269 MB) into your current working directory. 
#To check working directory, type getwd(); to set your current working directory use setwd().

if (!file.exists("./UCI HAR Dataset")) {
    fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, "acc.zip")
    unzip("acc.zip") 
}

#Creates variables containing the activity labels and variable names (features)
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels<-activity_labels[,2]

features<-read.table("./UCI HAR Dataset/features.txt")
features<-as.character(features[,2])

#Column binds subject numbers (subject_test|train) and numbered activity labels (y_test|train) to 
#large dataset of processed accelerometer and gyroscope signals (x_test|train)

path1= "./UCI HAR Dataset/test"
files_test<-list.files(path1, pattern="\\.txt$")
test<-bind_cols(lapply(paste(path1, files_test,sep="/"), read.table))
names(test)<-c("subjectID", features,"activity")

path2= "./UCI HAR Dataset/train"
files_train<-list.files(path2, pattern="\\.txt$")
train<-bind_cols(lapply(paste(path2, files_train,sep="/"), read.table))
names(train)<-c("subjectID", features,"activity")

#first required step: merges training and test sets to create one data set. 
bigdata<- bind_rows(test, train)

#second required step: extract mean and std measurements (chose not to extract meanFreq). At the same #time, I rearranged the dataset to put activity as the second column (instead of last) and ordered by subjectID and activity.

#third required step: use descriptive names for activities. 
cleandata<- bigdata %>%
  select(subjectID, activity, contains("mean()"), contains("std()")) %>%
  arrange(subjectID, activity) %>%
  mutate(activity = activity_labels[activity])

#remove the named datasets and assigned variables we no longer need. 
rm(list=setdiff(ls(), "cleandata"))

#forth step: Appropriate variable names. As discussed in Week 4, I removed all non-alphanumeric #characters, converted everything to lowercase and expanded t and f to time and freq, respectively.  

names(cleandata)<-gsub("[^[:alnum:]]", "", names(cleandata));
names(cleandata)<-tolower(names(cleandata));
names(cleandata)<-sub("^t", "time", names(cleandata));
names(cleandata)<-sub("^f", "freq", names(cleandata))

#fifth step: create an independent tidy data set with average of each variable per activity/student. 
#Here I grouped by activity first and then subject. 

tidydata<- cleandata %>%
  group_by(activity, subjectid) %>%
  summarize_each(funs(mean), contains("Body"), contains("Gravity"))

write.table(tidydata, "tidydata.txt", row.names=F)
