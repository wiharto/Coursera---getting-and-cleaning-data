
# Import libraries
library(data.table)

# Read all txt files into tables
subject_train = read.table("subject_train.txt", col.names = "SubjectNumber")
x_train = read.table("X_train.txt", sep = "", dec = ".")
y_train = read.table("y_train.txt", col.names = "Activity")

subject_test = read.table("subject_test.txt", col.names = "SubjectNumber")
x_test = read.table("X_test.txt", sep = "", dec = ".")
y_test = read.table("y_test.txt", col.names = "Activity")

## Steps 1 and 2 of the assignment
# Merge all data into 1 data set and
# Extract only the means and std dev of each measurement
combined_train = cbind(subject_train, y_train,
                       x_train[ , c(1:6, 41:46, 81:86, 121:126, 161:166,
                                    201:202, 214:215, 227:228, 240:241,
                                    253:254, 266:271, 345:350, 424:429,
                                    503:504, 529:530, 542:543)])
combined_test = cbind(subject_test, y_test,
                      x_test[ , c(1:6, 41:46, 81:86, 121:126, 161:166, 
                                  201:202, 214:215, 227:228, 240:241, 
                                  253:254, 266:271, 345:350, 424:429, 
                                  503:504, 529:530, 542:543)])
tidy1 = rbind(combined_train, combined_test)

## Step 3 of the assignment
# Assign activities description 
tidy1$Activity = factor(tidy1$Activity, levels = c(1:6),
                           labels = c("Walking", "Walking Upstairs",
                                      "Walking Downstairs", "Sitting",
                                      "Standing", "Laying"))

## Step 4 of the assignment
# Assign column with descriptive variable names
features = read.table("features.txt", sep = "")
features = features[c(1:6, 41:46, 81:86, 121:126, 161:166, 
                      201:202, 214:215, 227:228, 240:241, 
                      253:254, 266:271, 345:350, 424:429, 
                      503:504, 529:530, 542:543), 2]
colnames(tidy1)[c(3:66)] = as.vector(features, mode = "character")



## 5. From the data set in step 4, create new set of tidy data, which 
##    consists of average of each variable for each activity for each
##    subject.

# Convert "combined" data frame into data table
dt = as.data.table(tidy1)

# Find average for each subject for each activity in each variable
tidy2 = dt[ , lapply(.SD, mean), by = .(SubjectNumber, Activity)]

# Write tidy2 dataset in txt file
write.table(tidy2, file = "tidy2.txt", sep = " ", dec = ".", 
            row.names = FALSE)










