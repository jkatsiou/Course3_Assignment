 setwd("/Users/John/Documents/DataScience/UCI HAR Dataset")

 features <- read.table("Features.txt")                                 #read features into R, to be used for naming measurement variables

 testSubject <- read.table("./test/subject_test.txt",)      		#read test subjects info into R
 trainSubject <- read.table("./train/subject_train.txt")                #read train subjects into R

 testX <- read.table("./test/X_test.txt")				#read test measurements into R
 testY <- read.table("./test/Y_test.txt")                  		#read test activities into R
  
 trainX <- read.table("./train/X_train.txt")                            #read train measurements into R
 trainY <- read.table("./train/Y_train.txt")                            #read train activities into R
 
 activityLabels <- read.table("activity_labels.txt")			#read activity labels into R

 test <- cbind(Subject=testSubject$V1,Activity=testY$V1,testX)          #create the 'test' data set by binding all test info together 
 
 train <- cbind(Subject=trainSubject$V1,Activity=trainY$V1,trainX)      #create the 'train' data set by binding all train info together

 dataSet <- rbind(test,train)                  				#append train to test data set to create a unified dataset 																				   
                                                                        #---> this answers part 1 

 m_ind <- grep("mean",features$V2, ignore.case = TRUE, value = FALSE)   #Get the indices of variable names containing the string mean

 means <- dataSet[,c(1,2,m_ind+2)]			            	#Return all rows of "dataSet" but only the variables (columns) 
                                                                        #containing the string mean. ---> This answers part 2
                
 s_ind <- grep("std",features$V2, ignore.case = TRUE, value = FALSE)    #Get the indices of variable names containing the string mean, ignoring case

 stds <- dataSet[,c(1,2,s_ind+2)]			            	#Return all rows of dataSet but only the variables (columns) 
									#containing the string mean. ---> This answers part2

 for (i in 1:6){dataSet$Activity <- gsub(i,activityLabels[i,2],dataSet$Activity)} #Replace Activity codes in "dataSet" with Activity Labels 
                                                                                  # ---> This answers part 3

 names(dataSet) <- c("Subject","Activity",as.character(features$V2))              #naming the variables of "test part" of data set
										  #---> This answers part 4

 names(dataSet) <- gsub("[^[:alnum:][:blank:],+?&/\\-]", "", names(dataSet))      #clean variable names from special characters

 dataSet2 <- aggregate( dataSet[,3:563], dataSet[,1:2], FUN = mean )              #Create 2nd dataSet, which aggregates per 
                                                                                  #Subject & activity (columns 1:2) all 																						  
