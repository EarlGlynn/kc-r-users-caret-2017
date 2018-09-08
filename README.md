# Using R's Caret Package for Machine Learning
Talk given on Sept. 9, 2017 to [KC R Users Group](https://www.meetup.com/Kansas-City-R-Users-Group/).

After giving an overview of the Caret Package, machine learning results using the caret package are used to compare performance of about a dozen models.  The Forensic Glass dataset from the MASS package is used in most of the examples.

## Powerpoint
    Caret-Machine-Learning.pptx
    Caret-Machine-Learning.pdf

## Machine Learning Examples using Caret

R Markdown and corresponding HTML files:
**Forensic-Glass-caret-FILE.Rmd** and **Forensic-Glass-caret-FILE.html**

**FILE**

    C50
    glmnet-SMOTE
    J48
    knn
    lda
    lda-YeoJohnson
    nb
    nb-ica
    nnet
    rf
    rf-SMOTE
    rpart
    svmRadial

See the Results Summary slide for a short description of each example.

## Related Examples

    caret-overview.Rmd and .html:  Caret Model Summary and examples of getting info about particular models.

    Forensic-Glass-Exploratory.Rmd and .html:  Examples of caret's visualizations.

    Forensic-Glass-Heatmap-Clustering.Rmd and .html:  Views of Forensic Glass data as a heatmap


## Examples moved

These files are now part of [Survey of Machine Learning Feature Selection Methods](https://github.com/EarlGlynn/kc-r-users-feature-selection) talk:

    Forensic-Glass-Correlation.Rmd and .html:  Correlation matrix of forensic glass predictors.

    Forensic-Glass-caret-glmnet.Rmd and .html:  Elastic-Net example.

    Forensic-Glass-Boruta.Rmd and .html:  Boruta 'All Relevant' Variables

    Forensic-Glass-SVD.Rmd and .html:  Singular Value Decomposition
    Forensic-Glass-PCA.Rmd and .html:  Principal Component Analysis (creates animated GIF with 3D view of first 3 PCs).

## Toy Shiny App

The ShinyCaret folder contains a Shiny app originally created in 2014 for the Johns Hopkins Coursera class, Developing Data Products.

The app is not very practical given the run time for some of the algorithms, but the example shows how caret can be used in a Shiny app.
