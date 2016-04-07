library(plyr)

#Step 1
	#read in all the data
	x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
	y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
	subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
	x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
	y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
	subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
	features <- read.table("UCI HAR Dataset/features.txt")
	activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")	
	#Vertically stack the data
	x_combineddata <- rbind(x_train, x_test)
	y_combineddata <- rbind(y_train, y_test)
	subject_combineddata <- rbind(subject_train, subject_test)

#Step 2
	features<-features[, 2]
	features_mean_std <- grepl("mean|std", features)
	x_combineddata <- x_combineddata[, features_mean_std]
	names(x_combineddata)=features[features_mean_std]
	
#Step 3	
	y_combineddata[, 1] <- activity_labels[y_combineddata[, 1], 2]
	names(y_combineddata) <- "Activity"
	
#Step 4
	names(subject_combineddata) <- "Subject"
	combined_data <- cbind(x_combineddata, y_combineddata, subject_combineddata)

#Step 5	
	averages_of_combined_data <- ddply(combined_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))
	write.table(averages_of_combined_data, "averages_of_combined_data.txt", row.name=FALSE)