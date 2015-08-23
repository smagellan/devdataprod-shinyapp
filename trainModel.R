#!/usr/bin/env r

library(caret);
library(rpart);
#library(rpart.plot);
library(randomForest);

set.seed(42);

trainData <- read.csv("pml-training.csv", na.strings=c("NA","#DIV/0!", ""));
trainData <- trainData[,colSums(is.na(trainData)) == 0];
irreleventIdxs <- grep("(*timestamp*)|(user_name)|(*_window)|(X)", names(trainData));
trainData   <- trainData[, -irreleventIdxs];


testData  <- read.csv('pml-testing.csv',  na.strings=c("NA","#DIV/0!", ""));
testData  <- testData[,colSums(is.na(testData)) == 0];
testData    <- testData[, -irreleventIdxs];



trainIdxs <- createDataPartition(y=trainData$classe, p=0.75, list=FALSE);
subTrain  <- trainData[trainIdxs, ];
modelObject <- randomForest(classe ~. , data=subTrain, method="class");

save(modelObject, file = "modelObjectState.rda");


answers <- predict(modelObject, newdata = testData);
print(answers);
