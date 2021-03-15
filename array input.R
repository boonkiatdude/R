library('dplyr')
library('tidyverse')
library('rlist')
library('openxlsx')

mydata <- read.csv('mydata.csv')
query <- "ITE"

df.proj <- mydata %>%
  filter(str_detect(Project, query))
ids <- sort(c(unique(df.proj$Lift.ID)))
input.col <- c()

# Create input data frame
for (id in ids) {
  if (str_detect(id, '_')) {
    input.col <- append(input.col, sprintf('z%s', id))
  }
  else {
    input.col <- append(input.col, sprintf('x%s', id))
  }
}
input <- data.frame(matrix(ncol=length(ids), nrow=0))
input <- setNames(input, input.col)


# Append data into input data frame
for (id in ids) {
  row_count <- 1
  for (row in seq(length(df.proj$Lift.ID))) {
    if (df.proj$Lift.ID[row] == id) {
      input[row_count, match(id, ids)] = df.proj$Failure.Time[row]
      row_count <- row_count + 1
    }
  }
}
for (col in seq(length(input))) {
  assign(names(input)[col], input[, col][!is.na(input[, col])])
}


start.Date <- as.Date(df.proj$Start.Date[1], '%d-%b-%y')
end.Date <- as.Date('2019-12-31')
Tend <- julian(end.Date, start.Date)[1]

names(input)
X <- list(x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16)
Z <- c(z2_3_4_5_6_7_8_9_10_11_12_13_14_15_16)
