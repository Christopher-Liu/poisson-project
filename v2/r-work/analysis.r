pima <- read.table(file='~/Downloads/610/video-project/tex-folder/v2/r-work/cleanPIMA.txt', header=TRUE)
attach(pima)

diabetesPos <- ifelse(test == 'positive', 1, 0)

pois.reg <- glm(diabetesPos ~ pregnancies + glucose, family = poisson(link = 'log'), data = pima)

library(sandwich)
library(lmtest)

coeftest(pois.reg, vcov = sandwich)