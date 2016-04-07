# CodeBook for Getting and Cleaning Data

## Data source

* Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Dataset description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Info, copied from description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data contents

The files within the dataset that are used:
- 'train/X_train.txt': Training set
- 'train/y_train.txt': Training labels
- 'test/X_test.txt': Test set
- 'test/y_test.txt': Test labels
- 'features.txt': Features list
- 'activity_labels.txt': Class labels to activity name.

## R code process

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## ```run_analysis.R``` implementation

* Import all the data listed above
* Vertically stack the: a) x_train with x_test data, b) y_train with y_test, c) subject_train with subject_test 
* Keep only those field listings from features that contain mean or std
* Keep only those fields from the vertically stacked datasets that correspond to the mean and std field labels, and then assign those field labels
* Assign subject and activity labels
* Calculate means of the activities
* Export the dataset as a text file
