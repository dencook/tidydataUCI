## Tidying data from the Human Recognition Using Smartphones Dataset from UCI

**This codebook modifies and updates information provided by the README.txt and features_info file that is downloaded along with the Human Recognition Using Smartphones Dataset from UCI found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip **
 
#### Study design and processing of raw data 

- The experiments were carried out on a group of 30 volunteers between the ages of 19 and 48. 
 
- They performed 6 activities while wearing a Samsung Galaxy S II smartphone on their waist: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

- 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz using the phone's embedded accelerometer and gyroscope. 

- The experiments were video-recorded to label the data manually. 

- The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

- The 3-axial raw signals from the accelerometer and gyroscope are labelled timeAcc-XYZ and timeGyro-XYZ.

- The separated body and gravity acceleration signals are labeled timeBodyAcc-XYZ and timeGravityAcc-XYZ. 

- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals labeled timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ. 

- The magnitude of these three-dimensional signals were calculated using the Euclidean norm and labeled timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag. 

- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag.

#### Codebook: List of Variables and units, summary choices   

The tidydata set contains 180 observations and 68 variables. 

- Column 1 (class integer)num: subjectid--the unique subject id of each of the study participants
- Column 2 (class factor): activity--the activity monitored
- Columns 3-68 (class numeric): The mean and standard deviation of the following features (normalized and bounded within [-1,1]), averaged by subjectid and activity: 

timeBodyAcc-XYZ;
timeGravityAcc-XYZ;
timeBodyAccJerk-XYZ;
timeBodyGyro-XYZ;
timeBodyGyroJerk-XYZ;
timeBodyAccMag;
timeGravityAccMag;
timeBodyAccJerkMag;
timeBodyGyroMag;
timeBodyGyroJerkMag;
freqBodyAcc-XYZ;
freqBodyAccJerk-XYZ;
freqBodyGyro-XYZ;
freqBodyAccMag;
freqBodyAccJerkMag;
freqBodyGyroMag;
freqBodyGyroJerkMag; 
freqBodyBodyAccJerkMag;
freqBodyBodyGyroMag;
freqBodyBodyGyroJerkMag;

License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


