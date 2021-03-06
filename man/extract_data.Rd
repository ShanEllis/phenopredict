% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_data.R
\name{extract_data}
\alias{extract_data}
\title{Extracts data for predictions using regions from select_region()}
\usage{
extract_data(newexpression = NULL, newregiondata = NULL,
  predictordata = NULL)
}
\arguments{
\item{newexpression}{expression data set from which to extract coverage data
\code{expression}}

\item{newregiondata}{GRanges object containing region info
for expression data \code{newregiondata}}

\item{predictordata}{object output from build_predictor \code{predictordata}}
}
\value{
covmat_test An n x m data.frame of the selected regions from the
data set specified by `expression`
}
\description{
This function extracts regions of interest from data set on which you want
to make predictions.
}
\examples{

library('GenomicRanges')
library('dplyr')

## Make up some some region data
regions <- GRanges(seqnames = 'chr2', IRanges(
     start = c(28971710:28971712, 29555081:29555083, 29754982:29754984),
     end = c(29462417:29462419, 29923338:29923340, 29917714:29917716)))

## make up some expression data for 9 rows and 30 people
data(sysdata, package='phenopredict')
## includes R object 'cm'
exp= cm[1:length(regions),1:30]

## generate some phenotype information
sex = as.data.frame(rep(c("male","female"),each=15))
age = as.data.frame(sample(1:100,30))
pheno = dplyr::bind_cols(sex,age)
colnames(pheno) <- c("sex","age")

## select regions to be used to build the predictor
inputdata <- filter_regions(expression=exp, regiondata=regions,
	phenodata=pheno, phenotype="sex",
	covariates=NULL,type="factor", numRegions=2)

## build phenotype predictor
predictor<-build_predictor(inputdata=inputdata ,phenodata=pheno,
	phenotype="sex", covariates=NULL,type="factor", numRegions=2)

## determine resubstitution error
## carry out prediction in training data set
predictions_test<-test_predictor(inputdata=inputdata ,phenodata=pheno,
	phenotype="sex", covariates=NULL,type="factor",predictordata=predictor)

## generate new expressiondata set for prediction
exp_new= cm_new[1:length(regions),1:30]
## extract test data
test_data<-extract_data(newexpression=exp_new,
newregiondata=predictor$regiondata, predictordata=predictor)
}
\keyword{data}
\keyword{phenotype,}
\keyword{prediction,}
\keyword{set}
