# Computation procedue

Below is a list of steps executed when code is run:

1. Item 1 Loading all data (absolute addresses used)
2. processing of test data - merging test data with subject labels
3. processing of test data - merging already processed data from previous step with activity labels
4. creating tidy test data set - merging two preprocessed data sets
5. processing of training data - merging training data with subject labels
6. processing of train data - merging already processed data from previous step with activity labels
7. creating tidy test data set - merging two preprocessed data sets
8. creating tidy data for both sets - merging two preprocessed data sets (test + train) and selecting only mean and standard variation
9. creating tidy data as mean value of selected variables per Subject and Activity

1. Item 1
2. Item 2
3. Item 3

# Code book

Printed data contains mean (mean) and standard variation (std) of following variables. Please note that when below variable contains XYZ, that means that from this variable 3 values was observed (x axis, y asix and z axis).

Variables:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

