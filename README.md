1. Read all the data into R, including the names of the measurement variables, the names of the activity, and the subject IDs for both the training set and the test set


2. Merge the train and test data from the 3 categories (data, activity, and subject) to create one data set for each catagory


3. Filter for the variable names containing std() and mean() in the data set containing the measurement features


4. From the result in the above step, select the columns containing the std() and mean() variables in the merged data set


5. Rename the original column names in the merged data with the names of the std() and mean () variables extracted from the features set


6. Replace the activity code with their respective names in the merged labels data set


7. Name the Activity and SubjectID column variables in the merged labels and merged subjects data sets


8. Append the Label and Suject data to the merged data


9. Group the tidyData by subject and activity


10. Find the mean of each variable according to subject ID and activity


11. Save the resulting summarized tidy data to a .txt file
# Data_Cleaning_ProgramAssignment
# programming-assigment-3
