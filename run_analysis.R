#Read in test data
subjectTest<-read.table("UCI HAR Dataset/test/subject_test.txt")
xTest<-read.table("UCI HAR Dataset/test/X_test.txt")
yTest<-read.table("UCI HAR Dataset/test/y_test.txt")

#Create one table for all test data: 1st column is subject ID, 2nd column is the activity class label.
#remaining columns are actual data
testData<-cbind(subjectTest,yTest,xTest)

#Read in training data
subjectTrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain<-read.table("UCI HAR Dataset/train/X_train.txt")
yTrain<-read.table("UCI HAR Dataset/train/y_train.txt")

#Create one table for all training data: 1st column is subject ID, 2nd column is the activity class label.
#remaining columns are actual data
trainingData<-cbind(subjectTrain,yTrain,xTrain)

#Merge the test and training data
allData<-rbind(testData,trainingData)

#Read in activity labels and features
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

#Create column names for the merged data
columnNames=c("SubjectID","ActivityType",as.character(features$V2))

#Add column names for the data
colnames(allData)<-columnNames

#create a logical vector that can be used to remove anything that isn't a mean, standard deviation, subject id, or activity
#(based on the column names)
removeVector=(grepl("SubjectID",columnNames) | grepl("ActivityType",columnNames) | (grepl("-mean..",columnNames) & !grepl("-meanFreq..",columnNames) ) | grepl("-std..",columnNames) )

#remove all columns that aren't means,standard deviations, subject ids, or activity types
allData=allData[removeVector]

#Averages the variables for each activity and each subject
allTidyData=aggregate(allData[,colnames(allData) != c('SubjectID','ActivityType')],by=list("SubjectID" = allData$'SubjectID',"ActivityType"=allData$'ActivityType'),mean)

##Replace numbers in Activity Type with their actual label (Names the activities in the data set)
for (x in 1:6)
{
  allTidyData$'ActivityType'[allTidyData$'ActivityType'==x]<-as.character(activityLabels$V2[x])
}

#Gets the column names of tidy data
columnNames=colnames(allTidyData)


#Replaces mean with Mean in column names
columnNames<-gsub("mean","Mean",columnNames)

#Replaces std with Standard Deviation in column names
columnNames<-gsub("std","StandardDeviation",columnNames)

#replaces "Acc" with Acceleration in column names
columnNames<-gsub("Acc","Acceleration",columnNames)

#replaces Mag- with Magnitude in column names
columnNames<-gsub("Mag-","Magnitude",columnNames)

#replaces BodyBody with Body
columnNames<-gsub("BodyBody","Body",columnNames)

#Removes () in column names
columnNames<-gsub("\\()","",columnNames)

#Removes - in column names
columnNames<-gsub("-","",columnNames)

#Adds fixed column names
colnames(allTidyData)<-columnNames


#output final tidy data to a text file
write.table(allTidyData,file="tidydata.txt",row.names=FALSE)



