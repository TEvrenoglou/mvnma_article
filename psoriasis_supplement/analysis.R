#
# Install R package mvnma
#
# install.packages("remotes")
# remotes::install_github("TEvrenoglou/mvnma", ref = "main")


#
# Load libraries
#

library(mvnma)
library(tidyverse)
library(ggplot2)

#
# Load SUCRA values as obtained from Table 4 in Daly et al. (2020)
#

data <- read.csv("psoriasis_supplement/data.csv")
row.names(data) <- data$treat
data$treat <- NULL
dat <- data %>% 
  dplyr::select(SUCRA1, SUCRA2, SUCRA3, SUCRA4)
#
# Apply VIKOR to the SUCRA values
res <- mvnma:::vikor_internal(dat, weights =  NULL, v = 0.5)
res <- res %>% 
  mutate_if(is.numeric, round, 2)
res

#
# Calculate spie area for all treatments across outcomes
#

res1 <- mvnma:::spiechart_internal(dat,weights = NULL)
res1