# Xihao Cao
# Group 9
# 2022/04/07
# This file reads the mouse data into data_frame for the later use.



# import
library(R.matlab)
library(tidyverse)
library(eply)


# Read the raw data, which are in matlab format, the result is a list
# containing 13 elements that are data_frames of each mouse.
ID <- c("608034_409", "608102_412", "608102_414", "608103_416", "608103_417", "608103_418",
        "616669_251", "619539_256", "619539_257", "619539_258", "619541_274", "619542_254",
        "619542_255")
name <- c("Z_409", "Z_412", "Z_414", "Z_416", "Z_417", "Z_418", "Z_251", "Z_256", "Z_257",
          "Z_258", "Z_274", "Z_254", "Z_255")
data_list <- list()

for (i in 1:13) {
  b_file <- str_c("data/Zero_Maze/", ID[i], "/Day_1/Trial_001_0/binned_behavior.mat", sep = "")
  z_file <- str_c("data/Zero_Maze/", ID[i], "/Day_1/Trial_001_0/binned_zscore.mat", sep = "")
  b_temp <- readMat(b_file)[[1]]
  z_temp <- readMat(z_file)[[1]]
  data_list[[name[i]]] <- mutate(as.data.frame(z_temp), B1 = b_temp[1,], 
                                 B2 = b_temp[2,], .before = 1)
}



