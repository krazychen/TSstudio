% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/forecast_tools.R
\name{test_forecast}
\alias{test_forecast}
\alias{fortest_ly}
\title{Visualize of the Fitted and the Forecasted vs the Actual Values}
\usage{
test_forecast(actual, forecast.obj, train = NULL, test, Ygrid = FALSE,
  Xgrid = FALSE, hover = TRUE)
}
\arguments{
\item{actual}{The full time series object (support "ts", "zoo" and "xts" formats)}

\item{forecast.obj}{The forecast output of the training set with horizon 
align to the length of the testing (support forecasted objects from the “forecast” package)}

\item{train}{Training partition, a subset of the first n observation in the series (not requiredthed)}

\item{test}{The testing (hold-out) partition}

\item{Ygrid}{Logic,show the Y axis grid if set to TRUE}

\item{Xgrid}{Logic,show the X axis grid if set to TRUE}

\item{hover}{If TRUE add tooltip with information about the model accuracy}
}
\description{
Visualize the fitted values of the training set and the forecast values of the testing set against the actual values of the series
}
\examples{
\dontrun{
library(forecast)
data(USgas)

# Set the horizon of the forecast
h <- 12

# split to training/testing partition
split_ts <- ts_split(USgas, sample.out  = h)
train <- split_ts$train
test <- split_ts$test

# Create forecast object
fc <- forecast(auto.arima(train, lambda = BoxCox.lambda(train)), h = h)

# Plot the fitted and forecasted vs the actual values
test_forecast(actual = USgas, forecast.obj = fc, test = test)
}
}
