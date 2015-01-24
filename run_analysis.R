################################################################################################
## Course Project: Getting and Cleaning Data                                                  ##
##                                                                                            ##
## You should create one R script called run_analysis.R that does the following.              ##
## 1. Merges the training and the test sets to create one data set.                           ##
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. ## 
## 3. Uses descriptive activity names to name the activities in the data set                  ##
## 4. Appropriately labels the data set with descriptive variable names.                      ##
## 5. From the data set in step 4, creates a second, independent tidy data set with the       ##
##    average of each variable for each activity and each subject.                            ##
## Please upload the tidy data set created in step 5 of the instructions. Please upload your  ##
## data set as a txt file created with write.table() using row.name=FALSE                     ##
################################################################################################

# Check required R libraries

if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("reshape2")) {
        install.packages("reshape2")
}

if (!require("dplyr")) {
        install.packages("dplyr")
}

# Load required R libraries in Workspace

library("data.table")
library("reshape2")
library("dplyr")


# set current working directory
path <- getwd()


# download the file 'UCI CHAR Dateset' and save it to 'Dataset.zip'
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(path)) {dir.create(path)}
download.file(url, file.path(path, f))


# record the time and date that the UCI CHAR Dataset was downloaded
dateDownloaded <- date()
dateDownloaded
# [1] "Sat Jan 17 14:07:26 2015"


# unzip the Dataset.zip file and save it to the current working directory
executable <- file.path("C:", "Program Files (x86)", "7-Zip", "7z.exe")
parameters <- "x"
cmd <- paste(paste0("\"", executable, "\""), parameters, paste0("\"", file.path(path, f), "\""))
system(cmd)
 

# create a path for folder 'UCI HAR Dataset' in Dataset.zip
pathIn <- file.path(path, "UCI HAR Dataset")
list.files(pathIn, recursive=TRUE)


# read the training subject, activity and data files
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")


# read the test subject, activity and data files
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


# 1. Merges the training and the test sets to create one data set. 
subject_set <- rbind(subject_train, subject_test)

# setnames(x, old, new)
setnames(subject_set, "V1", "subject")

# combining objects by rows
activity_label <- rbind(y_train, y_test)

# setnames(x, old, new)
setnames(activity_label, "V1", "activityNum")

# combining objects by rows
dt <- rbind(X_train, X_test)

subject_set <- cbind(subject_set, activity_label)
dt <- cbind(subject_set, dt)

# convert data.frame to data.table
dt <- data.table(dt)

#sorts data.table 'dt' and marks it as sorted
setkey(dt, subject, activityNum)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# read the features lists file
features <- fread(file.path(pathIn, "features.txt"))
setnames(features, names(features), c("featureNum", "featureName"))

# subset only measurements for the mean and standard deviation.
features <- features[grepl("mean|std", featureName)]

features$featureCode <- features[, paste0("V", featureNum)]

select <- c(key(dt), features$featureCode)
dt <- dt[, select, with=FALSE]


# 3. Uses descriptive activity names to name the activities in the data set 

# read the activity labels files
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

setnames(activity, names(activity), c("activityNum", "activityName"))


# 4. Appropriately labels the data set with descriptive variable names. 
dt <- merge(dt, activity, by="activityNum", all.x=TRUE)

# sorts a data.table and marks it as sorted
setkey(dt, subject, activityNum, activityName)

# melt the data.table to reshape it from a short and wide format to a tall and narrow format.
dt <- data.table(melt(dt, key(dt), variable.name = "featureCode"))

# merge activity name
dt <- merge(dt, features[, list(featureNum, featureCode, featureName)], by="featureCode", all.x=TRUE)

# create a new variable, 'activity' that is equivalent to 'activityName'as a factor class. 
dt$activity <- factor(dt$activityName)

# create a new variable, 'feature' that is equivalent to 'featureName'as a factor class.
dt$feature <- factor(dt$featureName)

# seperate features from  featureName  using the helper function  grepthis .
grepthis <- function (regex) {
        grepl(regex, dt$feature)
}

# features with 1 category 
dt$jerkFeature <- factor(grepthis("Jerk"), labels = c(NA, "Jerk")) 
dt$magnitudeFeature <- factor(grepthis("Mag"), labels = c(NA, "Magnitude")) 


# features with 2 categories 
p <- matrix(1:2, nrow=2) 

grepped <- c(grepthis("^t"), grepthis("^f")) 
mp <- matrix(grepped, ncol=nrow(p)) 
dt$domainFeature <- factor(mp %*% p, labels = c("Time", "Frequency"))


grepped <- c(grepthis("Acc"), grepthis("Gyro")) 
mp <- matrix(grepped, ncol=nrow(p)) 
dt$instrumentsFeature <- factor(mp %*% p, labels = c("Accelerometer", "Gyroscope")) 


grepped <- c(grepthis("BodyAcc"), grepthis("GravityAcc")) 
mp <- matrix(grepped, ncol=nrow(p)) 
dt$accelerationFeature <- factor(mp %*% p, labels = c(NA, "Body", "Gravity")) 


grepped <- c(grepthis("mean()"), grepthis("std()")) 
mp <- matrix(grepped, ncol=nrow(p)) 
dt$variableFeature <- factor(mp %*% p, labels=c("Mean", "Standard Deviation")) 

# features with 3 categories 
p <- matrix(1:3, nrow=3) 

grepped <- c(grepthis("-X"), grepthis("-Y"), grepthis("-Z")) 
mp <- matrix(grepped, ncol = nrow(p)) 


dt$axisFeature <- factor(mp %*% p, labels = c(NA, "X", "Y", "Z")) 

 
# Check to make sure all possible combinations of feature  are accounted for 
# by all possible combinations of the factor class variables.
r1 <- nrow(dt[, .N, by=c("feature")])
r2 <- nrow(dt[, .N, by=c("jerkFeature", "magnitudeFeature", "domainFeature", "instrumentsFeature", "accelerationFeature", "variableFeature", "axisFeature")])
r1 == r2


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject 
 
setkey(dt, subject, activity, domainFeature, accelerationFeature, instrumentsFeature, jerkFeature, magnitudeFeature, variableFeature, axisFeature) 
TidyDataSet <- dt[, list(count = .N, average = mean(value)), by = key(dt)] 


# saving the tidy data set to 'TidyDataSet.txt file.
f <- file.path(path, "TidyDataSet.txt")
write.table(TidyDataSet, f, quote = FALSE, sep = "\t", row.names = FALSE)

############################### end of code ##############################