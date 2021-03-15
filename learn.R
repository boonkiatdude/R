LIBRARIES
# library(tidyverse)
# library(caret)
# library(ggplot2)
# library(dplyr)



READING DATA
# football_manager_dataset <- read.csv("Desktop\\dataset.csv", header=TRUE)
# dev.df <- read.csv("Desktop\\data\\survey_results_public.csv", header=TRUE)
# colSums(is.na(dev.df))
# dim(dev.df)



GLIMPSE DATA
# glimpse(iris.df)
# str(iris.df)



TABLES
# table(iris.df$Species)
# percentage = prop.table(table(iris.df$Species)) * 100
# cbind(freq=table(iris.df$Species), percentage=percentage)



GGPLOT2 & GRAPHING
# ggplot(iris.df, aes(x=Petal.Width, y=Petal.Length, col=Species)) +
#   geom_point() +
#   geom_smooth() +
#   theme(legend.position='top')
# featurePlot(x=dataset.df[,1:4], y=dataset.df[,5], plot='ellipse', auto.key=list(columns=3))
# par(mfrow=c(1,4))
# for (i in seq(4)) {
#   boxplot(iris.df[,i], main=names(iris.df[i]))
# }
# scales <- list(x=list(relation='free'), y=list(relation='free'))
# featurePlot(x=dataset.df[,1:4], y=dataset[,5], scales=scales)



DATA PARTITION
# ind <- sample(2, nrow(iris_norm), replace=TRUE, prob=c(2/3, 1/3))
# iris.train <- iris_norm[ind==1, ]
# iris.test <- iris_norm[ind==2, ]
# iris.trainLabels <- iris[ind==1, 5]
# iris.testLabels <- iris[ind==2, 5]

# ind <- createDataPartition(iris$Species, p=0.75, list=FALSE)
# iris.train <- iris[ind, ]
# iris.test <- iris[-ind, ]



SIMPLE LINEAR REGRESSION
# ind <- sample(2, nrow(cars), replace=TRUE, prob=c(0.8, 0.2))
# cars.train <- cars[ind==1,]
# cars.test <- cars[ind==2,]
# lmMod <- lm(dist~speed, cars.train)
# cars.pred <- predict(lmMod, cars.test)
# model_slr <- data.frame(cbind(cars.pred, cars.test$dist))
# cor(model_slr)



MACHINE LEARNING
# iris_pred <- knn(train=iris.train, test=iris.test, cl=iris.trainLabels, k=3)
# model_knn <- train(iris.train[,1:4], iris.train[,5], method="knn")
# iris_pred <- predict(object=model_knn, iris.test[, 1:4])
# confusionMatrix(iris_pred, iris.test[, 5])

# control <- trainControl(method='cv', number=10) #RUN ALGORITHMS USING 10-FOLD CROSS VALIDATION
# metric <- 'Accuracy'
# fit.lda <- train(Species~., data=dataset.df, method='lda', metric=metric, trControl=control)
# fit.cart <- train(Species~., data=dataset.df, method='rpart', metric=metric, trControl=control)
# fit.knn <- train(Species~., data=dataset.df, method='knn', metric=metric, trControl=control)
# fit.svm <- train(Species~., data=dataset.df, method='svmRadial', metric, trControl=control)
# fit.rd <- train(Species~., data=dataset.df, method='rf', metric=metric, trControl=control)
# results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))



AGGREGATION
# iris_norm <- apply(iris[1:4], 2, normalize)
# aggregate(uptake~Treatment+conc, co.df, mean)



APPLY FUNCTIONS
# tapply(co.df$uptake, co.df$Treatment, mean)
# apply(iris[,c(1:4)], mean) # RETURNS ROW MEANS
# sapplY(iris[,c(1:4)], mean) # RETURNS SIMPLIFIED RESULT OF COLUMN MEANS
# lapply(iris[,c(1:4)], mean) # RETURNS A LIST OF COLUMN MEANS



DPLYR
# by_tailnum <- filghts.df %>%
#   group_by(tailnum)
# py_dev.df <- dev.df %>%
#   select(Country, LanguageWorkedWith, ConvertedComp) %>%
#   filter(str_detect(LanguageWorkedWith, 'Python'))
# arrange(py_dev.df, Salary)



QUERIES
# which(dev.df$Project == my.str)
# which(colnames(dev.df) == my.str)



FUNCTIONS
# normalize <- function(x) {
#   num = x - min(x)
#   denom = max(x) - min(x)
#   return (num/denom)
# }










