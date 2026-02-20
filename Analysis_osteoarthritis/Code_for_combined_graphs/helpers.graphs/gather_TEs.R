
## Read model results

mvNMA.standard <- readRDS(paste(getwd(),"/Analysis_osteoarthritis/Model_files/mvNMA.standard.rds",sep = ""))
mvNMA.DM <- readRDS(paste(getwd(),"/Analysis_osteoarthritis/Model_files/mvNMA.DM.rds",sep = ""))
net1 <- readRDS(paste(getwd(),"/Analysis_osteoarthritis/Model_files/net1.rds",sep = ""))
net2 <- readRDS(paste(getwd(),"/Analysis_osteoarthritis/Model_files/net2.rds",sep = ""))

# Pain
res1_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Pain$basic_estimates),
                                  "est" = mvNMA.standard$Pain$basic_estimates$mean,
                                  "se" = mvNMA.standard$Pain$basic_estimates$sd)
res1_mvnma_TE$mod <- "mvNMA(standard)"
#
res1_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Pain$basic_estimates),
                                  "est" = mvNMA.DM$Pain$basic_estimates$mean,
                                  "se" = mvNMA.DM$Pain$basic_estimates$sd)
res1_mvnmaDM_TE$mod <- "mvNMA(DM)"
#
res1_nma_TE <- cbind.data.frame("treat" = names(net1$TE.random[,which(colnames(net1$TE.random)=="No treatment")]),
                                "est" =  unname(net1$TE.random[,which(colnames(net1$TE.random)=="No treatment")]),
                                "se" =  unname(net1$seTE.random[,which(colnames(net1$seTE.random)=="No treatment")]))    
#                                         
res1_nma_TE$mod <- "NMA"                                              
res1 <- rbind.data.frame(res1_mvnma_TE,res1_mvnmaDM_TE,res1_nma_TE)
res1$outcome = "Pain"

# Disability

res2_mvnma_TE <- cbind.data.frame("treat" = row.names(mvNMA.standard$Disability$basic_estimates),
                                  "est" = mvNMA.standard$Disability$basic_estimates$mean,
                                  "se" = mvNMA.standard$Disability$basic_estimates$sd)

res2_mvnma_TE$mod <- "mvNMA(standard)"
res2_mvnmaDM_TE <- cbind.data.frame("treat" = row.names(mvNMA.DM$Disability$basic_estimates),
                                    "est" = mvNMA.DM$Disability$basic_estimates$mean,
                                    "se" = mvNMA.DM$Disability$basic_estimates$sd)
res2_mvnmaDM_TE$mod <- "mvNMA(DM)"
res2_nma_TE <- cbind.data.frame("treat" = names(net2$TE.random[,which(colnames(net2$TE.random)=="No treatment")]),
                                "est" =  unname(net2$TE.random[,which(colnames(net2$TE.random)=="No treatment")]),
                                "se" =  unname(net2$seTE.random[,which(colnames(net2$seTE.random)=="No treatment")]))   
res2_nma_TE$mod <- "NMA"                                              
res2 <- rbind.data.frame(res2_mvnma_TE,res2_mvnmaDM_TE,res2_nma_TE)
res2$outcome = "Disability"

### Combine everything

res_all <- rbind.data.frame(res1,res2)
write.csv(res_all,paste(getwd(),"/Analysis_osteoarthritis/Results/all_TE.csv",sep = ""),row.names = FALSE)
   
