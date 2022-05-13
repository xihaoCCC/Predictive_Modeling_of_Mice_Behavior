## Author: Handing Zhang
## Purpose of the script: 1. Read in the original data.
##                        2. Basic data wrangling.


## Sourcing this script, one should have all data as data frames in the environment.
## Naming Protocol:            "First Letter of the folder"_"Last three digits of the number of the mouse"
## In each of the dataframe:   the first two columns: Response Y
##                             the rest of the columns: Predictor X

# Loading packages. ####
pacman::p_load(R.matlab, tidyverse, magrittr, mice, reshape, stringr)


## Zero Maze ####

## Find all mice names in Zero-Maze folder.
mice_name_Z <- list.files("data/Zero_Maze/", pattern = "-*")


## A for loop reading in all the data for zero maze experiment for each mouse in the list.
## Combine the bh and zs for each to be the final dataset for each mouse in the experiment.
for (i in 1:length(mice_name_Z)){
  
  filename_bh <- paste0("data/Zero_Maze/", mice_name_Z[i],  "/Day_1/Trial_001_0/binned_behavior.mat")
  filename_zs <- paste0("data/Zero_Maze/", mice_name_Z[i],  "/Day_1/Trial_001_0/binned_zscore.mat")
  
  # data
  temp <- cbind(as.data.frame(t(readMat(filename_bh)[[1]])), as.data.frame(readMat(filename_zs)[[1]]))
  
  # name of the data(mouse name)
  mouseN <- mice_name_Z[i]
  # Rename
  name <- paste0("Z_", substr(mouseN, nchar(mouseN) - 2, nchar(mouseN)))
  dimnames(temp)[[2]][1:2] <- c("Y1", "Y2")
  temp %<>% 
    rename_at(vars(starts_with("V")), funs(str_replace(., "V", replacement = "X")))
  
  assign(name, temp)
  
  # remove temp from environment
  rm("temp")
}



## Direct Interact ####

## Find all mice names in Direct Interact folder.
mice_name_D <- list.files("data/Dir_Interact/", pattern = "-*")


## A for loop reading in all the data for Direct Interact experiment for each mouse in the list.
## Combine the bh and zs for each to be the final dataset for each mouse in the experiment.
for (i in 1:length(mice_name_D)){
  
  filename_bh <- paste0("data/Dir_Interact/", mice_name_Z[i],  "/Day_1/Trial_002_0/binned_behavior.mat")
  filename_zs <- paste0("data/Dir_Interact/", mice_name_Z[i],  "/Day_1/Trial_002_0/binned_zscore.mat")
  
  # data
  temp <- cbind(as.data.frame(t(readMat(filename_bh)[[1]])), as.data.frame(readMat(filename_zs)[[1]]))
  
  # name of the data(mouse name)
  mouseN <- mice_name_D[i]
  # Rename
  name <- paste0("D_", substr(mouseN, nchar(mouseN) - 2, nchar(mouseN)))
  dimnames(temp)[[2]][1:2] <- c("Y1", "Y2")
  temp %<>% 
    rename_at(vars(starts_with("V")), funs(str_replace(., "V", replacement = "X")))
  
  assign(name, temp)
  
  # remove temp from environment
  rm("temp")
}




## Opposite Sex ####

## Find all mice names in Opposite Sex folder.
mice_name_O <- list.files("data/Dir_Interact/", pattern = "-*")


## A for loop reading in all the data for Opposite Sext experiment for each mouse in the list.
## Combine the bh and zs for each to be the final dataset for each mouse in the experiment.
for (i in 1:2){
  
  filename_bh <- paste0("data/Opp_Sex/", mice_name_Z[i],  "/Day_1/Trial_002_0/binned_behavior.mat")
  filename_zs <- paste0("data/Opp_Sex/", mice_name_Z[i],  "/Day_1/Trial_002_0/binned_zscore.mat")
  
  # data
  temp <- cbind(as.data.frame(t(readMat(filename_bh)[[1]])), as.data.frame(readMat(filename_zs)[[1]]))
  
  # name of the data(mouse name)
  mouseN <- mice_name_O[i]
  # Rename
  name <- paste0("O_", substr(mouseN, nchar(mouseN) - 2, nchar(mouseN)))
  dimnames(temp)[[2]][1:2] <- c("Y1", "Y2")
  temp %<>% 
    rename_at(vars(starts_with("V")), funs(str_replace(., "V", replacement = "X")))
  
  assign(name, temp)
  
  # remove temp from environment
  rm("temp")
}

for (i in 3:6){
  
  filename_bh <- paste0("data/Opp_Sex/", mice_name_Z[i],  "/Day_2/Trial_002_0/binned_behavior.mat")
  filename_zs <- paste0("data/Opp_Sex/", mice_name_Z[i],  "/Day_2/Trial_002_0/binned_zscore.mat")
  
  # data
  temp <- cbind(as.data.frame(t(readMat(filename_bh)[[1]])), as.data.frame(readMat(filename_zs)[[1]]))
  
  # name of the data(mouse name)
  mouseN <- mice_name_O[i]
  # Rename
  name <- paste0("O_", substr(mouseN, nchar(mouseN) - 2, nchar(mouseN)))
  dimnames(temp)[[2]][1:2] <- c("Y1", "Y2")
  temp %<>% 
    rename_at(vars(starts_with("V")), funs(str_replace(., "V", replacement = "X")))
  
  
  assign(name, temp)
  
  # remove temp from environment
  rm("temp")
}



# Clear Environment, leaving final datasets we need. ####
rm(list= ls()[!(ls() %in% c("Data_1", "Data_2", "D_409", "D_412", "D_414", "D_416", "D_417", "D_418", "O_409",
                            "O_412", "O_414", "O_416", "O_417", "O_418", "Z_409", "Z_412", "Z_414", "Z_416", "Z_417", "Z_418", "Z_251", "Z_254",
                            "Z_255", "Z_256", "Z_257", "Z_258", "Z_274"))])


