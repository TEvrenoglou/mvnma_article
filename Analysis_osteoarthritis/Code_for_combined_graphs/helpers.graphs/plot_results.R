library(meta)
library(tidyverse)
library(ggplot2)
library(ggsci)
#
data <- read.csv("Analysis_osteoarthritis/Results/all_TE.csv")
mods <- unique(data$mod)
out <- unique(data$outcome)
#
data$color <- NA
data$color <- ifelse(data$mod==mods[1],"blue",data$color)
data$color <- ifelse(data$mod==mods[2],"chartreuse3",data$color)
data$color <- ifelse(data$mod==mods[3],"black",data$color)
levs <- levels(as.factor(data$treat))
data$treat <- factor(data$treat,levels = levs)

# Create graph for Pain
dat1 <- data %>% 
  filter(outcome == out[1]) %>% 
  filter(treat != "No treatment")
#
mod1 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat1,sm = "MD",common = FALSE)
#
filename1 <- "Analysis_osteoarthritis/Results/TE_Pain.tiff"
tiff(filename = filename1,width = 2000,height = 3700,res = 300)
forest(mod1,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs No treatment",
       xlab = "Mean difference",
       weight.study = "same",
       label.right = "Favors No treatment",
       label.left = "Favors Treatment",
       col.study = dat1$color,col.square = dat1$color,col.square.lines = dat1$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)
dev.off()
#
# Create graph for Disability
dat2 <- data %>% 
  filter(outcome == out[2]) %>% 
  filter(treat != "No treatment")
#
mod2 <- metagen(TE=est,seTE=se,subgroup = treat,studlab = mod,data = dat2,sm = "MD",common = FALSE)
#
filename2 <- "Analysis_osteoarthritis/Results/TE_Disability.tiff"
tiff(filename = filename2,width = 2000,height = 3700,res = 300)
forest(mod2,subgroup.name = "",
       header.line = TRUE,
       smlab = "",
       leftcols = "studlab",
       leftlabs = "Comparison\nTreatment vs No treatment",
       xlab = "Mean difference",
       weight.study = "same",
       label.right = "Favors No treatment",
       label.left = "Favors Treatment",
       col.study = dat2$color,col.square = dat2$color,col.square.lines = dat2$color,
       addrow.overall = FALSE,hetstat = FALSE,overall = FALSE,subgroup = FALSE,
       subgroup.hetstat = FALSE,test.subgroup = FALSE)
dev.off()
