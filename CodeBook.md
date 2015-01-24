Codebook
========
Codebook was generated on Sat Jan 17 14:07:26 2015 during the same process that generated the dataset. 

Variable list and descriptions
------------------------------
        
Variable name     | Description
------------------|------------
subject           | subject: ID that performs the activity for each window sample. From 1 to 30.
activity          | Activity: 1.WALKING 2.WALKING_UPSTAIRS 3.WALKING_DOWNSTAIRS 4.SITTING 5.STANDING 6.LAYING
activityName      | Name    : Column name descriptive activity names to name the activities in the data set
activityNum       | Number  : Descriptive activity names to name the activities in the data set
feature           | Subset  : Subset of measurements for the mean and standard deviation.
featureCol        | Name    : Column name of merge activity data set
featureName       | Name    : Column name of merge activity data set
featureNum        | Number  : Column Number of merge activity data set
axisFeature       | Average : Average for vector 3-axial signals in the TidyDataSet 
jerkFeature       | Average : Average for jerk feature in the (FFT) in TidyDataSet
domainFeature     | Average : Average for frequency domain signals in TidyDataSet
magnitudeFeature  | Average : Average for the magnitude of the Euclidean norm in TidyDataSet 
variableFeature   | Average : Average for of variable for each activity in TidyDataSet
instrumentsFeature| Average : Average for instrument in TidyDataSet 
value             | value   : Values of the mean

Dataset structure
-----------------
        
```r
str(dt)
```
```
## Classes 'data.table' and 'data.frame':        813621 obs. of  15 variables:
## $ featureCol        : chr  "V1" "V1" "V1" "V1" ...
## $ subject           : int  1 1 1 1 1 1 1 1 1 1 ...
## $ activityNum       : int  1 1 1 1 1 1 1 1 1 1 ...
## $ activityName      : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
## $ value             : num  0.282 0.256 0.255 0.343 0.276 ...
## $ featureNum        : int  1 1 1 1 1 1 1 1 1 1 ...
## $ featureName       : chr  "tBodyAcc-mean()-X" "tBodyAcc-mean()-X" "tBodyAcc-mean()-X" "tBodyAcc-mean()-X" ...
## $ activity          : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
## $ feature           : Factor w/ 79 levels "fBodyAcc-mean()-X",..: 40 40 40 40 40 40 40 40 40 40 ...
## $ jerkFeature       : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 1 1 ...
## $ magnitudeFeature  : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 1 1 1 1 ...
## $ domainFeature     : Factor w/ 2 levels "Time","Frequency": 1 1 1 1 1 1 1 1 1 1 ...
## $ instrumentsFeature: Factor w/ 2 levels "Accelerometer",..: 1 1 1 1 1 1 1 1 1 1 ...
## $ variableFeature   : Factor w/ 2 levels "Mean","Standard Deviation": 1 1 1 1 1 1 1 1 1 1 ...
## $ axisFeature       : Factor w/ 4 levels NA,"X","Y","Z": 2 2 2 2 2 2 2 2 2 2 ...
## - attr(*, ".internal.selfref")=<externalptr> 
## - attr(*, "sorted")= chr "featureCol"
```

List the key variables in the data table
----------------------------------------
             
```r
ls(dt)
```
```
## [1] "activity"     "activityName"     "activityNum"   "axisFeature"   "domainFeature"     
## [6] "feature"      "featureCol"       "featureName"   "featureNum"    "instrumentsFeature"
## [11] "jerkFeature" "magnitudeFeature" "subject"        "value"        "variableFeature"  
```

Summary of variables
--------------------
        
```r
summary(dt)
```
```
## featureCol           subject       activityNum                activityName        value         
## Length:813621      Min.   : 1.00   Min.   :1.000   LAYING            :153576   Min.   :-1.00000  
## Class :character   1st Qu.: 9.00   1st Qu.:2.000   SITTING           :140383   1st Qu.:-0.97211  
## Mode  :character   Median :17.00   Median :4.000   STANDING          :150574   Median :-0.39935  
## Mean   :16.15   Mean   :3.625   WALKING           :136038   Mean   :-0.43397  
## 3rd Qu.:24.00   3rd Qu.:5.000   WALKING_DOWNSTAIRS:111074   3rd Qu.:-0.04308  
## Max.   :30.00   Max.   :6.000   WALKING_UPSTAIRS  :121976   Max.   : 1.00000  

## featureNum    featureName         activity                       feature       jerkFeature  
## Min.   :  1.0   Length:813621      LAYING            :153576   fBodyAcc-mean()-X    : 10299   NA  :494352  
## 1st Qu.:122.0   Class :character   SITTING           :140383   fBodyAcc-mean()-Y    : 10299   Jerk:319269  
## Median :254.0   Mode  :character   STANDING          :150574   fBodyAcc-mean()-Z    : 10299                
## Mean   :262.2                      WALKING           :136038   fBodyAcc-meanFreq()-X: 10299                
## 3rd Qu.:425.0                      WALKING_DOWNSTAIRS:111074   fBodyAcc-meanFreq()-Y: 10299                
## Max.   :552.0                      WALKING_UPSTAIRS  :121976   fBodyAcc-meanFreq()-Z: 10299                
## (Other)              :751827                
## magnitudeFeature    domainFeature        instrumentsFeature           variableFeature   axisFeature
## NA       :587043   Time     :411960   Accelerometer:494352   Mean              :473754   NA:226578  
## Magnitude:226578   Frequency:401661   Gyroscope    :319269   Standard Deviation:339867   X :195681  
## Y :195681  
## Z :195681  


Save to file
------------
```r
# saving the tidy data set to 'TidyDataSet.txt file. 
write.table(TidyDataSet, "TidyDataSet.txt", sep="\t") 
```