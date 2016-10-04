#Codebook

## run_analysis

This script have the next variables inside with a simple description of his content
* `X_train`, `X_test`, `y_train` , `y_test`, `subject_train`, `subject_test` containing the data from the txt files with same names
* `activities` containig the activities and the respective id
* `features` containing the features 
* `mn_sd` containing the number of columns with `mean` or `std` 
* `feat_ms` containing the string of the features selected on mn_sd
* `train` containing the entire train data merged
* `test` containing the entire test data merged
* `df` containing the entire data, product of merge train and test
* `tidy_data` as final the variable with the tidy_data procesed.