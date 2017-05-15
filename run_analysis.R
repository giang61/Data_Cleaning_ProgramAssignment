# Read the data into R

trainData <- read.table("./X_train.txt")
testData <- read.table("./X_test.txt")
features <- read.table("./features.txt")
trainLabels <- read.table("./y_train.txt")
testLabels <- read.table("./y_test.txt")
trainSubjects <- read.table("./subject_train.txt")
testSubjects <- read.table("./subject_test.txt")

## Merges the train and test data to create one data set

mergedData <- merge(trainData,testData,all=TRUE)
mergedLabels <- rbind(trainLabels,testLabels)
mergedSubjects <- rbind(trainSubjects,testSubjects)

## Filter for the variable names containing std() and mean() 
std_mean <- grep ("std\\(\\)|mean\\(\\)", features$V2)
  #### To see the selected Features
  #### features[std_mean,]

## Select the columns containing the std() and mean() variables
selectedData <- select(mergedData,std_mean)

## rename the original column names with the names of these variables 
names(selectedData) <- features[std_mean,2]
  ### To see the names of the selected variables
  #### names(selectedData)

## replace the activity code with their respective names
mergedLabels[,1] <- gsub(1,"WALKING",mergedLabels[,1])
mergedLabels[,1] <- gsub(2,"WALKING_UPSTAIRS",mergedLabels[,1])
mergedLabels[,1] <- gsub(3,"WALKING_DOWNSTAIRS",mergedLabels[,1])
mergedLabels[,1] <- gsub(4,"SITTING",mergedLabels[,1])
mergedLabels[,1] <- gsub(5,"STANDING",mergedLabels[,1])
mergedLabels[,1] <- gsub(6,"LAYING",mergedLabels[,1])

## Name the Activity and SubjectID column variables
names(mergedLabels) <- c("Activity")
names(mergedSubjects) <- c("SubjectID")

## Append the Label and Suject data to the merged data
tidyData <- cbind(mergedLabels,selectedData)
tidyData <- cbind(mergedSubjects,tidyData)

## Group the tidyData by subject and activity
by_ID_Activity <- group_by(tidyData,SubjectID,Activity)

## Find the mean of each variable according to subject ID and activity
summarizedData <- summarise_each(by_ID_Activity, funs(mean))

## Saving the resulting summarized tidy data to a .txt file
write.table(summarizedData, "./summarizedData.txt", sep="\t", row.name=FALSE)
