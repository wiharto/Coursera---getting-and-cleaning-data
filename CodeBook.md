=====================================================================
Tidy version of Human Activity Recognition Using Smartphones Dataset
=====================================================================
Patricia Wiharto

RStudio - Version 0.99.464 – © 2009-2015 RStudio, Inc.
OS - OSX Version 10.8.5
=====================================================================

==============
Goals
==============
1. Combine the following files (from original data) into 1 big file:
   - subject_train.txt
   - X_train.txt
   - y_train.txt
   - subject_test.txt
   - X_test.txt
   - y_test.txt

2. Create a separate tidy data, which consists of the average of each 
   subject for each activity by each variable.

==============
What was done
==============
1. Created 1 big file called "tidy1" - correspond to goal #1
2. Created 1 file called "tidy2" - correspond to goal #2

==============
Variables
==============
1. SubjectNumber - the number of the subject
2. Activity:
   - walking
   - walking upstairs
   - walking downstairs
   - sitting
   - standing
   - laying
   