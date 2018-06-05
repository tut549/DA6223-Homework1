#Homework 1 Tools and Techniques
#By:Nathan Shepherd @01167066 tut549

#Load libraries
library(dplyr)

#Reading in the data sets and features
X_train = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/train/X_train.txt", sep="")
y_train = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/train/y_train.txt")
X_test = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/test/X_test.txt", sep="")
y_test = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/test/y_test.txt")

features = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/features.txt")

#Getting rid of extra column in features
features$V1 = NULL

#Merging X training and test sets, setting column names
merged_x_tt = rbind(X_train, X_test)
colnames(merged_x_tt) = features$V2

#Merging Y training and test sets, setting column name
merged_y_tt = rbind(y_train, y_test)
colnames(merged_y_tt) = "Response"

#Merging new data sets
master_merge = cbind(merged_x_tt, merged_y_tt)

#Extracting mean and std
mean_std = master_merge[, c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,
                    266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,
                    529:530,539,542:543,552,555:561)]

#Reading and checking labels
activity_labels = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/activity_labels.txt")

#Function for recoding response
recode = function(x) {
  if (x == 1) 
    return("WALKING") else
  if (x == 2) 
    return("WALKING_UPSTAIRS") else
  if (x == 3) 
    return("WALKING_DOWNSTAIRS") else
  if (x == 4) 
    return("SITTING") else
  if (x == 5) 
    return("STANDING") else
  if (x == 6) return("LAYING") else
    return("error")
}  
 
#Recoding Response variable
master_merge$Response = sapply(master_merge$Response, recode)
master_merge$Response

#Reading subject data set, merge together
subject_train = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/train/subject_train.txt") 
subject_test = read.table("C:/Users/Nathan/Desktop/Tools and Techniques/HW1/UCI HAR Dataset/test/subject_test.txt")
merged_subject = rbind(subject_train, subject_test)
colnames(merged_subject) = "Subject"

#Merge with master_merge
master_data = cbind(master_merge, merged_subject)

#Making column names unique to avoid summarise_all error in next step
valid_column_names <- make.names(names=names(master_data), unique=TRUE, allow_ = TRUE)
names(master_data) <- valid_column_names

#Getting averages
averages = master_data %>% group_by(Subject, Response) %>% summarise_all(mean)

#Making new table
write.table(averages, "C:/Users/Nathan/Desktop/Tools and Techniques/HW1/averages.txt", row.names = FALSE)










