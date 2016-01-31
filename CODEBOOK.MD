#Getting and Cleaning Data Course Project Codebook

Version of R used 3.2.2

###Codebook
###Variables in the Getting_and_Cleaning_Data_final_Tidy_Data.txt

* ActivityName - The name of the activity
* SubjectId - The subject of the experitment together these variables make unique rows

The following variables are all the averages of each variable from the source data
The prefix "t" indicates time and "f" frequency for the variables.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The below variables all have an x,y,z part with a mean and standard diviation (std) for each part.

* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk

The below varibales have a mean and standard diviation (std).
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag


The below variables all have an x,y,z part with a mean and standard diviation (std) for each part.

* fBodyAcc
* fBodyAccJerk
* fBodyGyro

The below varibales have a mean and standard diviation (std).
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag


###Information about the Summary Choices you made

The Variables in the Getting_and_Cleaning_Data_final_Tidy_Data.txt are all averages (mean) of the source data group by the Subject ID and the Activity Name.

The Data was sources from the UCI HAR Dataset. The test and train data were merged together and only the variables with mean and standard deviation for each measurement were extracted in addition to the Activity Name and the Subject ID.

The data was then grouped on Activity Name and Subject ID and summarised the on the mean of the each variable at the unique subject/activity level using the summarise_each command in the dplyr package.

For detailed description please see the run_analysis.R file where the code is fully commented.

###Experimental study design

This is a project for the Coursera Getting and Cleaning Data course.

The project is to use the data from the below zipped file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Which is data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

You should create one R script called run_analysis.R that does the following.

The task was then create one R script called run_analysis.R that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

