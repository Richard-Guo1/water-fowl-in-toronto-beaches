#### Preamble ####
# Purpose: Tests the analysis data for sanity
# Author: Richard Guo
# Date: 26 November 2024 
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # The `tidyverse` and 'testthat' packages must be installed and loaded
  # 03-clean_data.R must have been run


#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- readRDS(here::here("data/02-analysis_data/analysis_data.rds"))

#### Test data ####
# Test that the dataset has 12 columns
test_that("dataset has 12 columns", {
  expect_equal(ncol(analysis_data), 12)
})

# Test that the 'airTemp' column is double type
test_that("'airTemp' is double", {
  expect_type(analysis_data$airTemp, "double")
})

# Test that the 'waterFowl' column is integer type
test_that("'waterFowl' is integer", {
  expect_true(all(analysis_data$waterFowl == floor(analysis_data$waterFowl)))
})

# Test that there are no negative values in the 'waterFowl' column
test_that("no negative values in 'waterFowl'", {
  expect_true(all(analysis_data$waterFowl >= 0))
})


# Test that the 'year' column is integer type
test_that("'year' is integer", {
  expect_true(all(analysis_data$year == floor(analysis_data$year)))
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that the Bluffer's Bay Beach base case exists
test_that("base case exists", {
  expect_true(!is_empty(analysis_data[analysis_data$isCentreIsland == 0 & 
                                        analysis_data$isCherry == 0 &
                                        analysis_data$isGibraltarPoint == 0 &
                                        analysis_data$isHanlansPoint == 0 &
                                        analysis_data$isKewBalmy == 0 &
                                        analysis_data$isMarieCurtis == 0 &
                                        analysis_data$isSunnyside == 0 &
                                        analysis_data$isWardsIsland == 0 &
                                        analysis_data$isWoodbine == 0,]))
})

# Test that Centre Island Beach has datapoints
test_that("'Centre Island Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isCentreIsland == 1,]))
})

# Test that Cherry Beach has datapoints
test_that("'Cherry Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isCherry == 1,]))
})

# Test that Gibraltar Point Beach has datapoints
test_that("'Gibraltar Point Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isGibraltarPoint == 1,]))
})

# Test that Hanlan's Point Beach has datapoints
test_that("'Hanlan's Point Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isHanlansPoint == 1,]))
})

# Test that Kew Balmy Beach has datapoints
test_that("'Kew Balmy Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isKewBalmy == 1,]))
})

# Test that Marie Curtis Beach has datapoints
test_that("'Marie Curtis Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isMarieCurtis == 1,]))
})

# Test that Sunnyside Beach has datapoints
test_that("'Sunnyside Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isSunnyside == 1,]))
})

# Test that Ward's Island Beach has datapoints
test_that("'Ward's Island Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isWardsIsland == 1,]))
})

# Test that Woodbine Beach has datapoints
test_that("'Woodbine Beach' has observations", {
  expect_true(!is_empty(analysis_data[analysis_data$isWoodbine == 1,]))
})

# Test that beach indicator variables are exclusive
test_that("Indicator dummies are exclusive", {
  expect_true(all(sum(analysis_data[,4:12] <= 1)))
})

