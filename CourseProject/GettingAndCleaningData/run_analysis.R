# Analysis of UCI HAR Dataset
# 
# Author: a-j-r
###############################################################################


# Cleaning the workspace to have more memory at disposition.
rm(list = ls())

#
# Downloading and unzipping the input data files.
#
if (!file.exists("./input")) { dir.create("./input")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

destfile <- "./input/UCI HAR Database.zip"

if (!file.exists(destfile)) { download.file(url, destfile)}
unzip("./input/UCI HAR Dataset.zip", exdir="./input")

#
# reading the features and create a filter for the mean and std variables.
#
features <- read.table("input/UCI HAR Dataset/features.txt", quote="\"", as.is=TRUE)
mean_and_std_filter <- grepl("(.*)-(mean|std)\\(\\)(.*)", features[[2]])
mean_and_std_features <- features[[2]][mean_and_std_filter]

#
# Clean up the variable labeles.
# 
# correct labeling of fBodyBody... to fBody... as described in the features_info file.
mean_and_std_features <- gsub("BodyBody", "Body", mean_and_std_features)
# remove useless () for the labeling
mean_and_std_features <- gsub("\\(\\)", "", mean_and_std_features)

# read the test set data (activities, subjects and measurements) and filter them with the created filter-vector.
y_test <- read.table("input/UCI HAR Dataset/test/y_test.txt", quote="\"")
names(y_test) <- "activity"

subject_test <- read.table("input/UCI HAR Dataset/test/subject_test.txt", quote="\"")
names(subject_test) <- "subject"

X_test <- read.table("input/UCI HAR Dataset/test/X_test.txt", quote="\"")[,mean_and_std_filter]
colnames(X_test) <- mean_and_std_features

X_test <- cbind(subject_test, y_test, X_test)

# read the train set data (activities, subjects and measurements) and filter them with the created filter-vector.
y_train <- read.table("input/UCI HAR Dataset/train/y_train.txt", quote="\"")
names(y_train) <- "activity"

subject_train <- read.table("input/UCI HAR Dataset/train/subject_train.txt", quote="\"")
names(subject_train) <- "subject"

X_train <- read.table("input/UCI HAR Dataset/train/X_train.txt", quote="\"")[,mean_and_std_filter]
colnames(X_train) <- mean_and_std_features

X_train <- cbind(subject_train, y_train, X_train)

X_complete <- rbind(X_train, X_test)

# give the activities speaking labels (in lower case and without _)
activity_labels <- read.table("input/UCI HAR Dataset/activity_labels.txt", quote="\"")
activity_labels[[2]] <- gsub("_"," ",tolower(activity_labels[[2]]))
X_complete$activity <- activity_labels[[2]][X_complete$activity]

#aggregate the raw data for each subject and activity with their means.
res <- aggregate(. ~ subject + activity, X_complete, mean)
res <- res[order(res$subject,res$activity),]

#write the result to "res.txt"
write.table(res, "res.txt", row.names=FALSE)


