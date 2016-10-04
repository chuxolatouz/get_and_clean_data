#-----------------Load Data to Environment---------------
#-----------------Jesus Rincon--------------------------
if (!file.exists("ds.csv")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ",
                "ds.csv", method="curl")
}  
#------------------Uncompress File----------------------
if (!file.exists("UCI HAR Dataset")) { 
  unzip("ds.csv") 
}
#------------------Set Working directory----------------
setwd("./UCI HAR Dataset")

#-----------------Load Train Data-------------------------

X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#----------------Load Test Data--------------------------

X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

#-------------------Find features----------------------

activities <- read.table("activity_labels.txt")

features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
mn_sd <- grep("-(mean|std)\\(\\)", features[, 2])
feat_ms <- features[mn_sd,2]
feat_ms = gsub("-mean", "mean", feat_ms) 
feat_ms = gsub("-std", "std", feat_ms)

#----------------Merging Train & Test Data----------------

train <- cbind(subject_train, y_train, X_train[mn_sd])
test <- cbind( subject_test, y_test ,X_test[mn_sd])

df <- rbind(train, test)

colnames(df) <- c("subject", "activity", feat_ms)
#-----------------Add activities names to data.frame------
df$activity <- activities[df$activity, 2]

#--------Creating tidy_data with the mean of the wanted columns-----
tidy_data <- df[-c(1,2)]
tidy_data <- colMeans(tidy_data)
tidy_data <- as.data.frame(tidy_data)
#names(tidy_data) <- feat_ms
#----------write tidy_data in text file------------
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, col.names = FALSE)
