# CleaningDataCourseProject
The script (run_analysis.R) takes in data from a directory containing the dataset (the default is a folder in the workspace called UCI HAR Dataset). This can be changed by editing line XXX of run_analysis.R. In order to run this script, please make sure to have the correct path location (if it is different from the default).

All columns of the data that contained mean() in their name (e.g. XXX or YYY) were considered to be measurements of the mean.

All columns of the data that contained std() in their name (e.g. WWW or ZZZ) were considered to be measurements of the standard deviation.

The script does a number of different things:

1. Merges the training set and test set to form one data set
2. Removes any measurement that isn't a mean or standard deviation from the data set
3. Names the activities in the data set
4. Labels the data set
5. Creates a final tidy independent data set with the average of each variable for each activity and each subject