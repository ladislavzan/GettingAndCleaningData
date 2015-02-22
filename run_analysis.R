
#Loading all data
setwd("C:\\Dokumenty\\CoursEra\\Data Science Specialisation\\Getting and cleaning data\\Week 3\\Project")
raw_data_act <- read.table("activity_labels.txt")
variables_names <- read.table("features.txt")
setwd("C:\\Dokumenty\\CoursEra\\Data Science Specialisation\\Getting and cleaning data\\Week 3\\Project\\train")
raw_data_train <- read.table("X_train.txt", col.names = variables_names[,2])
raw_data_train_act <- read.table("y_train.txt")
raw_data_train_subj <- read.table("subject_train.txt")
setwd("C:\\Dokumenty\\CoursEra\\Data Science Specialisation\\Getting and cleaning data\\Week 3\\Project\\test")
raw_data_test <- read.table("X_test.txt", col.names = variables_names[,2])
raw_data_test_act <- read.table("y_test.txt")
raw_data_test_subj <- read.table("subject_test.txt")

#processing of test data - merging test data with subject labels
processed_data_test <- cbind(raw_data_test,seq(1,nrow(raw_data_test),by = 1))
colnames(processed_data_test)[562] <- "ID"
processed_data_test_subj <- cbind(raw_data_test_subj,seq(1,nrow(raw_data_test_subj),by = 1))
colnames(processed_data_test_subj)[1] <- "Subject"
colnames(processed_data_test_subj)[2] <- "ID"
processed_data_test <- merge(processed_data_test, processed_data_test_subj, by.x="ID", by.y="ID")

#processing of test data - merging already processed data from previous step with activity labels
processed_data_test_act <- merge(raw_data_test_act, raw_data_act, by.x="V1", by.y="V1")
processed_data_test_act <- cbind(processed_data_test_act,seq(1,nrow(processed_data_test_act),by = 1))
colnames(processed_data_test_act)[1] <- "ID.Activity"
colnames(processed_data_test_act)[2] <- "Activity"
colnames(processed_data_test_act)[3] <- "ID"

#creating tidy test data set - merging two preprocessed data sets
tidy_data_test <- merge(processed_data_test, processed_data_test_act, by.x = "ID", by.y="ID")


#processing of training data - merging training data with subject labels
processed_data_train <- cbind(raw_data_train,seq(1,nrow(raw_data_train),by = 1))
colnames(processed_data_train)[562] <- "ID"
processed_data_train_subj <- cbind(raw_data_train_subj,seq(1,nrow(raw_data_train_subj),by = 1))
colnames(processed_data_train_subj)[1] <- "Subject"
colnames(processed_data_train_subj)[2] <- "ID"
processed_data_train <- merge(processed_data_train, processed_data_train_subj, by.x="ID", by.y="ID")

#processing of train data - merging already processed data from previous step with activity labels
processed_data_train_act <- merge(raw_data_train_act, raw_data_act, by.x="V1", by.y="V1")
processed_data_train_act <- cbind(processed_data_train_act,seq(1,nrow(processed_data_train_act),by = 1))
colnames(processed_data_train_act)[1] <- "ID.Activity"
colnames(processed_data_train_act)[2] <- "Activity"
colnames(processed_data_train_act)[3] <- "ID"

#creating tidy test data set - merging two preprocessed data sets
tidy_data_train <- merge(processed_data_train, processed_data_train_act, by.x = "ID", by.y="ID")

#creating tidy data for both sets - merging two preprocessed data sets (test + train) and selecting only mean and standard variation
processed_data_whole <- rbind(tidy_data_test, tidy_data_train)
processed_data_whole <- processed_data_whole [,-1]
processed_data_whole <- cbind(processed_data_whole, seq(1,nrow(processed_data_whole), by = 1))
colnames(processed_data_whole)[565] <- "ID"
processed_data_whole1 <- as.data.frame(cbind(processed_data_whole[,1], processed_data_whole[,2], processed_data_whole[,3], processed_data_whole[,4], processed_data_whole[,5], processed_data_whole[,6], processed_data_whole[,41], processed_data_whole[,42], processed_data_whole[,43], processed_data_whole[,44], processed_data_whole[,45], processed_data_whole[,46], processed_data_whole[,81], processed_data_whole[,82], processed_data_whole[,83], processed_data_whole[,84], processed_data_whole[,85],processed_data_whole[,86], processed_data_whole[,121], processed_data_whole[,122], processed_data_whole[,123], processed_data_whole[,124], processed_data_whole[,125], processed_data_whole[,126], processed_data_whole[,161], processed_data_whole[,162], processed_data_whole[,163], processed_data_whole[,164], processed_data_whole[,165], processed_data_whole[,166], processed_data_whole[,201], processed_data_whole[,202], processed_data_whole[,214], processed_data_whole[,215], processed_data_whole[,227], processed_data_whole[,228], processed_data_whole[,240], processed_data_whole[,241], processed_data_whole[,253], processed_data_whole[,254], processed_data_whole[,266], processed_data_whole[,267], processed_data_whole[,268], processed_data_whole[,269], processed_data_whole[,270], processed_data_whole[,271], processed_data_whole[,345], processed_data_whole[,346], processed_data_whole[,347], processed_data_whole[,348], processed_data_whole[,349], processed_data_whole[,350], processed_data_whole[,424], processed_data_whole[,425], processed_data_whole[,426], processed_data_whole[,427], processed_data_whole[,428], processed_data_whole[,429], processed_data_whole[,503], processed_data_whole[,504], processed_data_whole[,516], processed_data_whole[,517], processed_data_whole[,529], processed_data_whole[,530], processed_data_whole[,542], processed_data_whole[,543], processed_data_whole[,562], processed_data_whole[,565]))
colnames(processed_data_whole1) <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()", "Subject", "ID")
tidy_data1 <- merge(processed_data_whole1, processed_data_whole[564:565], by.x="ID", by.y="ID")

#creating tidy data as mean value of selected variables per Subject and Activity
library(reshape2)
melt_data <- tidy_data1 [,-1]
melt_data <- melt(melt_data, ID=c("Subject", "Activity"), measure.vars=c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()"))
tidy_data2 <- dcast(melt_data, Activity + Subject ~ variable, mean)
print(tidy_data2)
