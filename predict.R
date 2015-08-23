library(shiny);
library(caret);
library(rpart);
library(randomForest);



testData  <- read.csv('pml-testing.csv',  na.strings=c("NA","#DIV/0!", ""));
testData  <- testData[,colSums(is.na(testData)) == 0];
irreleventIdxs <- grep("(*timestamp*)|(user_name)|(*_window)|(X)", names(testData));
testData    <- testData[, -irreleventIdxs];

load("modelObjectState.rda");

answers <- predict(modelObject, newdata = testData[2, ]);
print(answers);