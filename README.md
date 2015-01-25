# getting-and-cleaning-data
Project for Coursera's "Getting and Cleaning Data"

The "run_analysis.R" script can be sourced and run from within any directory containing the sample data from the quiz in the following structure:

UCI-HAR-Dataset/features.txt

UCI-HAR-Dataset/test/X_test.txt

UCI-HAR-Dataset/test/y_test.txt

UCI-HAR-Dataset/test/subject_test.txt

UCI-HAR-Dataset/train/X_train.txt

UCI-HAR-Dataset/train/y_train.txt

UCI-HAR-Dataset/train/subject_train.txt

The script merges all test data (X (the dataset), y (activity data), and subject data) into one data frame, and all train data (X (the dataset), y (activity data), and subject data) into a second data frame. These two data frames are then merged into one single dataset.

I did this pre-merging of test data and of train data in order to avoid complications that would occur if I were to simply merge the test and train datasets without their subject and activity columns. The complication would namely be that merging reorders data: if I were to try and merge test or train subject and activity data on an already merged test/train dataset, the ordering of the rows would no longer match. 

The script goes on to apply descriptions to the variables to the dataset. These descriptions are used later to subset the desired data. Although this was not the order of the instructions, it seemed easier to subset the desired data by column name.

The script subsets the data on "only the measurements on the mean and standard deviation". I intrepreted this to mean "all columns with the word 'mean' or 'std' in their name". The "grep" function in used to accomplish this efficiently. Indexes on the matching column names are used to create a vector for later subsetting of the data; a dataframe of the columnnames is created and then applied as column names to our main dataset. 

Descriptive labels for the activity factor are applied to the dataframe in a hackatstic use of the "ifelse()" method.

Finally, the resulting selected data is grouped by the variables "subject" and "activity", and a mean is calculated for each of the remaining variables (except "activityDesc", or activity description).

The final tidy dataset is written out with the "write.table" method.

