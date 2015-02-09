# run_analysis.R

The "run_analysis.R" downloads the data form the specified download area 
("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
into the subfolder "input" of the workspace. It Unzipes the files and reads the needed one into R.

The following files are from interest:
* activity_labels.txt: the labels for the activities.
* features.txt: variable names of the measured variables (columns of the matrix)
* test/y_test.txt, train/y_train.txt: the activity index for each measurement, eitzer for the test-set (y_test.txt) or the train-set (y_trian.txt).
* test/subject_test.txt, train/subject_train.txt: the subjects executing a measurement eiter for the test or the train-set.
* test/X_test.txt, train/X_tran.txt: the measurement array. Each row is a measurement of a given activity and given subject, each column a measurement.

All these files are read into R.

We are only interested in the mean and standard deviations of a measurement. All other variables can be discarted. Such variables end either with "-mean()" or "-std()".
We create a "mean_and_std_filter" filter-vector that only keeps the rows with "-mean()" and "-std()" and filter the columns of X_train resp. X_test to discard all other columns.

We name the remaining columns with the speaking variable names extracted from "features.txt".
We add the subject and the activities to the two X-tables to have a complete set of measures. The index of activities are replaced by their speaking names of activity_labels.

Finally we merge the two data.frames into a single data.frame with the cbind-command.

The final result is stored in the X_complete data.frame. We have now the tidy data set of raw data.

To compute the mean of the kept variables, the aggregate function applyed to a formulae ist used. The result of the aggregation is stored into the "res.txt"-file of the working directory.

