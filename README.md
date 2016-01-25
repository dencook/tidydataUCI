# tidydataUCI
An R script written for the Getting and Cleaning Data Using R Coursera class

This R script was developed and run on Windows 8 using RStudio/R version 3.2.3 with packages plyr and dplyr installed.  

It uses the Human Activity Recognition Using Smartphones Dataset from UCI and creates two clean datasets.

1. Cleandata: A dataset containing the merged training and test sets, measurements on mean and std, descriptive activity names and appropriate tidy variable names. 

2: Tidydata: A dataset which averages the data by activity and subject. 

If the required data files are not currently downloaded to the working directory, the script will downloads and unzip the .zip folder containing 28 files in 4 folders (269 MB) into your current working directory. 

The script will first read the appropriate files from UCI HAR Dataset and create vectors containing the activity labels (factor vector activity_labels) and features names (character vector features). 

It then reads in the main data files (x_test|train) and column binds the subject numbers (subject_test|train) and numbered activity labels (y_test|train). Names are added to the columns, making use of the features vector created above. 

These two datasets are then merged, meeting the first requirement. 
bigdata<- bind_rows(test, train)

The mean and std measurements, not including meanFreq, are then extracted. The dataset is rearranged to put activity as the second column (instead of last) and ordered by subjectID and activity. The values of the numbered activity variable are relabeled with their corresponding names for clarity. This meets the second and third requirement. 

Some cleaning is then performed on the feature variable names to remove alphanumeric characters, convert everything to lower character(not sure this is better), add clarity. This meets the forth requirement. 

An independent tidy data set is created by averaging each variable by activity and student. This data is then saved as a .txt file into the working directory. 

The only dataframes and assigned variables left in the workspace should be cleandata (10299 x68) and tidydata (180 x 68). Because they said create an "independent" dataset, so I'm assuming we should be left with two. 

 
