library(meta)
library(tidyverse)
library(ggplot2)
library(ggsci)

data <- read.csv("Analysis_antidepressants/Results/all_TE.csv")

mods <- unique(data$mod)

out <- unique(data$outcome)

data$color <- NA

data$color <- ifelse(data$mod==mods[1],"blue",data$color)

data$color <- ifelse(data$mod==mods[2],"chartreuse3",data$color)

data$color <- ifelse(data$mod==mods[3],"black",data$color)

levs <- levels(as.factor(data$treat))

data$treat <- factor(data$treat,levels = levs)

## Create graph for Early Response

dat1 <- data %>% 
  filter(outcome == out[1]) %>% 
  filter(treat != "Placebo")


mod1 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat1,sm = "OR",common = FALSE)

filename1 <- "Analysis_antidepressants/Results/TE_Response.tiff"
tiff(filename = filename1,width = 2000,height = 3000,res = 300)
forest(mod1,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs Placebo",
       xlab = "Odds ratio",
       weight.study = "same",
       label.left = "Favors Placebo",
       label.right = "Favors Treatment",
       col.study = dat1$color,col.square = dat1$color,col.square.lines = dat1$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)
dev.off()

## Create graph for Early Remission

dat2 <- data %>% 
  filter(outcome == out[2]) %>% 
  filter(treat != "Placebo")


mod2 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat2,sm = "OR",common = FALSE)

filename2 <- "Analysis_antidepressants/Results/TE_Remission.tiff"
tiff(filename = filename2,width = 2000,height = 3000,res = 300)

forest(mod2,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs Placebo",
       xlab = "Odds ratio",
       weight.study = "same",
       label.left = "Favors Placebo",
       label.right = "Favors Treatment",
       col.study = dat2$color,col.square = dat2$color,col.square.lines = dat2$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)
dev.off()


## Create graph for Adverse Events

dat3 <- data %>% 
  filter(outcome == out[3]) %>% 
  filter(treat != "Placebo")


mod3 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat3,sm = "OR",common = FALSE)

filename3 <- "Analysis_antidepressants/Results/TE_AE.tiff"
tiff(filename = filename3,width = 2000,height = 3000,res = 300)
forest(mod3,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs Placebo",
       xlab = "Odds ratio",
       weight.study = "same",
       label.left = "Favors Treatment",
       label.right = "Favors Placebo",
       col.study = dat3$color,col.square = dat3$color,col.square.lines = dat3$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)
dev.off()

## Create graph for Loss to follow up

dat4 <- data %>% 
  filter(outcome == out[4]) %>% 
  filter(treat != "Placebo")


mod4 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat4,sm = "OR",common = FALSE)

filename4 <- "Analysis_antidepressants/Results/TE_Loss_to_follow_up.tiff"
tiff(filename = filename4,width = 2000,height = 3000,res = 300)

forest(mod4,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs Placebo",
       xlab = "Odds ratio",
       weight.study = "same",
       label.left = "Favors Treatment",
       label.right = "Favors Placebo",
       col.study = dat4$color,col.square = dat4$color,col.square.lines = dat4$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)

dev.off()

## Create graph for Loss to follow up_AE

dat5 <- data %>% 
  filter(outcome == out[5]) %>% 
  filter(treat != "Placebo")


mod5 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat5,sm = "OR",common = FALSE)

filename5 <- "Analysis_antidepressants/Results/TE_Loss_to_follow_up_AE.tiff"
tiff(filename = filename5,width = 2000,height = 3000,res = 300)

forest(mod5,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs Placebo",
       xlab = "Odds ratio",
       weight.study = "same",
       label.left = "Favors Treatment",
       label.right = "Favors Placebo",
       col.study = dat5$color,col.square = dat5$color,col.square.lines = dat5$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)

dev.off()


################# 

 