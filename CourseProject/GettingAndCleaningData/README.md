# run_analysis.R

## Repository content
* README.md: this file.
* CodeBook: Study design and description of the variables.
* run_analysis.R: R script to clean up and aggregate the original data.
* res.txt: sample result of the run_analysis script.

## run_analysis.R

The script was developed and tested on Windows 7 with R Version 3.1.2.

The source data set is collected by Reyes-Ortiz, Anguita, Ghio, and Oneto from the Smartlab Non Linear Complex Systems Laboratory in Genoa, Italy and represents data from accelerometers of the the Samsung Galaxy S 2 (see [1], [2]). The data set archive has been downloaded from [3]. 

The following steps are executed:
1.	The train and the test data sets are merged to one data set.
2.	Only measurements on the mean and standard deviation for each measurement are retained. 
3.	Descriptive activity names are used in the resulting data set
4.	Appropriately label of the variables are used. 
5.	From the data set in step 4, for each activity and subject the average of the measurement are computed and stored in a second tidy dataset.  
Further details of the study design can be obtained in the cited web source.

### Data processing steps
In detail, the following steps are executed:
"run_analysis.R" downloads the data form the specified download adress 
("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the �input� subfolder of the workspace,  unzipes the files and reads the needed data into R.

The following files are from interest:
* activity_labels.txt: the labels for the activities.
* features.txt: variable names of the measured variables (columns of the matrix)
* test/y_test.txt, train/y_train.txt: the activity index for each measurement, eitzer for the test-set (y_test.txt) or the train-set (y_trian.txt).
* test/subject_test.txt, train/subject_train.txt: the subjects executing a measurement eiter for the test or the train-set.
* test/X_test.txt, train/X_tran.txt: the measurement array. Each row is a measurement of a given activity and given subject, each column a measurement.

The variables that represents mean or standard deviation measures can be identified by their endings. They end with "-mean()" resp. "-std()". All other variables can be removed.
To do this, a "mean_and_std_filter" filter vector is build that only keeps the rows with "-mean()" and "-std()� This filter is applied to the columns of X_train resp. X_test.

We name the columns with the speaking variable names extracted from "features.txt" and add the subjects (numbred from 1 to 30) and the activities to the two X-tables. The index of activities are replaced by their speaking names of activity_labels. 

Finally the two data.frames are merged into a single data.frame (rbind).

This data is stored in the X_complete data.frame. We have now a tidy set of raw data.

To compute the mean of the raw data, we use the aggregate function applied to a formulae. The result of the aggregation is stored into the "res.txt"-file in the working directory.

## References

[1] Anguita, D., A. Ghio, L. Oneto, X. Parra and J. L. Reyes-Ortiz (2012): Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[3] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

