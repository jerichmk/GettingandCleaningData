library(dplyr)

##Merges the training and the test sets to create one data set.
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_subj <- read.table("test/subject_test.txt")

train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_subj <- read.table("train/subject_train.txt")

activitee <- read.table("activity_labels.txt")
features <- read.table("features.txt",stringsAsFactors = FALSE)

x <- rbind(test_x,train_x)
y <- rbind(test_y,train_y)
subj <- rbind(test_subj,train_subj)

##Extracts only the measurements on the mean and standard deviation for each measurement.
meansd <- grep("mean\\(\\)|std\\(\\)", features[,2])
x <- x[,meansd]

##Uses descriptive activity names to name the activities in the data set

y[,1]<-activitee[y[,1],2]
colnames(y)[colnames(y)=="V1"] <- "Activity"

##Appropriately labels the data set with descriptive variable names.
names(x) <- features[meansd,2]
names(x) <- gsub("^t", "Time", names(x))
names(x) <- gsub("^f", "Frequency", names(x))
colnames(subj)[colnames(subj)=="V1"] <- "Subject"

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
prefinal <- data.frame(subj,y,x)

FinalTidy <- prefinal %>%
  group_by(Subject, Activity) %>%
  summarize_all(funs(mean))

write.table(FinalTidy, file = "FinalTidy.txt", row.names = FALSE)
