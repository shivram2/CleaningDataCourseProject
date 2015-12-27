#Study Design:
check http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

All information was also taken from there.
#Code Book
##Variables (68 in total):

SubjectID - Represents the id of the subject (30 subjects in total)
ActivityType - Represents the type of activity that the subject was carrying out (Walking, walking upstairs, walking downstairs, sitting, standing, laying)

##- The units used for the body acceleration are 'g's (gravity of earth -> 9.80665 m/seg2).
##The units used for the angular velocity are rad/seg.

##The variables with XYZ listed at the end of their name show up with one of those letters three separate times in the tidy data (representing a different axis direction each time).

##The following variables also all have both a mean and a standard deviation (e.g. tBodyAccelerationMagnitudeMean or tBodyAccelerationMagnitudeStandardDeviation). The ones with XYZ at the end will appear like so (tBodyAccelerationMeanX or tBodyAccelerationStandardDeviationX)

tBodyAccelerationXYZ - Time domain body linear acceleration (in a specific axis)

tGravityAccelerationXYZ - Time domain gravity acceleration (in a specific axis)

tBodyAccelerationJerkXYZ - Time domain body linear acceleration jerk (in a specific axis)

tBodyGyroXYZ - Time domain angular velocity (in a specific axis)

tBodyGyroJerkXYZ - Time domain body angular velocity jerk (in a specific axis)

tBodyAccelerationMagnitude - Magnitude of time domain body linear acceleration

tGravityAccelerationMagnitude - Magnitude of time domain gravity acceleration

tBodyAccelerationJerkMagnitude - Magnitude of time domain body linear acceleration jerk

tBodyGyroMagnitude - Magnitude of time domain body angular velocity

tBodyGyroJerkMagnitude - Magnitude of time domain body angular velocity jerk

fBodyAccelerationXYZ - Frequency domain body linear acceleration (in a specific axis)

fBodyAccelerationJerkXYZ - Frequency domain body linear acceleration jerk (in a specific axis)

fBodyGyroXYZ - Frequency domain angular velocity (in a specific axis)

fBodyAccelerationMagnitude - Magnitude of frequency domain angular velocity (in a specific axis)

fBodyAccelerationJerkMagnitude - Magnitude of frequency domain body linear acceleration jerk

fBodyGyroMagnitude - Magnitude of frequency domain body angular velocity

fBodyGyroJerkMagnitude - Magnitude of frequency domain body angular velocity jerk

##Steps taken to make tidy data

Create one table for all test data: 1st column is subject ID(test/subject_test.txt), 2nd column is the activity number(test/y_test.txt), remaining columns are actual data(test/X_test.txt).

Create one table for all training data: 1st column is subject ID(train/subject_train.txt), 2nd column is the activity number(train/y_train.txt), remaining columns are actual data(train/X_train.txt).

Merge the test and training data (by column).

Add column names for the data based on features.txt.

Removed all columns that weren't a subject ID, an activity class, a mean, or a standard deviation (based on the name)

Averaged the variables for each activity-subject combination.

Replaced the activity type numbers with their actual labels (taken from activity_labels.txt).

Changed the variable names to be more readable for humans (mean() became Mean, std() became StandardDeviation, Acc became Acceleration, Mag became Magnitude, BodyBody became Body, and removed all dashes).

Ouput the final data to a text file ("tidydata.txt")

Check the comments in run_analysis.R for step-by-step explanations
