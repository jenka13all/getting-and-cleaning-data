#set working directory
#setwd('C:/classes/coursera/getting-and-cleaning-data/project/')

#load our libraries
library(dplyr)

###################################################################
#1. Merge the training and the test sets to create one data set.

########################################
#merge test/X_test (test observations),
#test/y_test (activity for each test observation)
#and test/subject_test (subject for each test observation)
########################################

#read test data into table
test <- read.table("UCI-HAR-Dataset/test/X_test.txt")
#dim(test) # 2947 rows, 561 cols

#read test activities into table
testAct <- read.table("UCI-HAR-Dataset/test/y_test.txt")
#dim(testAct) #2974 rows, 1 col

#read test subjects into table
testSubjects <- read.table("UCI-HAR-Dataset/test/subject_test.txt")
#dim(testSubjects) #2947 rows, 1 col

#merge test data with activities and subjects
dataTest <- cbind(test, testAct, testSubjects)
#dim(dataTest) # 2947 rows, 563 cols

########################################
#merge train/X_train (train observations),
#train/y_train (activity for each train observation)
#and train/subject_train (subject for each train observation)
########################################

#read train data into table
train <- read.table("UCI-HAR-Dataset/train/X_train.txt")
#dim(train) # 7352 rows, 561 cols

#read train activities into table
trainAct <- read.table("UCI-HAR-Dataset/train/y_train.txt")
#dim(trainAct) #7352 rows, 1 col

#read train subjects into table
trainSubjects <- read.table("UCI-HAR-Dataset/train/subject_train.txt")
#dim(trainSubjects) #7352 rows, 1 col

#merge train data with activities and subjects
dataTrain <- cbind(train, trainAct, trainSubjects)
#dim(labeledTrain) #7352 rows, 563 cols

########################################
#merge test and train data
#I do this step after merging activities and subjects into test and train data
#in order to ensure that the observations, activities and subjects are all kept together correctly
#since merging test and train FIRST would reorder their data,
#making respective activities and subjects no longer match the data! 
########################################

allData <- rbind(dataTest, dataTrain)
#dim(allData) #10299 rows, 563 cols


###################################################################
#2. Extract only the measurements on the mean and standard deviation for each measurement.
#I'm interpreting "only the measurements on the mean and standard deviation" to specify
#that we want all measurements with "mean" or "std" in their description

#the meaning of each variable is described in the "features.txt" data file
features <- read.table("UCI-HAR-Dataset/features.txt")
#dim(features) # 561 rows, 2 cols

#if we want to match up the variable descriptions with the columns of allData,
#we will need to invert "features" to end up as 563 columns 
#(561 cols + 1 col for activity + 1 col for subject) and 1 row (for the variable description)

#add a row to the end of features that will correspond to the added activity
activityFeature <- data.frame(V1=562, V2="activity")

#add a row to the end of features that will correspond to the added subject 
subjectFeature <- data.frame(V1=563, V2="subject")

#combine features with activity and subject
fullFeatures <- rbind(features, activityFeature, subjectFeature)

#before we continue, get a list of indexes where the value of a feature is like "mean" or "std"
#we will use this index to subset our merged data to just the columns that we want
featureSubset <- filter(fullFeatures, grepl('mean|std', V2))
featureSubsetIndex <- select(featureSubset, V1)

#don't forget to include the index for the "activity" and "subject" columns
featureSubsetIndex <- rbind(featureSubsetIndex, 562)
featureSubsetIndex <- rbind(featureSubsetIndex, 563)

#prepare to invert fullFeatures: cut off the number column ("V1")
fullFeatures <- fullFeatures[,2]

#invert (transpose) fullFeatures so that instead of 563 rows, there 563 columns
#this will make it match the number of columns in allData
allDataLabels <- t(fullFeatures)

#dim(allDataLabels)  # 1 row, 563 columns 
#allDataLabels[,562] #[1] activity
#allDataLabels[,563] #[1] subject
#allDataLabels[,1]   #[1] tBodyAcc-mean()-X

#make these labels into column names for allData
colnames(allData) = allDataLabels
#names(allData) 

#finally, subset the data we want by column
selectedData <- allData[, featureSubsetIndex[,1]]
#names(selectedData)


###################################################################
#3. Use descriptive activity names to name the activities in the data set

#create a column named "activityDesc" and fill it with the text values described in "activity_labels.txt"
#based on the corresponding value in the "activity" column

#if activity == 1 then activityDesc = "WALKING" else ""
#if activity == 2 then activityDesc = "WALKING_UPSTAIRS" else leave it as it is
#etc.

#this is a total hack, I'm sure there is a way better way to achieve the same results

selectedData$activityDesc <- ifelse(selectedData$activity == 1, "WALKING", "")
selectedData$activityDesc <- ifelse(selectedData$activity == 2, "WALKING_UPSTAIRS", selectedData$activityDesc)
selectedData$activityDesc <- ifelse(selectedData$activity == 3, "WALKING_DOWNSTAIRS", selectedData$activityDesc)
selectedData$activityDesc <- ifelse(selectedData$activity == 4, "SITTING", selectedData$activityDesc)
selectedData$activityDesc <- ifelse(selectedData$activity == 5, "STANDING", selectedData$activityDesc)
selectedData$activityDesc <- ifelse(selectedData$activity == 6, "LAYING", selectedData$activityDesc)

#quick check to see if activity and activityDesc match up
#select(selectedData, activity:activityDesc)


###################################################################
#4. Appropriately label the data set with descriptive variable names. 

#we did this in step 2 as preparation for subsetting our data
#see comment:
#make these labels into column names for allData


###################################################################
#5. From the data set in step 4, creates a second, independent tidy data set with:
 	#the average of each variable for each activity and each subject

#columns to group by: activityDesc and subject
grouped <- group_by(selectedData, activityDesc, subject)

#summarize the grouped data with mean of each column
tidy <- summarise_each(grouped, funs(mean))

#write to a text file as a table that can be read by read.table
write.table(tidy, "tidy-data.txt", row.name=FALSE)


