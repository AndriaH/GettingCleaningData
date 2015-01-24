GettingCleaningData
===================

Repository for Coursera Data Science [Getting and Cleaning Data](https://class.coursera.org/getdata-002). 


The purpose of this project:
============================

The purpose of this project is to demonstrate your ability to collect, work with, and clean 

a data set. The goal is to prepare tidy data that can be used for later analysis. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 

19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 

SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


The dataset for the experiments include the following files:
============================================================

- 'README.txt'

- 'features_info.txt'   : Shows information about the variables used on the feature vector

- 'features.txt'        : List of all features

- 'activity_labels.txt' : Links the class labels with their activity name

- 'train/X_train.txt'   : Training set

- 'train/y_train.txt'   : Training labels

- 'test/X_test.txt'     : Test set

- 'test/y_test.txt'     : Test labels.


You should create one R script called run_analysis.R that does the following.
============================================================================

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation for each measurement. 

3.  Uses descriptive activity names to name the activities in the data set

4.  Appropriately labels the data set with descriptive variable names. 

5.  From the data set in step 4, creates a second, independent tidy data set with the average of 
    each variable for each activity and each subject.


The run_analysis.R performs according to the following steps.
=============================================================

1. Merges the training and the test sets to create one data set.

   1. Read the training subject, activity and data files.

   2. Read the test subject, activity and data files.

   3. Merges the training and the test sets to create one data set using 'rbind' and 'cbind'. 

   4. Use 'setnames' function to convert x variables from old to new.

   5. Combine train and test sets to create a data table called 'dt.' 

   6. Sorts the data table 'dt' and marks it as sorted.


2. Extracts only the measurements on the mean and standard deviation for each
   measurement.

   1. Read the features lists file.

   2. Subset the measurements for the mean and standard deviation from features.
  

3. Uses descriptive activity names to name the activities in the data set

   1. Read the activity labels files from the "activity_labels.txt".

   2. Use the setnames function to assign appropriate names to activity.


4. Appropriately labels the data set with descriptive variable names

   1. Melt the data.table to reshape it from a short and wide format to a tall and
      narrow format.

   2. Merge the activity name

   3. Create a new variable, 'activity' that is equivalent to 'activityName'as a factor class. 

   4. Create a new variable, 'feature' that is equivalent to 'featureName'as a  factor class.


5. Creates a second, independent tidy data set with the average of each variable for
   each activity and each subject.

   1. Create a second tidy set from the data set in step 4.

   2. Write the data set to a text file called "TidyDataSet.txt"
