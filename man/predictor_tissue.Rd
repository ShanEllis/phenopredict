% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{predictor_tissue}
\alias{predictor_tissue}
\title{Prebuilt tissue predictor}
\format{A list for each predicted phenotype contining 
\describe{
  \item{coefEsts}{data.frame, prediction estimates}
  \item{trainingProbes}{vector, probes to be extracted}
  \item{regiondata}{GRanges, genomic ranges region information}
}}
\usage{
predictor_tissue
}
\description{
This object includes the output from build_predictor 
for tissue prediction
}
\keyword{datasets}
