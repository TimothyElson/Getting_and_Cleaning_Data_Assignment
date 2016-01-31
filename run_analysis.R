#####This is the R code for the Getting and Cleaning data project.
###The dplyr package is used in this code, so must be installed if you do not already have it.
##Assumes the unzipped UCI HAR Dataset is in your working directory as per the assignment instructions.

library(dplyr)

####### 1. Merges the training and the test sets to create one data set.#######
#read the test data files
x <-  read.table("./UCI HAR Dataset/test/X_test.txt") 
st <-  read.table("./UCI HAR Dataset/test/subject_test.txt") ## subject identifier
tlb <-  read.table("./UCI HAR Dataset/test/y_test.txt")
#rename subject and activity headings and combines into one table
tlb <- rename(tlb, ActivityId = V1) # renames the column heading
st <- rename(st, SubjectId = V1) # renames the column heading
test_set <- tbl_df(cbind(tlb, st, x)) ##combinse the subject, activity and data

#read the train data files
xt <-  read.table("./UCI HAR Dataset/train/X_train.txt") 
stt <-  read.table("./UCI HAR Dataset/train/subject_train.txt")
tlbt <-  read.table("./UCI HAR Dataset/train/y_train.txt")
#rename subject and activity headings and combines into one table
stt <- rename(stt, SubjectId = V1) # renames the column heading
tlbt <- rename(tlbt, ActivityId = V1) # renames the column heading
train_set <- tbl_df(cbind(tlbt, stt, xt)) ##combinse the subject, activity and data

##Completes step one by combining the test and traing data sets
data_set <- rbind(train_set, test_set) 

####### 2.Extracts only the measurements on the mean and standard deviation for each measurement.#######
# reads the features file into R
features <-  read.table("./UCI HAR Dataset/features.txt")

##vector that identifies all means and std in the features file
list <- grep("mean[^F]*$|std", features$V2) ##pulls out only those measures with means and standard diviations
columns_needed <- features[list, ] ##lists the columns needed

##uses the columns needed to select on the data specified in step two
data_set2 <- select(data_set, ActivityId, SubjectId,columns_needed[,1]+2) ##gets only the columns needed to account for the first two columns

####### 3. Uses descriptive activity names to name the activities in the data set. ######## 
#reads the activity labels file into R
activity_labels <-  read.table("./UCI HAR Dataset/activity_labels.txt")
## renames the activity names V2 to activity_name
activity_labels <- rename(activity_labels, ActivityName = V2) 
##merging the data together to create a data set with the activies names in finishing step 3
data_set_act <- merge(data_set2, activity_labels, by.x = "ActivityId", by.y = "V1")

####### 4. Appropriately labels the data set with descriptive variable names. #######
#Adds a column V3 to the columns needed dataset where all the () and _ charaters are removed to make all lower case variable names
columns_needed <- mutate(columns_needed, V3 = paste0(gsub("\\()|\\-","",V2)))
#Renames the data_set_act names from columns 3 to 68 thus completing step 4
names(data_set_act)[3:68] <- columns_needed[,3]

####### 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. #######
#This select removes the ActivityID from the dataset
data_set_act <- select(data_set_act, -ActivityId)
#The group the data by ActivityName and SubjectID
data_set_act2 <- group_by(tbl_df(data_set_act), ActivityName, SubjectId)

##Below is the final tidy data set with the mean of each variable for every subject activity pair
FinalDataSet <- summarise_each(data_set_act2, funs(mean))

###Saves the final tidy dataset into your working directory
write.table(FinalDataSet, file = "Getting_and_Cleaning_Data_Final_Tidy_Data.txt",row.name=FALSE)

#print the final tidy data set
FinalDataSet
