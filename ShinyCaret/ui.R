# Shiny Caret Lab:  shinyUI.
# Project for Coursera "Developing Data Products" class, July 2014.
# Earl F Glynn

# Shiny Caret is an interactive interface for using various machine
# learning methods from the caret package with an image segementation
# problem.

# Starting point:  http://shinygallery.com/apps/example-06-tabsets.html

library(shiny)

# Is there a better way to store HTML for Help tab?
HELP.HTML <- paste(
  'This Shiny app uses techniques described in the Coursera <a',
  'href="https://www.coursera.org/course/predmachlearn"><i>Practical',
  'Machine Learning</i></a> class.<br>',
  '<hr> <b>Concept</b>:&nbsp; Use interactive interface to select',
  'machine learning parameters for the <a',
  'href="http://caret.r-forge.r-project.org/">caret package</a> to',
  'solve a problem involving image segmentation.&nbsp; This interactive',
  'interface may provide insights on best machine learning approach for',
  'a given problem.&nbsp; Future:&nbsp; Perhaps with small set of',
  'metadata, the approach could be used with a variety of problems and',
  'datasets.  Add tab for receiver operating characteristic curve.<br><br>',
  'To see data:  library(AppliedPredictiveModeling) and then',
  'data(segmentationOriginal).<br><br>',
  'Some variables with near-zero variance and/or high correlation to',
  'other variables have been removed.',
  '<hr> <b>Inputs</b>:&nbsp; At the left, select various preprocessing',
  'options and caret method.<br>',
  '<br>',
  '<b>Fit tab</b>:&nbsp; Output from caret train function applied to',
  'subset of original training data.<br>',
  '<br>',
  '<b>Confusion Matrix tab</b>:&nbsp; Confusion matrix, sensitivity,',
  'specificity and related data from caret confusionMatrix function',
  'applied to an out-of-sample validation dataset. Use to compare',
  'models.&nbsp; [A final test set is reserved and is not used in the',
  'current implementation.]<br>',
  '<br>',
  '<b>Variable Importance tab</b>:&nbsp; dotPlot using output from caret varImp',
  'function that gives importance rankings of variables included in the',
  'fit.<br>',
  '<hr> <b>Reference</b>:&nbsp; Andrew A Hill, Peter LaPan, Yizheng Li',
  'and Steve Haney.&nbsp; <a',
  'href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2080643/">Impact',
  'of image segmentation on high-content screening data quality for',
  'SK-BR-3 cells</a>, <i>BMC Bioinformatics</i>, Sept. 2007.')

# Define UI for caret package laboratory
shinyUI(fluidPage(

  # Application title
  titlePanel("Shiny Caret Lab:  Image Segmentation Data"),

  # Sidebar with controls.  Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
      h4("Preprocessing"),
      checkboxInput("centerscale", "Center and Scale Variables", TRUE),
      br(),
      sliderInput("trainpercent",
                  "Fraction of data that goes to training",
                  value = 0.75, step = 0.05, min = 0.50, max = 0.80),
      br(),
      numericInput("randomseed", "Random Seed", 19937, min=100, max=1000000),
      HTML("<hr>"),
      radioButtons("method", h4("Caret Model"),
                   c("Linear Discriminant Analysis (lda) [3 sec]"          = "lda",
                     "Classification and Regression Trees (rpart) [6 sec]" = "rpart",
                     "Bagged CART (treebag) [90 sec]"                      = "treebag",
                     "Stochastic Gradient Boosting (gbm) [20 sec]"         = "gbm",
                     "Random Forest (rf) [100 sec]"                        = "rf",
                     "Support Vector Machines with Polynomial Kernel (svmPoly) [100 sec]"  = "svmPoly"
                     )),
      h6(paste("Note:  Approximate processing times above are for a 2.4 GHz Intel i7-3630QM CPU.",
               "All models work on a local server, but only lda and rpart work at shinyapps.io.")),
      HTML("<hr>")
    ),

    # Tab panels:
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Fit",                  verbatimTextOutput("fit")),
        tabPanel("Confusion Matrix",     verbatimTextOutput("confusion")),
        tabPanel("Variable Importance",  plotOutput("dotplot")),
        tabPanel("Help",                 HTML(HELP.HTML) )
      )
    )
  )
))

