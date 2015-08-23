library(shiny);

testData  <- read.csv('pml-testing.csv',  na.strings=c("NA","#DIV/0!", ""));
dataLength <- nrow(testData);
#yep, do not allow all available data
choices <- list("1" = 1, "2" = 2, "3" = 3, "4" = 4, "5" = 5, "6" = 6, "7" = 7, "8" = 8, "9" = 9, "10" = 10);

print(dataLength);
shinyUI(pageWithSidebar(
    # Application title
    headerPanel("Let's predict exercise type"),
    
    sidebarPanel(
        checkboxGroupInput("samplePositions", 
                           label = h3("Select sample numbers to predict"), 
                           choices = choices,
                           selected = 1),
        textOutput("answersData")
    ),    
    mainPanel(
        p("Six young health participants were asked to perform one set of 10 repetitions of the Unilateral Dumbbell Biceps Curl in five different fashions:"),
                
        span("- exactly according to the specification (Class A), "), br(),
        span("- throwing the elbows to the front       (Class B), "), br(),
        span("- lifting the dumbbell only halfway      (Class C), "), br(),
        span("- lowering the dumbbell only halfway     (Class D)  "), br(),
        span("- and throwing the hips to the front     (Class E). "), br(),            
        span("- Class A corresponds to the specified execution of the exercise, while the other 4 classes correspond to common mistakes."), br(),
        br(),
        span("Full description on dataset available "),
        a("here", href="(http://groupware.les.inf.puc-rio.br/har#weight_lifting_exercises)"), br(), br(),
        span("Model was pre-trained, it is randomForest-based one. Model's consciousness was then hibernated using state of the art cryo-chamber aka R's save function."), br(),
        span("Some person was tricky enough to restore model, and here it is, right in your browser"), br(),
        span("Now you have unique chance to test who is who using model's wisdom: "), br(),
        span("there are checkboxes at the left, each corresponds to test data sample."), br(),
        span("Just check some of them and model will predict who is who for given dataset."), br(),
        span("This project is based on 'Predictive Machine Learning' course, and can be used as crib, So don't tell students of the course about this application")
    )
))