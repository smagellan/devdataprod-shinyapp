library(shiny);
library(caret);
library(rpart);
library(randomForest);


testData  <- read.csv('pml-testing.csv',  na.strings=c("NA","#DIV/0!", ""));
testData  <- testData[,colSums(is.na(testData)) == 0];
irreleventIdxs <- grep("(*timestamp*)|(user_name)|(*_window)|(X)", names(testData));
testData    <- testData[, -irreleventIdxs];


load("modelObjectState.rda");
tst <- predict(modelObject, newdata = testData[c(1, 2), ]);
print(paste(tst, sep=", "));
print(as.character.factor(tst));
print(as.character(tst))

shinyServer(function(input, output) {    
    answers <- reactive({ predict(modelObject, newdata = testData[input$samplePositions, ]) });
    output$answersData <- renderText( as.character(answers()) );
});