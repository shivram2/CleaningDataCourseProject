# CleaningDataCourseProject
The script (run_analysis.R) takes in data from a directory containing the dataset (a folder in the workspace called UCI HAR Dataset). In order to run this script, please make sure to have the correct path location (if it is different from the default) and all original file-names.

The final output can be read with the following command:
read.table("tidydata.txt",header=TRUE)

Columns of the data that contained only mean() or mean()-X/Y/Z at the end of their name were considered to be measurements of the mean. Columns that contained meanFreq() at the end of their name or similar such results were discarded.

Columns of the data that contained only std() or std()-X/Y/Zat the end of their name were considered to be measurements of the standard deviation.

The script does a number of different things:

1. Merges the training set and test set to form one data set
2. Labels the data set
3. Removes any measurement that isn't a mean or standard deviation from the data set
5. Makes a tidy independent data set with the average of each variable for each activity and each subject
4. Names the activities in the data set
6. Changes the names of the measurements to make them more understandable for humans
7. Outputs the final tidy independent data set to a file named tidydata.txt
