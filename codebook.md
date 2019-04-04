Codebook:

Files that are needed were placed in the working directory and 'dplyr' package was used to run the program.

The following codes were used to run the program:

1. Merges the training and the test sets to create one data set.
	a. read.table -> to read text files of test, train, activity, and features data.
	b. rbind() -> to merge subject, test, and train files for each x and y. 

2. Extracts only the measurements on the mean and standard deviation for each measurement.
	a. grep() -> to search for matches of data with mean and sd

3. Uses descriptive activity names to name the activities in the data set
	a. used a subset function to match the corresponding action per activity
	b. colnames() -> to change column name

4. Appropriately labels the data set with descriptive variable names.
	a. names() -> to change name
	b. gsub() -> to substitute a text to another text
	c. colnames() -> to change column name

5. From the data set in step d, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	a. data.frame() -> to merge all columns (subj, y, x)
	b. group_by () -> to group the needed columns
	c. summarize_all () -> to summarize with averages for each acitivity.
	d. write.table() -> to export final outcome to a text file. 
