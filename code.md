# Code bood for variables

1. trainData <- training data read from "X_train.txt"
2. testData <- test data read from "X_test.txt"
3. features <- measurement variable names read from "features.txt"
4. trainLabels <- training activity labels read from "y_train.txt"
5. testLabels <- test activity lables read from "y_test.txt"
6. trainSubjects <- training subject ID read from "subject_train.txt"
7. testSubjects <- test subject ID read from "subject_test.txt"
8. mergedData <- merged data from training data and test data sets
9. mergedLabels <- merged data from training and test labels
10. mergedSubjects <- merged data from training and test subjects ID
11. std_mean <- data extracted from the features set containing std() and mean()
12. selectedData <- extracted columns from the merged data set with the names filtered from std_mean
13. tidyData <- merged std and mean data with measurements, activity and subject ID appropriatedly labeled
14. by_ID_Activity <- group the tidyData by subject and activity
15. summarizedData <- data containing the mean of each variable from tidyData grouped by subject and activity
