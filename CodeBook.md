Codebook
========
Codebook was generated on Sat Jan 17 14:07:26 2015 during the same process that generated the dataset. 

Variable list and descriptions
------------------------------
        
Variable name       | Description
--------------------|------------
subject             | Subject : ID that performs the activity for each window sample. From 1 to 30.
activity            | Activity: Activity names
activityName        | Name    : Column name descriptive activity names to name the activities in the data set
activityNum         | Number  : Descriptive activity names to name the activities in the data set
feature             | feature : Check to ensure all possible combinations of feature are accounted for
featureCode         | Name    : Column name of merge activity data set
featureName         | Name    : Column name of merge activity data set
featureNum          | Number  : Column Number of merge activity data set
axisFeature         | Average : Average for vector 3-axial signals in the TidyDataSet 
jerkFeature         | Average : Average for jerk feature in the (FFT) in TidyDataSet
domainFeature       | Average : Average for frequency domain signals in TidyDataSet
magnitudeFeature    | Average : Average for the magnitude of the Euclidean norm in TidyDataSet 
variableFeature     | Average : Average for of variable for each activity in TidyDataSet
accelerationFeature | Average : Average for instrument in TidyDataset
instrumentsFeature  | Average : Average for instrument in TidyDataSet 
value               | value   : Values of the mean

Dataset structure
-----------------
        
```r
str(dt)
```
```
## Classes 'data.table' and 'data.frame':        813621 obs. of  16 variables:
## $ featureCode        : chr  "V121" "V121" "V121" "V121" ...
## $ subject            : int  1 1 1 1 1 1 1 1 1 1 ...
## $ activityNum        : int  6 6 6 6 6 6 6 6 6 6 ...
## $ activityName       : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
## $ value              : num  0.03155 0.00926 -0.01342 -0.02496 -0.02955 ...
## $ featureNum         : int  121 121 121 121 121 121 121 121 121 121 ...
## $ featureName        : chr  "tBodyGyro-mean()-X" "tBodyGyro-mean()-X" "tBodyGyro-mean()-X" "tBodyGyro-mean()-X" ...
## $ activity           : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
## $ feature            : Factor w/ 79 levels "fBodyAcc-mean()-X",..: 56 56 56 56 56 56 56 56 56 56 ...
## $ jerkFeature        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 1 1 ...
## $ magnitudeFeature   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 1 1 1 1 ...
## $ domainFeature      : Factor w/ 2 levels "Time","Frequency": 1 1 1 1 1 1 1 1 1 1 ...
## $ instrumentsFeature : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
## $ accelerationFeature: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
## $ variableFeature    : Factor w/ 2 levels "Mean","Standard Deviation": 1 1 1 1 1 1 1 1 1 1 ...
## $ axisFeature        : Factor w/ 4 levels NA,"X","Y","Z": 2 2 2 2 2 2 2 2 2 2 ...
## - attr(*, ".internal.selfref")=<externalptr> 
## - attr(*, "sorted")= chr  "subject" "activity" "domainFeature" "accelerationFeature" ...
```

List the key variables in the data table
----------------------------------------
             
```r
key(dt)
```
```
## [1] "subject"             "activity"            "domainFeature"       "accelerationFeature" "instrumentsFeature" 
## [6] "jerkFeature"         "magnitudeFeature"    "variableFeature"     "axisFeature"        
```

Show a few rows of the dataset
------------------------------

```r
dt
```
```
##        featureCode subject activityNum     activityName       value featureNum               featureName         activity
##     1:        V121       1           6           LAYING  0.03155195        121        tBodyGyro-mean()-X           LAYING
##     2:        V121       1           6           LAYING  0.00925711        121        tBodyGyro-mean()-X           LAYING
##     3:        V121       1           6           LAYING -0.01342439        121        tBodyGyro-mean()-X           LAYING
##     4:        V121       1           6           LAYING -0.02495981        121        tBodyGyro-mean()-X           LAYING
##     5:        V121       1           6           LAYING -0.02955039        121        tBodyGyro-mean()-X           LAYING
##    ---                                                                                                                   
## 813617:        V517      30           2 WALKING_UPSTAIRS -0.28755322        517 fBodyBodyAccJerkMag-std() WALKING_UPSTAIRS
## 813618:        V517      30           2 WALKING_UPSTAIRS -0.32337205        517 fBodyBodyAccJerkMag-std() WALKING_UPSTAIRS
## 813619:        V517      30           2 WALKING_UPSTAIRS -0.32630192        517 fBodyBodyAccJerkMag-std() WALKING_UPSTAIRS
## 813620:        V517      30           2 WALKING_UPSTAIRS -0.37807723        517 fBodyBodyAccJerkMag-std() WALKING_UPSTAIRS
## 813621:        V517      30           2 WALKING_UPSTAIRS -0.28722743        517 fBodyBodyAccJerkMag-std() WALKING_UPSTAIRS
```

Summary of variables
--------------------
        
```r
summary(dt)
```
```
## featureCode           subject       activityNum                activityName        value            featureNum    featureName       
## Length:813621      Min.   : 1.00   Min.   :1.000   LAYING            :153576   Min.   :-1.00000   Min.   :  1.0   Length:813621     
## Class :character   1st Qu.: 9.00   1st Qu.:2.000   SITTING           :140383   1st Qu.:-0.97211   1st Qu.:122.0   Class :character  
## Mode  :character   Median :17.00   Median :4.000   STANDING          :150574   Median :-0.39935   Median :254.0   Mode  :character  
##                    Mean   :16.15   Mean   :3.625   WALKING           :136038   Mean   :-0.43397   Mean   :262.2                     
##                    3rd Qu.:24.00   3rd Qu.:5.000   WALKING_DOWNSTAIRS:111074   3rd Qu.:-0.04308   3rd Qu.:425.0                     
##                    Max.   :30.00   Max.   :6.000   WALKING_UPSTAIRS  :121976   Max.   : 1.00000   Max.   :552.0                     
##                                                                                                                                     
##               activity                       feature       jerkFeature    magnitudeFeature    domainFeature        instrumentsFeature
## LAYING            :153576   fBodyAcc-mean()-X    : 10299   NA  :494352   NA       :587043   Time     :411960   Accelerometer:494352  
## SITTING           :140383   fBodyAcc-mean()-Y    : 10299   Jerk:319269   Magnitude:226578   Frequency:401661   Gyroscope    :319269  
## STANDING          :150574   fBodyAcc-mean()-Z    : 10299                                                                             
## WALKING           :136038   fBodyAcc-meanFreq()-X: 10299                                                                             
## WALKING_DOWNSTAIRS:111074   fBodyAcc-meanFreq()-Y: 10299                                                                             
## WALKING_UPSTAIRS  :121976   fBodyAcc-meanFreq()-Z: 10299                                                                             
##                             (Other)              :751827                                                                             
## accelerationFeature           variableFeature   axisFeature
## NA     :319269      Mean              :473754   NA:226578  
## Body   :411960      Standard Deviation:339867   X :195681  
## Gravity: 82392                                  Y :195681  
##                                                 Z :195681  
```

Save to file
------------

```r
```
f <- file.path(path, "TidyDataSet.txt")
write.table(TidyDataSet, "TidyDataSet.txt", sep="\t") 
```