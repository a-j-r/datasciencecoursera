#  Code Book

## Study design
The source data set used here was collected by Reyes-Ortiz, Anguita, Ghio, and Oneto from the Smartlab Non Linear Complex Systems Laboratory in Genoa, Italy and represents data from accelerometers and gyroscope of the Samsung Galaxy S 2 (see [1], [2]). The data set archive has been downloaded from [3]. The following description of the data can be found in [2]:
“The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.”
Further details of the original study design can be obtained in the cited web source.

The following steps are executed to tidy up the data and create a second aggregated data set:
1. The train and the test data set are completed with a subject and an activity row.
1. The train and the test data sets are merged to one data set.
2. Only measurements on the mean and standard deviation for each measurement are retained. 
3. Descriptive activity names are used in the resulting data set
4. Cleaned up labels of the variables are introduced 
5. From the data set in step 4, for each activity and subject the average of the measurement are computed and stored in a second tidy dataset. 


##Variables

* subject: Itentifier of the person who carried out the experiment, number from 1 to 30.
* activity: 6 activities of the subjects: walking, walking upstairs, walking downstairs, sitting, standing, laying.
All measurement are taken from the above cited source. For each measurement the mean and standard deviation (std) are kept, other measurement are discarted. If appropriate the three dimensions (XYZ) are measured.
Measurements are taken in the time domain and their labels start with a t, the derived frequency measurements start with the letter f. Thus a variable name may look like tbodyAcc-mean()-X where the first letter indicate time or frequency, the second part the  type of measurement, the third is either mean or std, and the fourth the dimension (X, Y or Z) if it is not a camputed magnitude. The measurement units are not clearly specified in the original source. It is only said, that the accelometer (Acc) measured linear acceleration and the gyroscope (Gyr) angular velocity.
The following measures (mean and std) are retained in the tidy dataset:
* tBodyAcc: body acceleration, subtracting the gravity from the total acceleration, in X, Y and Z.
* tGravityAcc: gravity acceleration, subtracting the gravity from the total acceleration, in X, Y and Z.. 
* tBodyAccJerk: gravity acceleration with jerk signal, , in X, Y and Z..
* tBodyGyro: angular velocity vector measurement for the window sample, in X, Y and Z..
* tBodyGyroJerk: angular velocity vector measurement with jerk, in X, Y and Z..
* tBodyAccMag: magnitude of the three dimensional signals.
* tGravityAccMag: magnitude of the gravity acceleration dimensional signals. 
* tBodyAccJerkMag: magnitude of the body acceleration dimensional signal with jerk. 
* tBodyGyroMag: magnitude of the dimensional velocity signal. 
* tBodyGyroJerkMag: magnitude of the dimensional velocity signal jerk. 
* fBodyAcc: Fast Fourrier Transformation (FFT) of the body acceleration measure, in X, Y and Z..
* fBodyAccJerk: FFT of the body acceleration measure with jerk, in X, Y and Z..
* fBodyGyro: FFT of the angular velocity measure, in X, Y and Z..
* fBodyAccMag: FFT of the magnitude of the three dimensional signals, in X, Y and Z..
* fBodyAccJerkMag: : FFT of the magnitude of the three dimensional signals with jerk.
* fBodyGyroMag: FFT of the magnitude of the three dimensional angular velocity signal.
* fBodyGyroJerkMag: : FFT of the magnitude of the three dimensional angular velocity signal with jerk.



##References

[1] Anguita, D., A. Ghio, L. Oneto, X. Parra and J. L. Reyes-Ortiz (2012): Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[3] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


