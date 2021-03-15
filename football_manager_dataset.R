# LOAD LIBRARIES
library(tidyverse)
library(caret)
library(dplyr)


# READ DATA
football_manager_dataset <- read.csv("Desktop\\dataset.csv", header=TRUE)


# DATA CLEANING - CREATE A COLUMN CALLED 'POSITION' TO DENOTE ACTUAL POSITION
pos_att.df <- fm.df[,c(75:89)]
pos_att.df <- data.frame(cbind(pos_att.df, colpos=max.col(pos_col.df)))
pos_att.df$colpos <- factor(pos_att.df$colpos)
levels(pos_att.df$colpos) <- list(Goalkeeper="1", Sweeper="2", Striker="3", AttackingMidCentral="4",
                                  AttackingMidLeft="5", AttackingMidRight="6", DefenderCentral="7",
                                  DefenderLeft="8", DefenderRight="9", DefensiveMidfielder="10",
                                  MidfielderCentral="11", MidfielderLeft="12", MidfielderRight="13",
                                  WingBackLeft="14", WingBackRight="15")
fm <- fm.df[,c(5,10:60)]
fm <- data.frame(cbind(fm, Position=pos_att.df$colpos))


# TRAINING-TEST SPLIT
ind <- createDataPartition(fm$Position, p=0.75, list=FALSE)
fm.train <- fm[ind,]
fm.test <- fm[-ind,]


# GENERATE 'KNN' ML MODEL
model_knn <- train(fm.train[,-53], fm.train[,53], method="knn")


# GENERATE PREDICTION
fm.pred <- predict(model_knn, fm.test[,-53])


# COMPARE RESULTS
confusionMatrix(fm.predict, fm.test[,53])