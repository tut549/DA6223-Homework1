# DA6223 Tools and Techniques Homework 1
Data retrieved from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This script is for the purpose of collecting, manipulating, and cleaning a data set.  This script uses the UCI_HAR data set.  This data set measures smart phone movements based on several variables.  

Here is what the script does:
1. Reads in the x and y training and test sets and features table.  Remove unnecessary 1st column in features read in, just an ID column.  
2. Merges x training and test sets, same with y training and test sets.
3. Use features to label column names for merged x table
4. Label column name for merged y table "Response"
5. Merges previous x and y merges into a master merge
6. Extract mean and std from the master merge
7. Reads in activity_labels to check what labels are
8. Constructs function to recode "Response" column to have appropiate labels from activity_labels
9. Run recode function on the "Response" variable in master_merge
10. Read in subject training and test sets, merge them together and name the column "Subject"
11. Merge recent subject merge with master merge, creates master_data
12. Makes the column names unique to summarise_all can work in the next step
13. Calculating the mean grouping by Subject and Response
14. Takes newly calculated averages and writes new table.
