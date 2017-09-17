# Course3_Assignment
The programming Assignment of Course 3 "Getting and Cleaning data

dataSet2.txt contains the tidy dataSet and may be read into r by using the read.table function (headers = TRUE).

The script for the analysis is included in file r_analysis.r. The way it works :

First it produces a  dataset containing data of “test” group, then  produces a dataset containing data of “train” group and finally merge the two datasets  (append one to the other) resulting in a new unifieddataset.

Once the unified dataset was produced ,Means and Std deviations are extracted and stored in “means” and “stds” data frames accordingly. 

Variables of unified data set were named appropriately and activity codes are replaced by activity descriptions .

The process for producing the two datasets to be merged consists of the following steps: 

DATA LOADING

All necessary data IS loaded from downloaded data set.
1.descriptions of measurements into data frame “features”  
2.ids of “Test” group into data frame “testSubject
3.ids of “Train” group into data frame “trainSubject
4.measurements of “Test” group into data frame “testX”
5.activities of “Test” group into data frame “testY”
6.measurements of “Train” group into data frame “trainX”
7.activities of “Train” group into data frame “trainY”

CONSTRUCTION OF TRAIN AND TEST  DATA SETS

1.The Test data set is created by binding  “”testSubject”,”testY”,”testX”, data frames into data frame “test”
2.The Train data set is created by binding  ”trainSubject”,”trainY”,”trainX”, data frames into data frame “train”

CONSTRUCTION OF UNIFIED DATA SET AND EXTRACTION OF MEANS AND STD 

1.“test”  and “train” data frames are merged to create one unified data set named “dataSet”
2.Indices of dataSet variables that contain the string “mean” are storeD in “m_ind”
3.”m_ind” is used to extract variables containing the string “mean” in their name and store them in data frame “means”
4.Indices of dataSet variables that contain the string “std” are stored in “s_ind”
5.”s_ind” is used to extract variables containing the string “std” in their name and store them in data frame “std”
6.Activity codes are with activity names
7.Variables of "dataSet" are given descriptive names

CREATION OF AGGREGATED DATA SET

1.Aggregate “dataSet” per subject and activity calculating the mean of measurements . The aggregated dataset is stored in data frame  dataSet2  
 
