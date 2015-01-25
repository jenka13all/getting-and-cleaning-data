Variables of tidy-data.txt
 
From the "features_info.txt" of the original dataset:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-X, Y and Z' is used to denote 3-axial signals in the X, Y and Z directions."

These initial measurements were altered in that, for each variable, the mean of all measurements for that variable grouped by activity ("activityDesc") and subject ("subject") were calculated.
Each observation thus represents a grouping of activity and subject, along with the mean of each variable in this grouping.

Apparently the units for each measure (excepting "activityDesc" and "subject", which are factors) are "g", for gravity.

The following variables are part of the data of tidy-data.txt:

activityDesc - a description of the activity performed at the time of the measurement; factor of 6 levels (WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, STANDING, LYING, SITTING)                   
subject - a number assigned to the person performing the activity of the measurement                    

tBodyAcc-mean()-X, Y and Z - mean
tBodyAcc-std()-X, Y and Z  - standard deviation                
tGravityAcc-mean()-X, Y and Z - mean
tGravityAcc-std()-X, Y and Z - standard deviation        
tBodyAccJerk-mean()-X, Y and Z - mean
tBodyAccJerk-std()-X, Y and Z - standard deviation
tBodyGyro-mean()-X, Y and Z - mean
tBodyGyro-std()-X, Y and Z - standard deviation
tBodyGyroJerk-mean()-X, Y and Z - mean
tBodyGyroJerk-std()-X, Y and Z - standard deviation

fBodyAcc-mean()-X, Y and Z - mean
fBodyAcc-std()-X, Y and Z - standard deviation 
fBodyAcc-meanFreq()-X, Y and Z - mean frequency
fBodyAccJerk-mean()-X, Y and Z - mean
fBodyAccJerk-std()-X, Y and Z - standard deviation 
fBodyAccJerk-meanFreq()-X, Y and Z - mean frequency
fBodyGyro-mean()-X, Y and Z - mean
fBodyGyro-std()-X, Y and Z - standard deviation 
fBodyGyro-meanFreq()-X, Y and Z - mean frequency

tBodyAccMag-mean() - mean
tBodyAccMag-std() - standard deviation 
tGravityAccMag-mean() - mean
tGravityAccMag-std() - standard deviation 
tBodyAccJerkMag-mean() - mean
tBodyAccJerkMag-std() - standard deviation 
tBodyGyroMag-mean() - mean
tBodyGyroMag-std() - standard deviation 
tBodyGyroJerkMag-mean() - mean
tBodyGyroJerkMag-std() - standard deviation 

fBodyAccMag-mean() - mean
fBodyAccMag-std() - standard deviation 
fBodyAccMag-meanFreq() - mean frequency
fBodyBodyAccJerkMag-mean() - mean
fBodyBodyAccJerkMag-std() - standard deviation 
fBodyBodyAccJerkMag-meanFreq() - mean frequency
fBodyBodyGyroMag-mean() - mean
fBodyBodyGyroMag-std() - standard deviation 
fBodyBodyGyroMag-meanFreq() - mean frequency
fBodyBodyGyroJerkMag-mean() - mean
fBodyBodyGyroJerkMag-std() - standard deviation 
fBodyBodyGyroJerkMag-meanFreq() - mean frequency

activity - activity code